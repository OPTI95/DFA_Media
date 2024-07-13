import 'package:cached_network_image/cached_network_image.dart';
import 'package:dfa_media/app/styles/app_colors.dart';
import 'package:dfa_media/core/assets/gen/assets.gen.dart';
import 'package:dfa_media/core/utilities/extension/extension_on_context.dart';
import 'package:dfa_media/core/utilities/widget/error.dart';
import 'package:dfa_media/features/products/view/controller/products/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      sliver: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.status == ProductStatus.loaded ||
              state.status == ProductStatus.loading) {
            return SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 20,
                mainAxisExtent: 200,
              ),
              itemCount: state.status == ProductStatus.loading
                  ? 9
                  : state.products.length,
              itemBuilder: (context, index) =>
                  state.status == ProductStatus.loading
                      ? const LoadingProductsShimmer()
                      : ProductCard(
                          index: index,
                        ),
            );
          } else {
            return const SliverToBoxAdapter(child: ErrorIcon());
          }
        },
      ),
    );
  }
}

class LoadingProductsShimmer extends StatelessWidget {
  const LoadingProductsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            Container(
                height: 100,
                width: double.infinity,
                color: AppColors.kWhiteColor),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 30,
                width: double.infinity,
                color: AppColors.kWhiteColor),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 20,
                width: double.infinity,
                color: AppColors.kWhiteColor),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    final productState = context.read<ProductsBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 114,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: productState.products[index].image,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ).animate().scaleXY(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 8, bottom: 8),
          child: Text(
            productState.products[index].title,
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.start,
            maxLines: 3,
          ).animate().slideY(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              Text(
                "${productState.products[index].price} ₽/${productState.products[index].unitText}",
                style: theme.textTheme.titleSmall,
              ).animate().fadeIn(),
              const Spacer(),
              SizedBox(
                height: 24,
                width: 24,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(
                      Assets.icons.addToCart,
                      colorFilter: ColorFilter.mode(
                          AppColors.kThirdColor, BlendMode.dstIn),
                    ),
                  ),
                ),
              ).animate().scale(), // Анимация bounceIn для иконки
            ],
          ),
        ),
      ],
    );
  }
}
