
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';

class NutritionItem extends StatelessWidget {
  const NutritionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffccfee8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 5.w,
        children: [
          const Icon(
            Icons.local_fire_department,
            color: Colors.red,
          ),
          Text(
            '180kCal',
            style: AppStyles.regular10,
          ),
        ],
      ),
    );
  }
}