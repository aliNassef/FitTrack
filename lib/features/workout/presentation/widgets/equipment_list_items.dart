import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import 'equipment_item.dart';

class EquipmentListItems extends StatelessWidget {
  const EquipmentListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const HorizontalSpace(15),
        itemBuilder: (context, index) => const EquipmentItem(),
      ),
    );
  }
}
