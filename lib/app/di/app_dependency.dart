import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/constants/config.dart';
import '../../core/dependency_scope/dependency_scope.dart';
import '../../core/utlis/logger/logger,dart';
import '../runner/app_env.dart';

final class AppDependency extends DependencyScope {
  late final AppEnv appEnv;

  late final Dio dio;

  AppDependency({required this.appEnv});

  Future<void> init() async {
    logger.warning('Initializing dependencies...');
    await _initDependencies();
    logger.warning('Dependencies initialized!');
  }

  Future<void> _initDependencies() async {
    await dotenv.load();
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
  }
}
