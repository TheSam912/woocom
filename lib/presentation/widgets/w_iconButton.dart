import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class wIconButton extends StatefulWidget {
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
  State<wIconButton> createState() => _wIconButtonState();
}

class _wIconButtonState extends State<wIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isHovered ? Colors.grey[200] : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            widget.iconPath,
            width: widget.size ?? 24.r,
            height: widget.size ?? 24.r,
            color: widget.color ?? Colors.black,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
