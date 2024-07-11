import 'package:dfa_media/features/products/data/models/banners/banners_model.dart';
import 'package:dfa_media/features/products/data/models/products/products_model.dart';
import 'package:dfa_media/features/products/data/models/stories/stories_model.dart';


abstract interface class HomeLocalDatasource {
  Future<void> saveListBanners ({required List<BannersModel> banners});
  Future<void> saveListProducts ({required List<ProductsModel> products});
  Future<void> saveListStories ({required List<StoriesModel> stories});
  Future<List<BannersModel>> getBanners();
  Future<List<ProductsModel>> getProducts();
  Future<List<StoriesModel>> getStories();
}