import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class wIconButton extends StatelessWidget {
  final String iconPath;
  final double? size;
  final Color? color;
  final VoidCallback? onTap;

  const wIconButton({
    super.key,
    required this.iconPath,
    this.size,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        iconPath,
        width: size ?? 24.r,
        height: size ?? 24.r,
        color: color ?? Colors.black,
        fit: BoxFit.contain,
      ),
    );
  }
}
