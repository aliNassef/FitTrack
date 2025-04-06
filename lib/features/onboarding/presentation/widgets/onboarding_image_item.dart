
import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';
 
class OnBoardingImageItem extends StatelessWidget {
  const OnBoardingImageItem({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.52,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}