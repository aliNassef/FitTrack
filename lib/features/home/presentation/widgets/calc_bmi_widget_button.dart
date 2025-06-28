import 'package:fit_track_app/core/helpers/custom_text_form_field.dart';
import 'package:fit_track_app/core/helpers/default_app_button.dart';
import 'package:fit_track_app/core/utils/app_colors.dart';
import 'package:fit_track_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalcBMIWidgetButton extends StatefulWidget {
  const CalcBMIWidgetButton({
    super.key,
    this.onResult,
    this.height = '',
    this.weight = '',
  });
  final ValueChanged<String>? onResult;
  final String height;
  final String weight;
  @override
  State<CalcBMIWidgetButton> createState() => _CalcBMIWidgetButtonState();
}

class _CalcBMIWidgetButtonState extends State<CalcBMIWidgetButton> {
  late TextEditingController heightController;
  late TextEditingController weightController;

  @override
  void initState() {
    heightController = TextEditingController(text: widget.height);
    weightController = TextEditingController(text: widget.weight);
    super.initState();
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: 100.w,
      child: DefaultAppButton(
        text: 'View more',
        textStyle: AppStyles.semiBold10.copyWith(
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('BMI Details'),
                content: Column(
                  spacing: 10.h,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                      hintText: 'Enter your height',
                      keyboardType: TextInputType.number,
                      controller: heightController,
                    ),
                    CustomTextFormField(
                      hintText: 'Enter your Weight',
                      keyboardType: TextInputType.number,
                      controller: weightController,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      final result = calculateBMI();
                      if (widget.onResult != null) {
                        widget.onResult!(result);
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Calculate',
                      style: AppStyles.bold16.copyWith(
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  String calculateBMI() {
    final height = double.tryParse(heightController.text.trim());
    final weight = double.tryParse(weightController.text.trim());

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
