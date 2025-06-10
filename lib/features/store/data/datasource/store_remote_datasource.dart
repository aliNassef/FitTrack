import 'package:fit_track_app/core/api/api_consumer.dart';
import 'package:fit_track_app/core/errors/error_model.dart';
import 'package:fit_track_app/core/errors/exceptions.dart';

import '../../../../core/api/end_ponits.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';

abstract class StoreRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts();
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  final ApiConsumer apiConsumer;

  StoreRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiConsumer.get(EndPoints.getAllCategories);
    if (response.statusCode == 200) {
      final data = response.data['data'];
      final categories = data.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
      return categories;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await apiConsumer.get(EndPoints.getAllProducts);
    if (response.statusCode == 200) {
      final data = response.data['data'];
      final products = data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
      return products;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
