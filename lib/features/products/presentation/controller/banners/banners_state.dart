part of 'banners_bloc.dart';

enum BannersStatus { initial, loading, loaded, error }

final class BannersState {
  final BannersStatus status;
  final List<BannersEntity> banners;
  final int currentIndexPage;
  BannersState({
    this.status = BannersStatus.initial,
    this.banners = const [],
    this.currentIndexPage = 0,
  });

  BannersState copyWith({
    BannersStatus? status,
    List<BannersEntity>? banners,
    int? currentIndexPage,
  }) {
    return BannersState(
      status: status ?? this.status,
      banners: banners ?? this.banners,
      currentIndexPage:
          currentIndexPage ?? this.currentIndexPage,
    );
  }
}
