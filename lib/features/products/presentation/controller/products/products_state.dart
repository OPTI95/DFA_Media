part of 'products_bloc.dart';

enum ProductStatus { initial, loading, loaded, error }

final class ProductsState {
  final ProductStatus status;
  final List<ProductEntity> products;

  ProductsState({
    this.status = ProductStatus.initial,
    this.products = const [],
  });

  ProductsState copyWith({
    ProductStatus? status,
    List<ProductEntity>? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products
    );
  }
}