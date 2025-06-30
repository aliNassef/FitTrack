import '../../../../core/widgets/custom_failure_widget.dart';
import 'calc_bmi_widget_button.dart';
import '../../../profile/presentation/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/utils/app_gradients.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({
    super.key,
  });

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  String? bmiResult;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
      buildWhen: (previous, current) =>
          current is GetProfileLoaded ||
          current is GetProfileFailure ||
          current is GetProfileLoading,
      builder: (context, state) {
        if (state is GetProfileLoaded) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: svg.Svg(
                  AppIcons.homeBackgroundBannerIcon,
                ),
                fit: BoxFit.cover,
              ),
              gradient: const LinearGradient(
                colors: AppGradients.pinkGradient,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BMI (Body Mass Index)',
                      style: AppStyles.semiBold14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const VerticalSpace(5),
                    Text(
                      bmiResult ??
                          calculateBMI(
                            state.user.height.toString(),
                            state.user.weight.toString(),
                          ),
                      style: AppStyles.regular12.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const VerticalSpace(15),
                    CalcBMIWidgetButton(
                      onResult: (result) {
                        setState(() {
                          bmiResult = result;
                        });
                      },
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 44.r,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          );
        }
        if (state is GetProfileLoading) {
          return Skeletonizer(
            enabled: true,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: svg.Svg(
                    AppIcons.homeBackgroundBannerIcon,
                  ),
                  fit: BoxFit.cover,
                ),
                gradient: const LinearGradient(
                  colors: AppGradients.pinkGradient,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BMI (Body Mass Index)',
                        style: AppStyles.semiBold14.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const VerticalSpace(5),
                      Text(
                        'Calculating...',
                        style: AppStyles.regular12.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const VerticalSpace(15),
                      CalcBMIWidgetButton(
                        onResult: (result) {},
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 44.r,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          );
        }
        if (state is GetProfileFailure) {
          return CustomFailureWidget(errMessage: state.errorMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }

  String calculateBMI(String heights, String weights) {
    final height = double.tryParse(heights.trim());
    final weight = double.tryParse(weights.trim());

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      return 'Invalid input';
    }

    final bmi = weight / ((height / 100) * (height / 100));
    if (bmi < 18.5) {
      return 'You are underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'You have a normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'You are overweight';
    } else if (bmi >= 30 && bmi < 34.9) {
      return 'You are obese (Class I)';
    } else if (bmi >= 35 && bmi < 39.9) {
      return 'You are obese (Class II)';
    } else {
      return 'You are obese';
    }
  }
}
