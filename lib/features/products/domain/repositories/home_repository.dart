import 'package:dartz/dartz.dart';
import 'package:dfa_media/core/error/error.dart';
import 'package:dfa_media/features/products/domain/entities/product/product_entity.dart';
import '../entities/banners/banners_entity.dart';
import '../entities/stories/stories_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<BannersEntity>>> getBanners();
  Future<Either<Failure, List<StoriesEntity>>> getStories();
}
