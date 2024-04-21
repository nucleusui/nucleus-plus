import 'package:flutter/material.dart';

class PrimaryInkWell extends StatelessWidget {
  const PrimaryInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.splashColor = Colors.transparent,
    this.borderRadius,
  });

  final Widget child;
  final void Function()? onTap;
  final Color splashColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: splashColor,
      hoverColor: splashColor,
      highlightColor: splashColor,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
