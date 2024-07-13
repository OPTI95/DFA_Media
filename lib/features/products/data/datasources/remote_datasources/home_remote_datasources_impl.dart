import 'package:dfa_media/features/products/data/models/banners/banners_model.dart';
import 'package:dfa_media/features/products/data/models/products/products_model.dart';
import 'package:dfa_media/features/products/data/models/stories/stories_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/end_points.dart';
import 'home_remote_datasources.dart';

final class IHomeRemoteDatasource implements HomeRemoteDataSources {
  final Dio _dio;

  IHomeRemoteDatasource({required Dio dio}) : _dio = dio;

  @override
  Future<List<BannersModel>> getBanners() async {
    try {
      final Response response = await _dio.get(Endpoints.banners.path);
      final List<dynamic> bannersList =
          response.data['banners'] as List<dynamic>;
      return bannersList.map((e) => BannersModel.fromJson(e)).toList();
    } on DioException catch (error) {
      throw error.response?.data;
    } catch (error) {
      throw Exception();
    }
  }

  @override
  Future<List<ProductsModel>> getProducts() async {
    try {
      final Response response = await _dio.get(Endpoints.products.path);
      final List<dynamic> productsList =
          response.data['products'] as List<dynamic>;
      return productsList.map((e) => ProductsModel.fromJson(e)).toList();
    } on DioException catch (error) {
      throw error.response?.data;
    } catch (error) {
      throw Exception();
    }
  }

  @override
  Future<List<StoriesModel>> getStories() async {
    try {
      final Response response = await _dio.get(Endpoints.story.path);
      final List<dynamic> storyList = response.data['story'] as List<dynamic>;
      return storyList.map((e) => StoriesModel.fromJson(e)).toList();
    } on DioException catch (error) {
      throw error.response?.data;
    } catch (error) {
      throw Exception();
    }
  }
}
