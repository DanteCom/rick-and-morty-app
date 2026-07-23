import 'package:flutter/material.dart';

class SliverHeaderProgressDelegate extends SliverPersistentHeaderDelegate {
  @override
  final double maxExtent;
  @override
  final double minExtent;

  final Widget Function(BuildContext context, double progress) builder;

  const SliverHeaderProgressDelegate({
    required this.maxExtent,
    required this.minExtent,
    required this.builder,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);
    return builder(context, progress);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
