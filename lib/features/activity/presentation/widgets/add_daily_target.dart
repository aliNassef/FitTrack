import 'package:fit_track_app/core/extensions/padding_extension.dart';
import 'package:fit_track_app/core/helpers/show_error_message.dart';
import 'package:fit_track_app/core/helpers/show_loading_box.dart';
import 'package:fit_track_app/features/activity/presentation/cubits/get_activity_cubit/get_activity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
 import '../cubits/cubit/activity_cubit.dart';

class AddDailyTarget extends StatefulWidget {
  const AddDailyTarget({
    super.key,
  });

  @override
  State<AddDailyTarget> createState() => _AddDailyTargetState();
}

class _AddDailyTargetState extends State<AddDailyTarget> {
  late TextEditingController _waterIntakeController;
  late TextEditingController _footStepsController;
  @override
  void initState() {
    super.initState();
    _waterIntakeController = TextEditingController();
    _footStepsController = TextEditingController();
  }

  @override
  void dispose() {
    _waterIntakeController.dispose();
    _footStepsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activityCubit = context.read<ActivityCubit>();
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.secondaryColor,
            AppColors.primaryColor,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return BlocProvider.value(
                value: activityCubit,
                child: AlertDialog(
                  backgroundColor: const Color(0xfff6e3fa),
                  title: Text(
                    'Add Target',
                    style: AppStyles.semiBold16,
                    textAlign: TextAlign.center,
                  ),
                  content: SizedBox(
                    height: 250.h,
                    child: Column(
                      spacing: 20.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Water Intake',
                          style: AppStyles.medium14,
                        ),
                        CustomTextFormField(
                          hintText: 'Enter Target',
                          controller: _waterIntakeController,
                          keyboardType: TextInputType.number,
                        ),
                        Text(
                          'Foot Steps',
                          style: AppStyles.medium14,
                        ),
                        CustomTextFormField(
                          hintText: 'Enter Target',
                          controller: _footStepsController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    BlocListener<ActivityCubit, ActivityState>(
                      listener: (context, state) {
                        if (state is AddDailyActivitySuccess) {
                          context.read<GetActivityCubit>().getTrackerData();
                        }
                        if (state is AddDailyActivityFailure) {
                          Navigator.pop(context);
                          showErrorMessage(
                            context,
                            errMessage: state.errorMessage,
                          );
                        }
                        if (state is AddDailyActivityLoading) {
                          showLoadingBox(context);
                        }
                      },
                      child: TextButton(
                        onPressed: () {
                          activityCubit.addDailyTarget(
                            waterIntake: int.parse(
                              _waterIntakeController.text.trim(),
                            ),
                            footSteps: int.parse(
                              _footStepsController.text.trim(),
                            ),
                          );
                        },
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ).withAllPadding(5),
      ),
    );
  }
}
