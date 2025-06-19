import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/equipment_model.dart';
import '../../../data/repo/workout_repo.dart';

part 'get_equipment_by_id_state.dart';

class GetEquipmentByIdCubit extends Cubit<GetEquipmentByIdState> {
  final WorkoutRepo repo;
  GetEquipmentByIdCubit({required this.repo})
      : super(GetEquipmentByIdInitial());

  void getEquipmentById(String equipmentId) async {
    emit(GetEquipmentByIdLoading());
    final equipmentOrFailure = await repo.getEquipment(equipmentId);
    equipmentOrFailure.fold(
      (failure) => emit(GetEquipmentByIdError(errMessage: failure.errMessage)),
      (equipment) => emit(GetEquipmentByIdSuccess(equipment: equipment)),
    );
  }
}
