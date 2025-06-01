import 'package:fit_track_app/core/helpers/default_app_button.dart';
import 'package:fit_track_app/features/auth/presentation/views/complete_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/model/signup_input_model.dart';
import 'custom_check_box.dart';

class SignupFormSection extends StatefulWidget {
  const SignupFormSection({super.key});

  @override
  State<SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormSection> {
  late TextEditingController _email;
  late TextEditingController _name;
  late TextEditingController _phone;
  late TextEditingController _password;
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  bool acceptTerms = false;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _name = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _phone.dispose();
    _password.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          const VerticalSpace(10),
          Text(
            'Hey there,',
            style: AppStyles.regular16,
          ),
          const VerticalSpace(5),
          Text(
            'Create an Account',
            style: AppStyles.bold20,
          ),
          const VerticalSpace(30),
          CustomTextFormField(
            prefixIcon: AppIcons.profileIcon,
            hintText: 'Full Name',
            controller: _name,
          ),
          const VerticalSpace(16),
          CustomTextFormField(
            prefixIcon: AppIcons.emailIcon,
            hintText: 'Email',
            controller: _email,
          ),
          const VerticalSpace(16),
          CustomTextFormField(
            prefixIcon: AppIcons.phoneIcon,
            hintText: 'Phone Number',
            controller: _phone,
          ),
          const VerticalSpace(16),
          CustomTextFormField(
            prefixIcon: AppIcons.lockIcon,
            controller: _password,
            hintText: 'Password',
            isPassword: true,
          ),
          const VerticalSpace(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.w,
            children: [
              CustomCheckBox(
                onChanged: (val) {
                  acceptTerms = val;
                  setState(() {});
                },
              ),
              Expanded(
                child: Text(
                  'By continuing you accept our Privacy Policy and Term of Use',
                  style: AppStyles.regular12,
                ),
              ),
            ],
          ),
          const VerticalSpace(10),
          DefaultAppButton(
            text: 'Next',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var data = SignupInputModel(
                  password: _password.text.trim(),
                  email: _email.text.trim(),
                  name: _name.text.trim(),
                  phoneNumber: _phone.text.trim(),
                  termsAccepted: acceptTerms,
                );
                _goToCompleteProfile(context, data);
              }
            },
          ),
        ],
      ),
    );
  }

  void _goToCompleteProfile(BuildContext context, dynamic data) {
    Navigator.pushNamed(
      context,
      CompleteProfileView.routeName,
      arguments: data as SignupInputModel,
    );
  }
}
