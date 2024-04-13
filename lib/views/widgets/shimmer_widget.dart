import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

// Custom Shimmer Loading effect for global use
class ShimmerLoadingWidget extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const ShimmerLoadingWidget({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade500,
            child: child,
          )
        : child;
  }
}
