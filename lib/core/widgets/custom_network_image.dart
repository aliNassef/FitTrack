import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.img =
        'https://th.bing.com/th/id/OIP.kUCIxkO1NfJOCjfUVEj7lQHaEO?w=281&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
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
