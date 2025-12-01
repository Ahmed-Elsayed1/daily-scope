import '../../domain/entities/auth_user.dart';

class AuthSessionModel {
  const AuthSessionModel({
    required this.userId,
    required this.email,
    required this.hashedSecret,
    required this.displayName,
    required this.createdAt,
  });

  final String userId;
  final String email;
  final String hashedSecret;
  final String displayName;
  final DateTime createdAt;

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'email': email,
        'hashed_secret': hashedSecret,
        'display_name': displayName,
        'created_at': createdAt.toIso8601String(),
      };

  AuthUser toEntity() => AuthUser(
        id: userId,
        email: email,
        displayName: displayName,
      );

  factory AuthSessionModel.fromMap(Map<String, dynamic> map) {
    return AuthSessionModel(
      userId: map['user_id'] as String,
      email: map['email'] as String,
      hashedSecret: map['hashed_secret'] as String,
      displayName: map['display_name'] as String? ?? 'Explorer',
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}
