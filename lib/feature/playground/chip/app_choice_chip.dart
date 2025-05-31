import 'package:flutter/material.dart';

class AppChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;
  final String? leadingText;
  final Color? color;
  final bool outline;
  final Widget? trailing;
  final VoidCallback? onTrailingTap;
  final AppChipTone? appChipTone;
  final AppChipType? appChipType;
  final IconData? icon;

  const AppChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.leadingText,
    this.color,
    this.outline = false,
    this.trailing,
    this.onTrailingTap,
    this.appChipTone = AppChipTone.rounded,
    this.appChipType = AppChipType.filled,
    this.icon = null,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? Theme.of(context).primaryColor;
    return InputChip(
      label: Text(label),
      avatar: icon != null
          ? Icon(
              icon,
              color: selected ? Colors.white : chipColor,
            )
          : null,
      selected: selected,
      selectedColor: chipColor.withAlpha(60),
      side: outline
          ? BorderSide(color: chipColor, width: 1.5)
          : BorderSide(color: Colors.transparent, width: 0),
      backgroundColor: outline ? Colors.transparent : Colors.blue.withAlpha(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          appChipTone == AppChipTone.capsule
              ? 50.0
              : appChipTone == AppChipTone.rounded
                  ? 10.0
                  : 0.0,
        ),
      ),
      onSelected: onSelected,
      deleteIcon: trailing,
      onDeleted: onTrailingTap,
    );
  }
}

enum AppChipTone {
  capsule,
  rounded,
  square,
}

enum AppChipType {
  filled,
  outline,
}
