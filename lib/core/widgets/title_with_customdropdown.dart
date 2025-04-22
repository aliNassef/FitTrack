import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/activity/presentation/widgets/custom_drop_down_menu.dart';
import '../utils/app_styles.dart';

class TitleWithCustomDropDown extends StatelessWidget {
  const TitleWithCustomDropDown({
    super.key,
    required this.title, required this.gradientColor,
  });
  final String title;
  final List<Color> gradientColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.semiBold16,
        ),
        SizedBox(
          height: 30.h,
          child: CustomDropdownButton(
            gradientColor :gradientColor,
          ),
        ),
      ],
    );
  }
}
