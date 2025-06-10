import 'package:fit_track_app/features/store/presentation/cubits/get_all_product_cubit/get_all_products_cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/extensions/padding_extension.dart';
import 'package:flutter/material.dart';

import '../cubits/get_all_categories_cubit/cubit/get_all_categories_cubit.dart';
import '../widgets/store_view_body.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});
  static const routeName = 'store_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  injector<GetAllCategoriesCubit>()..getAllCategories(),
            ),
            BlocProvider(
              create: (context) =>
                  injector<GetAllProductsCubitCubit>()..getAllProducts(),
            ),
          ],
          child: const StoreViewBody(),
        ).withHorizontalPadding(30),
      ),
    );
  }
}
