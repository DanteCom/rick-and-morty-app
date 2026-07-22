import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgPicture extends StatelessWidget {
  final String path;
  final Color? color;

  const AppSvgPicture(this.path, {super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
