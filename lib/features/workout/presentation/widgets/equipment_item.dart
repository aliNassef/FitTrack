import '../../../../core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/equipment_model.dart';

class EquipmentItem extends StatelessWidget {
  const EquipmentItem({
    super.key,
    required this.equipment,
  });
  final EquipmentModel equipment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          height: 130.h,
          width: 130.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: CustomNetworkImage(
            img: equipment.image,
            height: 90.h,
            width: 90.w,
          ),
        ),
        Text(
          equipment.name,
          style: AppStyles.regular12.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
