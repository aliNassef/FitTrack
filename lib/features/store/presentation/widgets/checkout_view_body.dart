import 'package:fit_track_app/features/store/presentation/manger/payment_cubit/payment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/default_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key, required this.productDetails});
  final Map<String, dynamic> productDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 50.w,
          children: [
            CustomIconButton(
              onTap: () {
                Navigator.pop(context);
              },
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
          title: Text(productDetails['name'], style: AppStyles.medium14),
          subtitle: Text(
            '${productDetails['price']}\$',
            style: AppStyles.medium18.copyWith(
              color: const Color(0xff0A0D13),
            ),
          ),
          trailing: Text(
            'Qty: 1',
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
              '${productDetails['price']}\$',
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
            'Including \$2 in taxes',
            style: AppStyles.regular14.copyWith(
              color: const Color(0xffAcAcAc),
            ),
          ),
          trailing: Text(
            '${(double.parse(productDetails['price']) + 12).toInt()}\$',
            style: AppStyles.medium16.copyWith(
              color: const Color(0xff0A0D13),
            ),
          ),
        ),
        VerticalSpace(context.height * .44),
        DefaultAppButton(
          text: 'Buy',
          onPressed: () {
            context.read<PaymentCubit>().createPaymentIntent(
                  (double.parse(productDetails['price']) + 12).toInt(),
                );
          },
        ),
      ],
    );
  }
}
