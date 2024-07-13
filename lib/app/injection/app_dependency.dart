import 'package:dfa_media/core/platform/nerwork_info_impl.dart';
import 'package:dfa_media/core/platform/network_info.dart';
import 'package:dfa_media/core/utilities/logger/logger.dart';
import 'package:dfa_media/features/products/data/datasources/local_datasources/home_local_datasources.dart';
import 'package:dfa_media/features/products/data/datasources/local_datasources/home_local_datasources_impl.dart';
import 'package:dfa_media/features/products/data/datasources/remote_datasources/home_remote_datasources.dart';
import 'package:dfa_media/features/products/data/datasources/remote_datasources/home_remote_datasources_impl.dart';
import 'package:dfa_media/features/products/data/repositories/home_repository_impl.dart';
import 'package:dfa_media/features/products/domain/repositories/home_repository.dart';
import 'package:dfa_media/features/products/domain/usecases/get_banners.dart';
import 'package:dfa_media/features/products/domain/usecases/get_products.dart';
import 'package:dfa_media/features/products/domain/usecases/get_stories.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/configuration.dart';
import '../../core/scopes/dependency_scope.dart';
import '../boot/app_env.dart';

final class AppDependency extends DependencyScope {
  late final AppEnv appEnv;
  late final InternetConnectionChecker internetConnectionChecker;
  late final SharedPreferences sharedPreferences;
  late final NetworkInfo networkInfo;
  late final HomeRepository homeRepository;
  late final HomeLocalDatasource homeLocalDatasource;
  late final HomeRemoteDataSources homeRemoteDataSources;
  late final GetProducts getProducts;
  late final GetBanners getBanners;
  late final GetStories getStories;
  late final Dio dio;

  AppDependency({required this.appEnv});

  Future<void> init() async {
    logger.warning('Initializing dependencies...');
    await _initDependencies();
    logger.warning('Dependencies initialized!');
  }

  Future<void> _initDependencies() async {
    await dotenv.load();
    internetConnectionChecker = await create<InternetConnectionChecker>(
        () => InternetConnectionChecker.createInstance());
    sharedPreferences = await SharedPreferences.getInstance();
    dio = await create<Dio>(() => Dio(
          BaseOptions(
            baseUrl: Config.baseUrl,
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.info('Request: ${options.method} ${options.path}');
        logger.verbose('Headers: ${options.headers}');
        logger.verbose('Data: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger
            .info('Response: ${response.statusCode} ${response.statusMessage}');
        logger.verbose('Data: ${response.data}');
        return handler.next(response);
      },
      onError: (e, handler) {
        logger.error(
            'Error: ${e.response?.statusCode} ${e.response?.statusMessage}',
            error: e.error,
            stackTrace: e.stackTrace);
        return handler.next(e);
      },
    ));

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 120,
          responseHeader: false,
        ),
      );
    }

    networkInfo = await create<NetworkInfo>(
        () => INetworkInfo(internetConnectionChecker));

    homeLocalDatasource = await create<HomeLocalDatasource>(
      () => IHomeLocalDatasource(sharedPrefences: sharedPreferences),
    );
    homeRemoteDataSources = await create<HomeRemoteDataSources>(
      () => IHomeRemoteDatasource(dio: dio),
    );
    homeRepository = await create<HomeRepository>(
      () => IHomeRepository(
          homeRemoteDataSources: homeRemoteDataSources,
          homeLocalDatasource: homeLocalDatasource,
          netWorkInfo: networkInfo),
    );

    getBanners = await create<GetBanners>(
        () => GetBanners(homeRepository: homeRepository));
    getProducts = await create<GetProducts>(
        () => GetProducts(homeRepository: homeRepository));
    getStories = await create<GetStories>(
        () => GetStories(homeRepository: homeRepository));
  }
}
