import '../entities/auth_user.dart';

/// Authentication status enum
enum AuthStatus {
  /// Initial unknown state
  unknown,
  
  /// User is not authenticated
  unauthenticated,
  
  /// Currently authenticating (loading state)
  authenticating,
  
  /// User is authenticated
  authenticated,
  
  /// Authentication failed
  failure,
}

/// Repository interface for authentication operations.
/// 
/// Defines the contract for authentication-related data operations
/// including login, registration, and session management.
abstract class AuthRepository {
  /// Returns the currently authenticated user, or null if not authenticated
  Future<AuthUser?> currentUser();
  
  /// Registers a new user with email and password
  /// 
  /// Throws an exception if registration fails (e.g., user already exists).
  Future<AuthUser> registerWithEmailPassword({
    required String email,
    required String password,
  });
  
  /// Logs in a user with email and password
  /// 
  /// Throws an exception if login fails (e.g., invalid credentials).
  Future<AuthUser> loginWithEmailPassword({
    required String email,
    required String password,
  });
  
  /// Logs out the current user
  Future<void> logout();
}
