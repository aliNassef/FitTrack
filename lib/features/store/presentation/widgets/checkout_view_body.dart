import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/helpers/default_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 50.w,
          children: [
            CustomIconButton(
              onTap: () {},
              image: AppIcons.backArrowIcon,
            ),
            Text(
              'Order Summary',
              style: AppStyles.bold16.copyWith(
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
        const VerticalSpace(40),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(AppImages.meal),
          title: Text('Dumbbells', style: AppStyles.medium14),
          subtitle: Text(
            '200\$',
            style: AppStyles.medium18.copyWith(
              color: const Color(0xff0A0D13),
            ),
          ),
          trailing: Text(
            'Qty: 2',
            style: AppStyles.medium14.copyWith(
              color: const Color(0xffAcAcAc),
            ),
          ),
        ),
        const VerticalSpace(50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: AppStyles.medium16.copyWith(
                color: const Color(0xff0A0D13),
              ),
            ),
            Text(
              '200\$',
              style: AppStyles.medium16.copyWith(
                color: const Color(0xff0A0D13),
              ),
            ),
          ],
        ),
        const VerticalSpace(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping',
              style: AppStyles.medium16.copyWith(
                color: const Color(0xff0A0D13),
              ),
            ),
            Text(
              '10\$',
              style: AppStyles.medium16.copyWith(
                color: const Color(0xff0A0D13),
              ),
            ),
          ],
        ),
        const VerticalSpace(12),
        const Divider(
          indent: 20,
          endIndent: 20,
          color: Color(0xffA5A3B0),
        ),
        const VerticalSpace(7),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Total', style: AppStyles.medium14),
          subtitle: Text(
            'Including \$2.24 in taxes',
            style: AppStyles.regular14.copyWith(
              color: const Color(0xffAcAcAc),
            ),
          ),
          trailing: Text(
            '212.24\$',
            style: AppStyles.medium16.copyWith(
              color: const Color(0xff0A0D13),
            ),
          ),
        ),
        VerticalSpace(context.height * .44),
        const DefaultAppButton(text: 'Buy')
      ],
    );
  }
}
