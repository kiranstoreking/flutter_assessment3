import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../../data/models/auth_response_model.dart';
import '../../data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../../core/error/failures.dart';
import '../../../core/utils/logger.dart';

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

class AuthViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final RegisterUseCase _registerUseCase;

  AuthViewModel({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
    required RegisterUseCase registerUseCase,
  })  : _loginUseCase = loginUseCase,
        _logoutUseCase = logoutUseCase,
        _registerUseCase = registerUseCase;

  // State variables
  AuthStatus _status = AuthStatus.initial;
  UserModel? _currentUser;
  String? _authToken;
  String? _refreshToken;
  String? _errorMessage;
  bool _isLoading = false;

  // Getters
  AuthStatus get status => _status;
  UserModel? get currentUser => _currentUser;
  String? get authToken => _authToken;
  String? get refreshToken => _refreshToken;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _status == AuthStatus.authenticated && _currentUser != null;

  // Initialize authentication state
  Future<void> initializeAuth() async {
    try {
      _setStatus(AuthStatus.loading);
      
      // Check if user is already logged in (from local storage)
      // This would typically check SharedPreferences or secure storage
      // For now, we'll just set to unauthenticated
      
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate async operation
      _setStatus(AuthStatus.unauthenticated);
      
    } catch (e, stackTrace) {
      AppLogger.error('Failed to initialize auth', e, stackTrace);
      _setError('Failed to initialize authentication');
    }
  }

  // Login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      final result = await _loginUseCase.execute(
        LoginParams(email: email, password: password),
      );

      return result.fold(
        (failure) {
          _handleFailure(failure);
          return false;
        },
        (authResponse) {
          _handleSuccessfulAuth(authResponse);
          return true;
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Login error', e, stackTrace);
      _setError('An unexpected error occurred during login');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Register
  Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      final result = await _registerUseCase.execute(
        RegisterParams(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        ),
      );

      return result.fold(
        (failure) {
          _handleFailure(failure);
          return false;
        },
        (authResponse) {
          _handleSuccessfulAuth(authResponse);
          return true;
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error('Register error', e, stackTrace);
      _setError('An unexpected error occurred during registration');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      _setLoading(true);

      // Call logout use case
      final result = await _logoutUseCase.execute(NoParams());
      
      result.fold(
        (failure) {
          AppLogger.warning('Logout failure: ${failure.message}');
          // Even if logout fails on server, we should clear local state
        },
        (_) {
          AppLogger.info('Logout successful');
        },
      );

      // Clear local authentication state
      _clearAuthState();
      
    } catch (e, stackTrace) {
      AppLogger.error('Logout error', e, stackTrace);
      // Even if there's an error, clear local state
      _clearAuthState();
    } finally {
      _setLoading(false);
    }
  }

  // Refresh token
  Future<bool> refreshToken() async {
    if (_refreshToken == null) {
      _setError('No refresh token available');
      return false;
    }

    try {
      _setLoading(true);
      _clearError();

      // This would typically call a refresh token API
      // For now, we'll simulate it
      await Future.delayed(const Duration(milliseconds: 1000));
      
      // If refresh fails, logout user
      _setError('Token refresh failed. Please login again.');
      await logout();
      return false;
      
    } catch (e, stackTrace) {
      AppLogger.error('Token refresh error', e, stackTrace);
      _setError('Failed to refresh token');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Clear error message
  void clearError() {
    _clearError();
  }

  // Private methods
  void _setStatus(AuthStatus status) {
    _status = status;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _status = AuthStatus.error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    if (_status == AuthStatus.error) {
      _status = _currentUser != null ? AuthStatus.authenticated : AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  void _handleSuccessfulAuth(AuthResponseModel authResponse) {
    _currentUser = authResponse.user;
    _authToken = authResponse.token;
    _refreshToken = authResponse.refreshToken;
    _status = AuthStatus.authenticated;
    _clearError();
    
    AppLogger.info('Authentication successful for user: ${_currentUser?.email}');
    
    // Store tokens in secure storage (would be implemented here)
    // _storeTokens(authResponse.token, authResponse.refreshToken);
    
    notifyListeners();
  }

  void _handleFailure(Failure failure) {
    String message;
    
    switch (failure.runtimeType) {
      case ValidationFailure:
        message = failure.message;
        break;
      case AuthenticationFailure:
        message = failure.message;
        break;
      case NetworkFailure:
        message = 'Network error. Please check your connection.';
        break;
      case ServerFailure:
        message = 'Server error. Please try again later.';
        break;
      default:
        message = failure.message;
    }
    
    _setError(message);
    AppLogger.warning('Authentication failure: ${failure.message}');
  }

  void _clearAuthState() {
    _currentUser = null;
    _authToken = null;
    _refreshToken = null;
    _status = AuthStatus.unauthenticated;
    _clearError();
    
    // Clear stored tokens (would be implemented here)
    // _clearStoredTokens();
    
    notifyListeners();
  }

  @override
  void dispose() {
    AppLogger.debug('AuthViewModel disposed');
    super.dispose();
  }
}

// Provider extension for easier access
extension AuthViewModelProvider on BuildContext {
  AuthViewModel get authViewModel => Provider.of<AuthViewModel>(this, listen: false);
  
  AuthViewModel get authViewModelListen => Provider.of<AuthViewModel>(this, listen: true);
}
