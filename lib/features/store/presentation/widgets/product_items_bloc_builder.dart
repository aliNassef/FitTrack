import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/custom_failure_widget.dart';
import '../manger/get_all_product_cubit/get_all_products_cubit_cubit.dart';
import 'product_card_item.dart';

class ProductItemsBlocBuilder extends StatelessWidget {
  const ProductItemsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubitCubit, GetAllProductsCubitState>(
      buildWhen: (previous, current) =>
          current is GetAllProductsSuccess ||
          current is GetAllProductsFailure ||
          current is GetAllProductsLoading,
      builder: (context, state) {
        if (state is GetAllProductsLoading) {
          return SliverGrid.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (_, index) {
              return const Skeletonizer(
                enabled: true,
                child: ProductCard(
                  name: 'Dumbbells',
                  price: '200\$',
                  image:
                      'https://www.bing.com/th/id/OIP.TCoDiljKqrrLi6XHnyHtjgHaHa?w=214&h=211&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', // Replace with actual dumbbell image
                  backgroundColor: Color(0xFFCCF7F2),
                ),
              );
            },
          );
        }
        if (state is GetAllProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomFailureWidget(errMessage: state.errMessage),
          );
        }
        if (state is GetAllProductsSuccess) {
          return SliverGrid.builder(
            itemCount: state.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ProductCard(
                  name: state.products[index].name,
                  price: '${state.products[index].price.toString()}\$',
                  image: state.products[index].image,
                  backgroundColor: const Color(0xFFCCF7F2),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
