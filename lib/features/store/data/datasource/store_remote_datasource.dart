import '../../../../core/api/api_consumer.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/api/end_ponits.dart';
import '../model/category_model.dart';
import '../model/product_model.dart';

abstract class StoreRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> searchOnProducts(String query);
  Future<String> createPaymentIntent(int amount);
  Future<String> confirmPayment(String paymentIntentId);
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  final ApiConsumer apiConsumer;

  StoreRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiConsumer.get(EndPoints.getAllCategories);
    if (response.statusCode == 200) {
      final data = response.data['data'];
      final categories =
          data.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
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
      final products =
          data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
      return products;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModel>> searchOnProducts(String query) async {
    final response = await apiConsumer.get(
      EndPoints.searchOnProducts,
      queryParameters: {'query': query},
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      final products =
          data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
      return products;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<String> createPaymentIntent(int amount) async {
    final response = await apiConsumer.post(
      EndPoints.createPaymentIntent,
      data: {'amount': amount, 'currency': 'usd'},
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      return data['clientSecret'] as String;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<String> confirmPayment(String paymentIntentId) async {
    final response = await apiConsumer.post(
      EndPoints.confirmPayment,
      data: {'paymentIntentId': paymentIntentId},
    );
    if (response.statusCode == 200) {
      final data = response.data['data'];
      return data['status'] as String;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
