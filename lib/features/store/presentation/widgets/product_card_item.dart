import 'package:fit_track_app/core/widgets/custom_network_image.dart';

import '../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../views/checkout_view.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final Color backgroundColor;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90.w,
            height: 90.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomNetworkImage(
                img: image,
                radius: 45.r,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const VerticalSpace(16),
          Text(
            name,
            textAlign: TextAlign.center,
            style: AppStyles.semiBold16.copyWith(
              color: const Color(0xFF3A1F5D),
            ),
          ),
          const VerticalSpace(8),
          Row(
            spacing: 10.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                textAlign: TextAlign.center,
                style: AppStyles.medium14.copyWith(
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(
                    CheckoutView.routeName,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00E6C3),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    'Buy',
                    style: AppStyles.semiBold14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
