// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:dfa_media/core/error/error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dfa_media/features/products/data/datasources/local_datasources/home_local_datasources.dart';
import 'package:dfa_media/features/products/data/models/banners/banners_model.dart';
import 'package:dfa_media/features/products/data/models/products/products_model.dart';
import 'package:dfa_media/features/products/data/models/stories/stories_model.dart';

const CACHED_BANNERS = 'CACHED_BANNERS';
const CACHED_PRODUCTS = 'CACHED_PRODUCTS';
const CACHED_STORIES = 'CACHED_STORIES';

final class IHomeLocalDatasource implements HomeLocalDatasource {
  final SharedPreferences _sharedPreferences;

  IHomeLocalDatasource({required SharedPreferences sharedPrefences})
      : _sharedPreferences = sharedPrefences;

  @override
  Future<List<BannersModel>> getBanners() async {
    try {
      final jsonString = _sharedPreferences.getString(CACHED_BANNERS);
      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        return jsonList.map((json) => BannersModel.fromJson(json)).toList();
      } else {
        throw Exception();
      }
    } catch (error) {
      throw CachedFailure(message: error.toString());
    }
  }

  @override
  Future<List<ProductsModel>> getProducts() async {
    try {
      final jsonString = _sharedPreferences.getString(CACHED_PRODUCTS);
      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        return jsonList.map((json) => ProductsModel.fromJson(json)).toList();
      } else {
        throw Exception();
      }
    } catch (error) {
      throw CachedFailure(message: error.toString());
    }
  }

  @override
  Future<List<StoriesModel>> getStories() async {
    try {
      final jsonString = _sharedPreferences.getString(CACHED_STORIES);
      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        return jsonList.map((json) => StoriesModel.fromJson(json)).toList();
      } else {
        throw Exception();
      }
    } catch (error) {
      throw CachedFailure(message: error.toString());
    }
  }

  @override
  Future<void> saveListBanners({required List<BannersModel> banners}) async {
    try {
      final List<Map<String, dynamic>> jsonList =
          banners.map((bannersModel) => bannersModel.toJson()).toList();
      final String jsonString = json.encode(jsonList);
      await _sharedPreferences.setString(CACHED_BANNERS, jsonString);
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<void> saveListProducts({required List<ProductsModel> products}) async {
    try {
      final List<Map<String, dynamic>> jsonList =
          products.map((productsModel) => productsModel.toJson()).toList();
      final String jsonString = json.encode(jsonList);
      await _sharedPreferences.setString(CACHED_PRODUCTS, jsonString);
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<void> saveListStories({required List<StoriesModel> stories}) async {
    try {
      final List<Map<String, dynamic>> jsonList =
          stories.map((storiesModel) => storiesModel.toJson()).toList();
      final String jsonString = json.encode(jsonList);
      await _sharedPreferences.setString(CACHED_STORIES, jsonString);
    } catch (error) {
      throw error.toString();
    }
  }
}
