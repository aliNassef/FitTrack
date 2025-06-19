part of 'get_equipment_by_id_cubit.dart';

@immutable
sealed class GetEquipmentByIdState {}

final class GetEquipmentByIdInitial extends GetEquipmentByIdState {}

final class GetEquipmentByIdLoading extends GetEquipmentByIdState {}

final class GetEquipmentByIdSuccess extends GetEquipmentByIdState {
  final List<EquipmentModel> equipment;
  GetEquipmentByIdSuccess({required this.equipment});
}

final class GetEquipmentByIdError extends GetEquipmentByIdState {
  final String errMessage;
  GetEquipmentByIdError({required this.errMessage});
}
