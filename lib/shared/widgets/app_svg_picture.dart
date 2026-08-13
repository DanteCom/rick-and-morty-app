import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgPicture extends StatelessWidget {
  final String path;
  final Color? color;
  final double? size;

  const AppSvgPicture.asset(
    this.path, {
    super.key,
    required this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
