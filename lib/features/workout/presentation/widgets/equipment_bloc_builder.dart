
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/widgets/custom_failure_widget.dart';
import '../../data/model/equipment_model.dart';
import '../cubits/get_equipment_by_id_cubit/get_equipment_by_id_cubit.dart';
import 'equipment_list_items.dart';

class EquipmentBlocBuilder extends StatelessWidget {
  const EquipmentBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEquipmentByIdCubit,
        GetEquipmentByIdState>(
      buildWhen: (previous, current) =>
          current is GetEquipmentByIdLoading ||
          current is GetEquipmentByIdSuccess ||
          current is GetEquipmentByIdError,
      builder: (context, state) {
        if (state is GetEquipmentByIdSuccess) {
          return EquipmentListItems(
            equipments: state.equipment,
          );
        }
        if (state is GetEquipmentByIdError) {
          return CustomFailureWidget(
            errMessage: state.errMessage,
          );
        }
        if (state is GetEquipmentByIdLoading) {
          return Skeletonizer(
            enabled: true,
            child: EquipmentListItems(
              equipments: List.generate(
                3,
                (index) => EquipmentModel(
                  name: 'Ali Nassef',
                  image:
                      'https://cdn.pixabay.com/photo/2023/03/28/13/28/ai-generated-7883147_960_720.jpg',
                  id: '4555',
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
