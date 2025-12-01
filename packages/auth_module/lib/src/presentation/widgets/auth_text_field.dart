import 'package:flutter/material.dart';

/// Reusable text field widget for authentication forms.
/// 
/// Supports text input with optional password obscuring, icons, and validation.
class AuthTextField extends StatefulWidget {
  /// Creates an auth text field
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType,
    this.prefixIcon,
    this.validator,
    this.enabled = true,
  });

  /// Text editing controller
  final TextEditingController controller;
  
  /// Label text for the field
  final String label;
  
  /// Whether this is a password field (shows/hides text)
  final bool isPassword;
  
  /// Keyboard type for input
  final TextInputType? keyboardType;
  
  /// Optional prefix icon
  final IconData? prefixIcon;
  
  /// Optional custom validator
  final String? Function(String?)? validator;
  
  /// Whether the field is enabled
  final bool enabled;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.prefixIcon != null 
            ? Icon(widget.prefixIcon) 
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      obscureText: widget.isPassword && _obscureText,
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      validator: widget.validator ?? 
        (value) => value == null || value.isEmpty ? 'This field is required' : null,
    );
  }
}
