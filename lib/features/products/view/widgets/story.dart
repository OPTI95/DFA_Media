import 'package:cached_network_image/cached_network_image.dart';
import 'package:dfa_media/core/utilities/extension/extension_on_context.dart';
import 'package:dfa_media/core/utilities/widget/error.dart';
import 'package:dfa_media/features/products/view/controller/story/story_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app/styles/app_colors.dart';

class Stories extends StatelessWidget {
  const Stories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 115,
        child: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            if (state.status == StoryStatus.loading ||
                state.status == StoryStatus.loaded) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.status == StoryStatus.loaded
                    ? state.storyes.length
                    : 9,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                itemBuilder: (context, index) {
                  if (state.status == StoryStatus.loaded) {
                    return StoryCard(index: index);
                  } else {
                    return const LoadingStoryesShimmer();
                  }
                },
              );
            } else {
              return const ErrorIcon();
            }
          },
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    final storyState = context.read<StoryBloc>().state;
    return Row(
      children: [
        index == 0
            ? const SizedBox(
                width: 37,
              )
            : const SizedBox(),
        SizedBox(
          width: 80,
          child: Column(
            children: [
              Container(
                height: 64,
                width: 64,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CachedNetworkImage(
                  imageUrl: storyState.storyes[index].previewImage,
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
                  fit: BoxFit.cover,
                ),
              ).animate().scaleXY(),
              const SizedBox(
                height: 5,
              ),
              Text(
                storyState.storyes[index].title,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ).animate().fade(delay: const Duration(milliseconds: 300))
            ],
          ),
        ),
      ],
    );
  }
}

class LoadingStoryesShimmer extends StatelessWidget {
  const LoadingStoryesShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 64,
        width: 64,
        decoration:
            BoxDecoration(color: AppColors.kWhiteColor, shape: BoxShape.circle),
      ),
    );
  }
}
