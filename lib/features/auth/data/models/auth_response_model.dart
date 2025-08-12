import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final bool success;
  final String message;
  final String? token;
  final String? refreshToken;
  final UserModel? user;
  final DateTime? expiresAt;
  final Map<String, dynamic>? metadata;

  const AuthResponseModel({
    required this.success,
    required this.message,
    this.token,
    this.refreshToken,
    this.user,
    this.expiresAt,
    this.metadata,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);

  // Check if authentication was successful
  bool get isAuthenticated => success && token != null && user != null;

  // Check if token is expired
  bool get isTokenExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  // Check if token will expire soon (within 5 minutes)
  bool get isTokenExpiringSoon {
    if (expiresAt == null) return false;
    final fiveMinutesFromNow = DateTime.now().add(const Duration(minutes: 5));
    return fiveMinutesFromNow.isAfter(expiresAt!);
  }

  // Get remaining time until token expires
  Duration? get remainingTime {
    if (expiresAt == null) return null;
    final now = DateTime.now();
    if (now.isAfter(expiresAt!)) return Duration.zero;
    return expiresAt!.difference(now);
  }

  // Copy with method
  AuthResponseModel copyWith({
    bool? success,
    String? message,
    String? token,
    String? refreshToken,
    UserModel? user,
    DateTime? expiresAt,
    Map<String, dynamic>? metadata,
  }) {
    return AuthResponseModel(
      success: success ?? this.success,
      message: message ?? this.message,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user,
      expiresAt: expiresAt ?? this.expiresAt,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthResponseModel &&
        other.success == success &&
        other.token == token &&
        other.user == user;
  }

  @override
  int get hashCode {
    return success.hashCode ^ token.hashCode ^ user.hashCode;
  }

  @override
  String toString() {
    return 'AuthResponseModel(success: $success, message: $message, user: ${user?.email})';
  }
}
