import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: svg.Svg(
            AppIcons.homeBackgroundBannerIcon,
          ),
          fit: BoxFit.cover,
        ),
        gradient: const LinearGradient(
          colors:AppGradients.pinkGradient,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMI (Body Mass Index)',
                style: AppStyles.semiBold14.copyWith(
                  color: Colors.white,
                ),
              ),
              const VerticalSpace(5),
              Text(
                'You have a normal weight',
                style: AppStyles.regular12.copyWith(
                  color: Colors.white,
                ),
              ),
              const VerticalSpace(15),
              SizedBox(
                height: 35.h,
                width: 100.w,
                child: DefaultAppButton(
                  text: 'View more',
                  textStyle: AppStyles.semiBold10.copyWith(
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 44.r,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
