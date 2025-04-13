import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_styles.dart';
import 'set_excersise_item_list_tile.dart';

class SetExcersisesListItems extends StatelessWidget {
  const SetExcersisesListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15.h,
      children: [
        const VerticalSpace(20),
        Text(
          'Set 1',
          style: AppStyles.medium12,
        ),
        ...List.generate(
          10,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: const SetExcersiseItemListTile(),
          ),
        ),
      ],
    );
  }
}
