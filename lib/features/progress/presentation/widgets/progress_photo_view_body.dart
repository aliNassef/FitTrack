import 'package:fit_track_app/core/extensions/mediaquery_size.dart';
import 'package:fit_track_app/core/helpers/app_spacer.dart';
import 'package:fit_track_app/core/widgets/custom_failure_widget.dart';
import 'package:fit_track_app/features/progress/presentation/cubits/progress_cubit/progress_cubit.dart';
import 'package:fit_track_app/features/progress/presentation/widgets/upload_photo_to_comparison.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/title_and_seemore.dart';

class ProgressPhotoViewBody extends StatelessWidget {
  const ProgressPhotoViewBody({super.key, required this.controller});
  final PersistentTabController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          title: 'Progress Photo',
          onBackButtonPressed: () {
            controller.jumpToTab(0);
          },
        ),
        SizedBox(
          height: context.height * .1,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: const Color(0xfff6e2fa),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const UploadPhotoToComparisonButton(),
        ),
        SizedBox(
          height: context.height * .1,
        ),
        const TitleAndSeeMore(title: 'Gallery'),
        const VerticalSpace(15),
        BlocBuilder<ProgressCubit, ProgressState>(
          buildWhen: (previous, current) =>
              current is ProgressLoading ||
              current is ProgressLoaded ||
              current is ProgressFailure,
          builder: (context, state) {
            if (state is ProgressLoading) {
              return Skeletonizer(
                enabled: true,
                child: Text(
                  '2 June',
                  style: AppStyles.regular12.copyWith(
                    color: AppColors.greyLighterColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              );
            }
            if (state is ProgressLoaded) {
              return Text(
                DateTime.parse(
                        state.progressModel.data.beforePhoto.date.toString())
                    .month
                    .toString(),
                style: AppStyles.regular12.copyWith(
                  color: AppColors.greyLighterColor,
                ),
                textAlign: TextAlign.start,
              );
            }
            if (state is ProgressFailure) {
              return const SizedBox.shrink();
            }

            return const SizedBox.shrink();
          },
        ),
        const VerticalSpace(15),
        SizedBox(
          height: context.height * .1,
          child: BlocBuilder<ProgressCubit, ProgressState>(
            buildWhen: (previous, current) =>
                current is ProgressLoading ||
                current is ProgressLoaded ||
                current is ProgressFailure,
            builder: (context, state) {
              if (state is ProgressLoading) {
                return Skeletonizer(
                  enabled: true,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/dummy_gym.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const HorizontalSpace(10);
                    },
                    itemCount: 5,
                  ),
                );
              }
              if (state is ProgressLoaded) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 120.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/dummy_gym.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const HorizontalSpace(10);
                  },
                  itemCount: 5,
                );
              }
              if (state is ProgressFailure) {
                return const CustomFailureWidget(
                    errMessage: 'start uploading photos to follow progress');
              }

              return const SizedBox.shrink();
            },
          ),
        ),
        VerticalSpace(context.height * .1),
        const DefaultAppButton(text: 'Compare'),
      ],
    );
  }
}
