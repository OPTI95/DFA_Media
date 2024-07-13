part of 'banners_bloc.dart';

sealed class BannersEvent extends Equatable {
  const BannersEvent();

  @override
  List<Object> get props => [];
}

class LoadBanners extends BannersEvent {
  @override
  List<Object> get props => [];
}

class PageChanged extends BannersEvent {
  final int pageIndex;

  const PageChanged({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];
}
