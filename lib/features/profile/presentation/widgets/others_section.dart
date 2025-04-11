import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_shadows.dart';
import '../../../../core/utils/app_styles.dart';
import 'profile_list_tile.dart';

class OtherSection extends StatelessWidget {
  const OtherSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
              boxShadow: AppShadows.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Other',
            style: AppStyles.semiBold16,
          ),
          VerticalSpace(15),
          ProfileListTile(
            title: 'Contact Us',
            image: AppIcons.contactusIcon,
          ),
          VerticalSpace(15),
          ProfileListTile(
            title: 'Privacy Policy',
            image: AppIcons.privayPolicyIcon,
          ),
          VerticalSpace(15),
          ProfileListTile(
            title: 'settings',
            image: AppIcons.settingIcon,
          ),
        ],
      ),
    );
  }
}
