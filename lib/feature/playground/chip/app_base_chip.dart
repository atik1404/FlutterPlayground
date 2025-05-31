                                        import 'package:flutter/material.dart';

enum AppChipShape { rectangle, capsule, rounded }

enum AppChipTone { outline, fill }

typedef AppIconBuilder = Widget Function(Color color);

class AppBaseChip extends StatelessWidget {
  final VoidCallback? onTap;
  final AppIconBuilder? leading;
  final AppIconBuilder? trailing;
  final String label;
  final TextStyle? labelStyle;
  final bool selected;
  final bool outline;
  final AppChipShape shape;
  final AppChipTone tone;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final bool enableRippleEffect;

  const AppBaseChip({
    super.key,
    required this.label,
    this.onTap,
    this.leading,
    this.trailing,
    this.labelStyle,
    this.selected = false,
    this.outline = false,
    this.shape = AppChipShape.rounded,
    this.tone = AppChipTone.outline,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor = Colors.blueAccent,
    this.padding,
    this.height,
    this.width,
    this.borderRadius,
    this.enableRippleEffect = true,
  });

  Color _resolveBackground(BuildContext context) {
    if (backgroundColor != null) return backgroundColor!;
    switch (tone) {
      case AppChipTone.fill:
        return selected
            ? Theme.of(context).colorScheme.primary.withAlpha(20)
            : Colors.white;
      case AppChipTone.outline:
        return Colors.transparent;
    }
  }

  Color _resolveForeground(BuildContext context) {
    if (foregroundColor != null) return foregroundColor!;
    return Theme.of(context).colorScheme.primary;
  }

  Color _resolveBorderColor(BuildContext context) {
    if (borderColor != null) return borderColor!;
    return _resolveForeground(context);
  }

  BorderRadiusGeometry _resolveBorderRadius() {
    if (borderRadius != null) return borderRadius!;
    switch (shape) {
      case AppChipShape.capsule:
        return BorderRadius.circular(50);
      case AppChipShape.rounded:
        return BorderRadius.circular(12);
      case AppChipShape.rectangle:
        return BorderRadius.circular(4);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _resolveBackground(context);
    final fgColor = _resolveForeground(context);
    final brColor = _resolveBorderColor(context);
    final radius = _resolveBorderRadius();

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          leading!(fgColor),
          const SizedBox(width: 6),
        ],
        Flexible(
          child: Text(
            label,
            style: labelStyle ??
                TextStyle(
                  fontWeight: FontWeight.w500,
                  color: fgColor,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onTap,
            child: trailing!(fgColor),
          ),
        ],
      ],
    );

    content = Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: content,
    );

    Widget chip = Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: outline ? Colors.transparent : bgColor,
        border: Border.all(
          color: outline ? brColor : Colors.transparent,
          width: 1,
        ),
        borderRadius: radius,
      ),
      child: content,
    );

    if (onTap != null) {
      chip = Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          onTap: onTap,
          splashColor: enableRippleEffect ? null : Colors.transparent,
          child: chip,
        ),
      );
    }

    return chip;
  }
}
