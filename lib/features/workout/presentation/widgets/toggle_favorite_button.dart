import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';

class ToggleFavoriteButton extends StatefulWidget {
  const ToggleFavoriteButton({
    super.key,
  });

  @override
  State<ToggleFavoriteButton> createState() => _ToggleFavoriteButtonState();
}

class _ToggleFavoriteButtonState extends State<ToggleFavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppShadows.shadow1,
        ),
        child: isFavorite
            ? SvgPicture.asset(AppIcons.favactiveIcon)
            : SvgPicture.asset(
                AppIcons.favInactiveIcon,
              ),
      ),
    );
  }
}
