import '../../../../core/di/service_locator.dart';
import '../cubits/get_category_cubit/get_category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/padding_extension.dart';
import '../widgets/category_meal_view_body.dart';
import 'package:flutter/material.dart';

class CategoryMealView extends StatelessWidget {
  const CategoryMealView({super.key, required this.id});
  static const routeName = 'category-meals';
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              injector<GetCategoryCubit>()..getCategoryById(id),
          child: const CategoryMealViewBody().withHorizontalPadding(30),
        ),
      ),
    );
  }
}
