import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class LatestActivityItem extends StatelessWidget {
  const LatestActivityItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withValues(alpha: 0.07),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.secondaryColor,
          child: Image.asset(
            AppImages.dummy,
            height: 35,
            width: 35,
          ),
        ),
        title: Text(
          'Drinking 300ml Water',
          style: AppStyles.medium12,
        ),
        subtitle: Text(
          'About 3 minutes ago',
          style: AppStyles.regular10.copyWith(
            color: AppColors.greyLighterColor,
          ),
        ),
        trailing: Transform.translate(
          offset: const Offset(0, -10),
          child: Icon(
            Icons.more_vert_outlined,
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
