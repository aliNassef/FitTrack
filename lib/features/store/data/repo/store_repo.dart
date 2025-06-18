import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/failure.dart';

import '../model/category_model.dart';
import '../model/product_model.dart';

abstract class StoreRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, List<ProductModel>>> searchOnProducts(String query);
}
