import 'package:dartz/dartz.dart';
import 'package:dfa_media/core/error/error.dart';
import 'package:dfa_media/features/products/data/datasources/local_datasources/home_local_datasources.dart';
import 'package:dfa_media/features/products/data/datasources/remote_datasources/home_remote_datasources.dart';
import 'package:dfa_media/features/products/domain/entities/banners/banners_entity.dart';
import 'package:dfa_media/features/products/domain/entities/product/product_entity.dart';
import 'package:dfa_media/features/products/domain/entities/stories/stories_entity.dart';
import 'package:dfa_media/features/products/domain/repositories/home_repository.dart';

import '../../../../core/platform/network_info.dart';

final class IHomeRepository implements HomeRepository {
  final HomeLocalDatasource _homeLocalDatasource;
  final HomeRemoteDataSources _homeRemoteDataSources;
  final NetworkInfo _networkInfo;

  IHomeRepository(
      {required HomeRemoteDataSources homeRemoteDataSources,
      required HomeLocalDatasource homeLocalDatasource,
      required NetworkInfo netWorkInfo})
      : _homeLocalDatasource = homeLocalDatasource,
        _homeRemoteDataSources = homeRemoteDataSources,
        _networkInfo = netWorkInfo;

  @override
  Future<Either<Failure, List<BannersEntity>>> getBanners() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteList = await _homeRemoteDataSources.getBanners();
        _homeLocalDatasource.saveListBanners(banners: remoteList);
        return Right(remoteList);
      } catch (error) {
        return Left(ServerFailure(message: error.toString()));
      }
    } else {
      try {
        final localList = await _homeLocalDatasource.getBanners();
        return Right(localList);
      } catch (error) {
        return Left(CachedFailure(message: error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteList = await _homeRemoteDataSources.getProducts();
        _homeLocalDatasource.saveListProducts(products: remoteList);
        return Right(remoteList);
      } catch (error) {
        return Left(ServerFailure(message: error.toString()));
      }
    } else {
      try {
        final localList = await _homeLocalDatasource.getProducts();
        return Right(localList);
      } catch (error) {
        return Left(CachedFailure(message: error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<StoriesEntity>>> getStories() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteList = await _homeRemoteDataSources.getStories();

        _homeLocalDatasource.saveListStories(stories: remoteList);
        return Right(remoteList);
      } catch (error) {
        return Left(ServerFailure(message: error.toString()));
      }
    } else {
      try {
        final localList = await _homeLocalDatasource.getStories();
        return Right(localList);
      } catch (error) {
        return Left(CachedFailure(message: error.toString()));
      }
    }
  }
}
