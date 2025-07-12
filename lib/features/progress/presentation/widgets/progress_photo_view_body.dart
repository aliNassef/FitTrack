import 'package:easy_localization/easy_localization.dart';
import 'package:fit_track_app/core/helpers/toast_dialog.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/show_loading_box.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../cubits/progress_cubit/progress_cubit.dart';
import '../views/compare_result_view.dart';
import 'upload_photo_to_comparison.dart';
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

class ProgressPhotoViewBody extends StatefulWidget {
  const ProgressPhotoViewBody({super.key, required this.controller});
  final PersistentTabController controller;

  @override
  State<ProgressPhotoViewBody> createState() => _ProgressPhotoViewBodyState();
}

class _ProgressPhotoViewBodyState extends State<ProgressPhotoViewBody> {
  final Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          title: 'Progress Photo',
          onBackButtonPressed: () {
            widget.controller.jumpToTab(0);
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
              if (state.progressModel.isEmpty) {
                return const SizedBox.shrink();
              }
              return Text(
                DateFormat('MMMM').format(
                  DateTime.parse(state.progressModel[0].uploadDate.toString()),
                ),
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
                if (state.progressModel.isEmpty) {
                  return const CustomFailureWidget(
                    errMessage: 'start uploading photos to follow progress',
                  );
                }
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndices.contains(index);
                    return BlocListener<ProgressCubit, ProgressState>(
                      listenWhen: (previous, current) =>
                          current is DeletePhotoFailure ||
                          current is DeletePhotoLoaded,
                      listener: (context, state) {
                        if (state is DeletePhotoFailure) {
                          showToast(text: state.errMessage);
                        }
                        if (state is DeletePhotoLoaded) {
                          showToast(text: state.message);
                          context.read<ProgressCubit>().getProgress();
                        }
                      },
                      child: GestureDetector(
                        onLongPress: () {
                          final cubit = context.read<ProgressCubit>();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Delete Photo'.tr()),
                                  content: Text(
                                      'Are you sure you want to delete this photo?'
                                          .tr()),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      child: Text('Cancel'.tr()),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        cubit.deletePhotoFromGallrey(
                                          state.progressModel[index].id,
                                        );
                                        setState(() {
                                          selectedIndices.remove(index);
                                        });
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      child: Text('Delete'.tr()),
                                    ),
                                  ],
                                );
                              });
                        },
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedIndices.remove(index);
                            } else if (selectedIndices.length < 2) {
                              selectedIndices.add(index);
                            }
                          });
                        },
                        child: Container(
                          height: 120.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            border: isSelected
                                ? Border.all(
                                    color: AppColors.secondaryColor,
                                    width: 4,
                                  )
                                : null,
                            image: DecorationImage(
                              image:
                                  NetworkImage(state.progressModel[index].url),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: isSelected
                              ? const Icon(Icons.check_circle,
                                  color: Colors.white)
                              : null,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const HorizontalSpace(10);
                  },
                  itemCount: state.progressModel.length,
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
        CompareButton(selectedIndices: selectedIndices),
      ],
    );
  }
}

class CompareButton extends StatelessWidget {
  const CompareButton({
    super.key,
    required this.selectedIndices,
  });

  final Set<int> selectedIndices;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProgressCubit, ProgressState>(
      listenWhen: (previous, current) =>
          current is ProgressComparisonLoading ||
          current is ProgressComparisonLoaded ||
          current is ProgressComparisonFailure,
      listener: (context, state) {
        if (state is ProgressComparisonLoading) {
          showLoadingBox(context);
        } else if (state is ProgressComparisonLoaded) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.of(context, rootNavigator: true).pushNamed(
            CompareResultView.routeName,
            arguments: state.progressComparisonModel,
          );
        } else if (state is ProgressComparisonFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          showToast(text: state.errMessage);
        }
      },
      child: DefaultAppButton(
        text: 'Compare',
        onPressed: selectedIndices.length == 2
            ? () {
                final indices = selectedIndices.toList();
                final state =
                    context.read<ProgressCubit>().state as ProgressLoaded;
                final photo1 = state.progressModel[indices[0]];
                final photo2 = state.progressModel[indices[1]];
                context.read<ProgressCubit>().getProgressComparison(
                      beforePhotoId: photo1.id,
                      afterPhotoId: photo2.id,
                    );
              }
            : null,
      ),
    );
  }
}
