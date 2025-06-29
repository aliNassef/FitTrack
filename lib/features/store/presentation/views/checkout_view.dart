import 'package:fit_track_app/features/store/presentation/manger/payment_cubit/payment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, this.productDetails});
  final Map<String, dynamic>? productDetails;
  static const String routeName = 'checkout_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => injector<PaymentCubit>(),
            child: CheckoutViewBody(productDetails: productDetails!),
          ).withHorizontalPadding(30),
        ),
      ),
    );
  }
}
