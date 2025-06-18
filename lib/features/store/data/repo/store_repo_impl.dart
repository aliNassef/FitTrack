import 'package:fit_track_app/core/errors/exceptions.dart';
import 'package:fit_track_app/features/store/data/model/product_model.dart';

import '../datasource/store_remote_datasource.dart';
import '../model/category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:fit_track_app/core/errors/failure.dart';

import 'store_repo.dart';

class StoreRepoImpl implements StoreRepo {
  final StoreRemoteDataSource remoteDataSource;

  StoreRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchOnProducts(
      String query) async {
    try {
      final products = await remoteDataSource.searchOnProducts(query);
      return Right(products);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
