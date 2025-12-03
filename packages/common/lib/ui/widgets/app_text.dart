import 'package:flutter/material.dart';

/// A reusable text widget that wraps Flutter's Text widget
/// and applies the app's design system consistently.
///
/// This widget should be used throughout the app instead of the raw Text widget
/// to ensure consistent styling and support for localization.
class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textDirection,
    this.semanticsLabel,
  });

  /// Large headline text (Display Large)
  factory AppText.displayLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return _AppTextVariant(
      text,
      variant: _AppTextVariantType.displayLarge,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      key: key,
    );
  }

  /// Medium headline text (Headline Medium)
  factory AppText.headlineMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return _AppTextVariant(
      text,
      variant: _AppTextVariantType.headlineMedium,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      key: key,
    );
  }

  /// Title text (Title Medium)
  factory AppText.titleMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return _AppTextVariant(
      text,
      variant: _AppTextVariantType.titleMedium,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      key: key,
    );
  }

  /// Body text (Body Medium) - Default
  factory AppText.bodyMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return _AppTextVariant(
      text,
      variant: _AppTextVariantType.bodyMedium,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      key: key,
    );
  }

  /// Small body text (Body Small)
  factory AppText.bodySmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return _AppTextVariant(
      text,
      variant: _AppTextVariantType.bodySmall,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      key: key,
    );
  }

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextDirection? textDirection;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      semanticsLabel: semanticsLabel,
    );
  }
}

enum _AppTextVariantType {
  displayLarge,
  headlineMedium,
  titleMedium,
  bodyMedium,
  bodySmall,
}

class _AppTextVariant extends AppText {
  const _AppTextVariant(
    super.text, {
    required this.variant,
    super.key,
    super.style,
    super.textAlign,
    super.maxLines,
    super.overflow,
  });

  final _AppTextVariantType variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    TextStyle? variantStyle;

    switch (variant) {
      case _AppTextVariantType.displayLarge:
        variantStyle = theme.displayLarge;
        break;
      case _AppTextVariantType.headlineMedium:
        variantStyle = theme.headlineMedium;
        break;
      case _AppTextVariantType.titleMedium:
        variantStyle = theme.titleMedium;
        break;
      case _AppTextVariantType.bodyMedium:
        variantStyle = theme.bodyMedium;
        break;
      case _AppTextVariantType.bodySmall:
        variantStyle = theme.bodySmall;
        break;
    }

    return Text(
      text,
      style: variantStyle?.merge(style) ?? style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
