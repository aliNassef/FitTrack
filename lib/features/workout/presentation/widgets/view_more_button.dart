import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_styles.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: AppGradients.pinkGradient,
            ).createShader(bounds);
          },
          child: Center(
            child: Text(
              'View more',
              style: AppStyles.medium10.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
