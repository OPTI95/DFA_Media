import 'package:dfa_media/core/utilities/extension/string.dart';
import 'package:dfa_media/core/utilities/logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onTransition(
      Bloc<Object?, Object?> bloc, Transition<Object?, Object?> transition) {
    final buffer = StringBuffer()
      ..write('Bloc: ${bloc.runtimeType} | ')
      ..writeln('${transition.event.runtimeType}')
      ..write('Transition: ${transition.currentState.runtimeType}')
      ..writeln(' => ${transition.nextState.runtimeType}')
      ..write('New State: ${transition.nextState.toString().limit(100)}');
    logger.info(buffer.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    final buffer = StringBuffer()
      ..writeln('Bloc: ${bloc.runtimeType} | ${event.runtimeType}')
      ..write('Event: ${event.toString().limit(200)}');
    logger.info(buffer.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    logger.error('Bloc: ${bloc.runtimeType} | $error',
        error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
