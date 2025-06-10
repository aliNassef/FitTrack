import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.img,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.radius = 0,
  });
  final String img;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: img,
        fit: fit,
        errorWidget: (_, __, ___) => const Icon(Icons.error),
        placeholder: (_, __) => Skeletonizer(
          enabled: true,
          child: Container(
            width: width,
            height: height,
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
