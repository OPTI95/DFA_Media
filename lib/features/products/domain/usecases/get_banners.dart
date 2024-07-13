import 'package:dartz/dartz.dart';
import 'package:dfa_media/features/products/domain/entities/banners/banners_entity.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utilities/usecase/usecase.dart';
import '../repositories/home_repository.dart';

final class GetBanners implements UseCase<List<BannersEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetBanners({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<BannersEntity>>> call(
      {required NoParams params}) async {
    return await _homeRepository.getBanners();
  }
}
