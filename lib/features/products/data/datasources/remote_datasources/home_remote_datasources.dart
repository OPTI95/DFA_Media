import 'package:dfa_media/features/products/data/models/banners/banners_model.dart';
import 'package:dfa_media/features/products/data/models/products/products_model.dart';
import 'package:dfa_media/features/products/data/models/stories/stories_model.dart';

abstract interface class HomeRemoteDataSources {
  Future<List<BannersModel>> getBanners();
  Future<List<StoriesModel>> getStories();
  Future<List<ProductsModel>> getProducts();
}
