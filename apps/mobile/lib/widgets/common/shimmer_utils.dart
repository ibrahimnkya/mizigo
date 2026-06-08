import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;

    return Shimmer.fromColors(
      baseColor: const Color(0xFF1E293B),
      highlightColor: const Color(0xFF334155),
      period: const Duration(milliseconds: 1500),
      child: child,
    );
  }
}

class BoxSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;

  const BoxSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  final double size;

  const CircleSkeleton({
    super.key,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class LineSkeleton extends StatelessWidget {
  final double? width;
  final double height;

  const LineSkeleton({
    super.key,
    this.width,
    this.height = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}

class ListSkeleton extends StatelessWidget {
  final int itemCount;
  final double height;
  final double padding;

  const ListSkeleton({
    super.key,
    this.itemCount = 6,
    this.height = 100.0,
    this.padding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      padding: EdgeInsets.all(padding),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: BoxSkeleton(height: height, borderRadius: 20),
      ),
    );
  }
}
