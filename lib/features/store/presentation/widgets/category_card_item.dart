import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_network_image.dart';

class CategoryCardItem extends StatelessWidget {
  final String title;
  final String image;
  final Color backgroundColor;

  const CategoryCardItem({
    super.key,
    required this.title,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 180.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomNetworkImage(
                img: image,
                fit: BoxFit.fill,
                radius: 50,
              ),
            ),
          ),
          const VerticalSpace(16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.medium12.copyWith(
              color: const Color(0xFF3A1F5D),
            ),
          ),
        ],
      ),
    );
  }
}
