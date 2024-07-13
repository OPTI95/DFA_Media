import 'package:dartz/dartz.dart';
import 'package:dfa_media/features/products/domain/entities/product/product_entity.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utilities/usecase/usecase.dart';
import '../repositories/home_repository.dart';

final class GetProducts implements UseCase<List<ProductEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetProducts({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      {required NoParams params}) async {
    return await _homeRepository.getProducts();
  }
}
