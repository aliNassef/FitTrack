import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            colors: [
              Color(0xffEEA4CE),
              Color(0xffC150F6),
            ],
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
    );
  }
}
