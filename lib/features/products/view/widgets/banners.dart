import 'package:cached_network_image/cached_network_image.dart';
import 'package:dfa_media/app/styles/app_colors.dart';
import 'package:dfa_media/core/utilities/widget/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/banners/banners_bloc.dart';

class Banners extends StatelessWidget {
  const Banners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: SizedBox(
          height: 165,
          child: PageViewWithDots(),
        ),
      ),
    );
  }
}

class PageViewWithDots extends StatelessWidget {
  PageViewWithDots({
    super.key,
  });

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final bannersBloc = context.read<BannersBloc>();

    return BlocBuilder<BannersBloc, BannersState>(
      builder: (context, state) {
        if (state.status == BannersStatus.loaded ||
            state.status == BannersStatus.loading) {
          return Column(
            children: [
              SizedBox(
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: PageView.builder(
                    onPageChanged: (val) => bannersBloc.add(
                      PageChanged(pageIndex: val),
                    ),
                    controller: _pageController,
                    itemCount: state.status == BannersStatus.loaded
                        ? state.banners.length
                        : 3,
                    itemBuilder: (context, index) =>
                        state.status == BannersStatus.loaded
                            ? BannersCard(
                                index: index,
                              )
                            : const LoadingBannersShimmer(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDotsIndicator(
                  dotsCount: state.banners.length,
                  position: state.currentIndexPage)
            ],
          );
        } else {
          return const ErrorIcon();
        }
      },
    );
  }
}

class BannersCard extends StatelessWidget {
  const BannersCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final bannersState = context.read<BannersBloc>().state;
    return CachedNetworkImage(
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
      imageUrl: bannersState.banners[index].image,
    ).animate().fadeIn();
  }
}

class CustomDotsIndicator extends StatelessWidget {
  final int dotsCount;
  final int position;

  const CustomDotsIndicator({
    super.key,
    required this.dotsCount,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(dotsCount, (index) {
        bool isActive = index == position;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: isActive ? 32 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isActive ? Colors.red : Colors.grey),
        );
      }),
    );
  }
}

class LoadingBannersShimmer extends StatelessWidget {
  const LoadingBannersShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(color: AppColors.kWhiteColor),
      ),
    );
  }
}
