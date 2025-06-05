import 'dart:developer';

import 'package:fit_track_app/core/helpers/show_error_message.dart';
import 'package:fit_track_app/core/helpers/show_loading_box.dart';
import 'package:fit_track_app/features/auth/data/model/signup_input_model.dart';
import 'package:fit_track_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/mediaquery_size.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacer.dart';
import '../../../../core/helpers/custom_text_form_field.dart';
import '../../../../core/helpers/default_app_button.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../views/signup_welcome_view.dart';
import 'custom_drop_down_button.dart';
import 'user_input_row.dart';

class CompleteProfileViewBody extends StatefulWidget {
  const CompleteProfileViewBody({super.key, required this.signupInputModel});

  final SignupInputModel signupInputModel;
  @override
  State<CompleteProfileViewBody> createState() =>
      _CompleteProfileViewBodyState();
}

class _CompleteProfileViewBodyState extends State<CompleteProfileViewBody> {
  late TextEditingController _dateOfBirth;
  late TextEditingController _weight;
  late TextEditingController _height;
  late TextEditingController _gender;
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;

  @override
  void initState() {
    super.initState();
    _dateOfBirth = TextEditingController();
    _weight = TextEditingController();
    _height = TextEditingController();
    _gender = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void dispose() {
    _dateOfBirth.dispose();
    _weight.dispose();
    _height.dispose();
    _gender.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerticalSpace(20),
          Text(
            'Let’s complete your profile',
            style: AppStyles.bold20,
            textAlign: TextAlign.center,
          ),
          const VerticalSpace(5),
          Text(
            'It will help us to know more about you!',
            style: AppStyles.regular12,
            textAlign: TextAlign.center,
          ),
          VerticalSpace(context.height * .16),
          CustomDropDownButton(
            onChanged: (val) {
              _gender.text = val!;
              setState(() {});
            },
          ),
          const VerticalSpace(13),
          CustomTextFormField(
            hintText: 'Date of Birth (YYYY-MM-DD)',
            prefixIcon: AppIcons.dateIcon,
            controller: _dateOfBirth,
          ),
          const VerticalSpace(13),
          UserInputRow(
            controller: _weight,
            hint: 'Your Weight',
            measurement: 'KG',
          ),
          const VerticalSpace(13),
          UserInputRow(
            controller: _height,
            hint: 'Your Height',
            measurement: 'CM',
          ),
          VerticalSpace(context.height * .16),
          BlocListener<AuthCubit, AuthState>(
            listenWhen: (previous, current) =>
                current is SignupFailure ||
                current is SignupLoading ||
                current is SignupSuccess,
            listener: (context, state) {
              if (state is SignupFailure) {
                Navigator.pop(context);
                showErrorMessage(context, errMessage: state.errMessage);
              }
              if (state is SignupLoading) {
                showLoadingBox(context);
              }
              if (state is SignupSuccess) {
                Navigator.pop(context);
                _goToGoalItems(context);
              }
            },
            child: DefaultAppButton(
              text: 'Next',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var input = SignupInputModel(
                    termsAccepted: widget.signupInputModel.termsAccepted!,
                    name: widget.signupInputModel.name!,
                    email: widget.signupInputModel.email!,
                    password: widget.signupInputModel.password!,
                    phoneNumber: widget.signupInputModel.phoneNumber!,
                    gender: _gender.text,
                    dateOfBirth: _dateOfBirth.text.trim(),
                    weight: num.parse(_weight.text.trim()),
                    height: num.parse(_height.text.trim()),
                  );
                  log(input.toJson().toString());
                  context.read<AuthCubit>().signup(input);
                } else {
                  _autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _goToGoalItems(BuildContext context) {
    Navigator.pushNamed(
      context,
      SignupWelcomeView.routeName,
    );
  }
}
