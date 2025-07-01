import '../../../../core/widgets/custom_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/model/workout_model.dart';
import '../cubits/get_excercise_cubit/get_excercise_cubit.dart';

import 'workout_details_content.dart';

class WorkoutDetailsViewBody extends StatelessWidget {
  const WorkoutDetailsViewBody({
    super.key,
    required this.workout,
  });
  final WorkoutModel workout;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExcerciseCubit, GetExcerciseState>(
      buildWhen: (previous, current) =>
          current is GetExcerciseLoading ||
          current is GetExcerciseSuccess ||
          current is GetExcerciseError,
      builder: (context, state) {
        if (state is GetExcerciseSuccess) {
          return Stack(
            children: [
              Container(
                height: context.height,
                width: context.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppGradients.pinkGradient,
                  ),
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      sliver: SliverAppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        title: CustomAppBar(
                          onBackButtonPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: '',
                          titleColor: Colors.white,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const VerticalSpace(10),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(
                                alpha: 0.3,
                              ),
                              image: const DecorationImage(
                                image: AssetImage(AppImages.workoutBackground),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: CustomNetworkImage(
                              radius: 100,
                              img: workout.image,
                              height: context.height * 0.3,
                            ),
                          ),
                          const VerticalSpace(15),
                        ],
                      ).withHorizontalPadding(30),
                    ),
                    WorkoutDetailsContent(
                      exercises: state.exercises,
                      workout: workout,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 40.h,
                left: 0,
                right: 0,
                child: DefaultAppButton(
                  text: 'Start Workout',
                  onPressed: () {},
                ).withHorizontalPadding(30),
              ),
            ],
          );
        }

        if (state is GetExcerciseError) {
          return CustomFailureWidget(
            errMessage: state.errMessage,
          );
        }

        if (state is GetExcerciseLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return const SizedBox.shrink();
      },
    );
  }
}
