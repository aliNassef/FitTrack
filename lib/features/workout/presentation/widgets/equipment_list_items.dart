import 'package:fit_track_app/features/workout/data/model/equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_spacer.dart';
import 'equipment_item.dart';

class EquipmentListItems extends StatelessWidget {
  const EquipmentListItems({
    super.key,
    required this.equipments,
  });
  final List<EquipmentModel> equipments;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        itemCount: equipments.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const HorizontalSpace(15),
        itemBuilder: (context, index) => EquipmentItem(
          equipment: equipments[index],
        ),
      ),
    );
  }
}
