import 'package:dartz/dartz.dart';
import 'package:dfa_media/features/products/domain/entities/stories/stories_entity.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utlis/usecase/usecase.dart';
import '../repositories/home_repository.dart';

final class GetStories implements UseCase<List<StoriesEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetStories({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<StoriesEntity>>> call(
      {required NoParams params}) async {
    return await _homeRepository.getStories();
  }
}
