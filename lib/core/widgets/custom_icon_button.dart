import 'package:badges/badges.dart' as badges;
import 'package:fit_track_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.image,
    this.onTap,
    this.count,
  });
  final String image;
  final int? count;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF7F8F8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: count != 0 && count != null
              ? badges.Badge(
                  badgeContent: Text(
                    count.toString(),
                    style: AppStyles.regular10.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  child: SvgPicture.asset(
                    image,
                  ),
                )
              : SvgPicture.asset(
                  image,
                ),
        ),
      ),
    );
  }
}
