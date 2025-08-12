abstract class AuthResponse {
  final bool success;
  final String message;
  final String? token;
  final String? refreshToken;
  final DateTime? expiresAt;

  const AuthResponse({
    required this.success,
    required this.message,
    this.token,
    this.refreshToken,
    this.expiresAt,
  });
}
