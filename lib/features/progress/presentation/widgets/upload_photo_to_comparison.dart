import 'package:easy_localization/easy_localization.dart';
import 'package:fit_track_app/features/progress/presentation/widgets/custom_drop_down_facing.dart';

import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/helpers/show_loading_box.dart';
import '../../../../core/helpers/toast_dialog.dart';
import '../../../../core/helpers/upload_image_to_api.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/upload_image_input_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../cubits/progress_cubit/progress_cubit.dart';

class UploadPhotoToComparisonButton extends StatefulWidget {
  const UploadPhotoToComparisonButton({
    super.key,
  });

  @override
  State<UploadPhotoToComparisonButton> createState() =>
      _UploadPhotoToComparisonButtonState();
}

class _UploadPhotoToComparisonButtonState
    extends State<UploadPhotoToComparisonButton> {
  late TextEditingController weightController;
  late TextEditingController facingController;
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    facingController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    weightController.dispose();
    facingController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProgressCubit, ProgressState>(
      listenWhen: (previous, current) =>
          current is UploadImageLoading ||
          current is UploadImageLoaded ||
          current is UploadImageFailure,
      listener: (context, state) {
        if (state is UploadImageLoaded) {
          Navigator.of(context, rootNavigator: true)
              .pop(); // Close loading dialog
          Navigator.of(context, rootNavigator: true).pop(); //
          weightController.clear();
          facingController.clear();
          dateController.clear();
          context.read<ProgressCubit>().getProgress();
          showToast(text: 'Image uploaded successfully');
        }
        if (state is UploadImageFailure) {
          weightController.clear();
          facingController.clear();
          dateController.clear();
          Navigator.of(context, rootNavigator: true)
              .pop(); // Close loading dialog

          showToast(text: state.errMessage);
        }
        if (state is UploadImageLoading) {
          showLoadingBox(context);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Upload your Photo',
            style: AppStyles.medium14,
          ),
          SizedBox(
            height: 40.h,
            width: 100.w,
            child: DefaultAppButton(
              onPressed: () async {
                final imagePicker = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (imagePicker == null) return;
                if (mounted) {
                  // ignore: use_build_context_synchronously
                  final cubit = context.read<ProgressCubit>();
                  showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Fill Form'),
                        content: Column(
                          spacing: 10.h,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextFormField(
                              hintText: 'Enter your weight',
                              controller: weightController,
                            ),
                            CustomDropDownFacing(
                              facingController: facingController,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              _confirmPhotoToUpload(cubit, imagePicker);
                            },
                            child: const Text('Confirm'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              text: 'Upload',
            ),
          )
        ],
      ),
    );
  }

  void _confirmPhotoToUpload(cubit, imagePicker) async {
    dateController.text = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
    if (weightController.text.isEmpty ||
        facingController.text.isEmpty ||
        dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }
    final uploadImageInputModel = UploadImageInputModel(
      weight: double.parse(weightController.text),
      facing: facingController.text.trim(),
      date: dateController.text.trim(),
      image: await uploadImageToAPI(
        imagePicker,
      ),
    );
    cubit.uploadImageWithData(
      uploadImageInputModel,
    );
  }
}
