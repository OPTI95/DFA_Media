import 'package:bloc/bloc.dart';
import 'package:dfa_media/features/products/domain/usecases/get_products.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/utlis/usecase/usecase.dart';
import '../../../domain/entities/product/product_entity.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts _getProducts;
  ProductsBloc({required GetProducts getProducts})
      : _getProducts = getProducts,
        super(ProductsState(status: ProductStatus.initial)) {
    on<LoadProducts>(_onLoadProducts);
  }
  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductsState> emit) async {
    try {
      if (state.status != ProductStatus.loaded) {
        emit(state.copyWith(status: ProductStatus.loading));
      }
      final data = await _getProducts.call(params: NoParams());
      data.fold(
        (error) => emit(state.copyWith(status: ProductStatus.error)),
        (data) {        
          emit(state.copyWith(status: ProductStatus.loaded, products: data));},
      );
    } catch (error) {
      emit(state.copyWith(status: ProductStatus.error));
    }
  }
}
