import 'package:bloc/bloc.dart';
import 'package:dfa_media/core/utilities/usecase/usecase.dart';
import 'package:dfa_media/features/products/domain/entities/banners/banners_entity.dart';
import 'package:dfa_media/features/products/domain/usecases/get_banners.dart';
import 'package:equatable/equatable.dart';

part 'banners_event.dart';
part 'banners_state.dart';

class BannersBloc extends Bloc<BannersEvent, BannersState> {
  final GetBanners _getBanners;
  BannersBloc({required GetBanners getBanners})
      : _getBanners = getBanners,
        super(BannersState(status: BannersStatus.initial)) {
    on<LoadBanners>(_onLoadBanners);
    on<PageChanged>(_onPageChanged);
  }

  Future<void> _onLoadBanners(
      LoadBanners event, Emitter<BannersState> emit) async {
    try {
      if (state.status != BannersStatus.loaded) {
        emit(state.copyWith(status: BannersStatus.loading));
      }
      final data = await _getBanners.call(params: NoParams());
      data.fold(
        (error) => emit(state.copyWith(status: BannersStatus.error)),
        (data) {
          emit(state.copyWith(status: BannersStatus.loaded, banners: data));
        },
      );
    } catch (error) {
      emit(state.copyWith(status: BannersStatus.error));
    }
  }

  void _onPageChanged(PageChanged event, Emitter<BannersState> emit) {
    emit(state.copyWith(currentIndexPage: event.pageIndex));
  }
}
