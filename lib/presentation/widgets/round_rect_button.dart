import 'package:flutter/material.dart';
import 'package:sake/theme/app_color_scheme.dart';

class RoundRectButton extends StatelessWidget {
  const RoundRectButton({
    required this.title,
    this.onPressed,
    this.isActive = true,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive
            ? AppColorSchemes.lightColorScheme.primary
            : AppColorSchemes.lightColorScheme.outline,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextButton(
        onPressed: isActive ? onPressed : null,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
