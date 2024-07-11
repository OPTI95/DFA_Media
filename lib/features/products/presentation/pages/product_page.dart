import 'package:dfa_media/app/theme/app_colors.dart';
import 'package:dfa_media/core/utlis/extension/extension_on_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/values/app_string.dart';
import '../../../../core/assets/assets.gen.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Stories(theme: theme),
          const SliverPadding(
            padding: EdgeInsets.only(top: 15),
          ),
          Banners(theme: theme),
          const SliverPadding(
            padding: EdgeInsets.only(top: 15),
          ),
          // Добавьте другие Sliver-элементы, если необходимо
          HotSales(theme: theme),
          Products(theme: theme),
        ],
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.theme,
  });
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 20,
          mainAxisExtent: 200,
        ),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 114,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 8, bottom: 8),
              child: Text(
                "Стейк тунца свежемороженый (упаковка 500 г)",
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  4.0),
              child: Row(
                children: [
                  Text(
                    "data",
                    style: theme.textTheme.titleSmall,
                  ),
                  Spacer(),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HotSales extends StatelessWidget {
  const HotSales({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            SizedBox(
              height: 36,
              width: 36,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: AppColors.kThirdColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(Assets.icons.fire),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              AppString.kHotSale,
              style: theme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}

class Banners extends StatelessWidget {
  const Banners({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: SizedBox(
          height: 165,
          child: PageViewWithDots(theme: theme),
        ),
      ),
    );
  }
}

class Stories extends StatelessWidget {
  const Stories({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 108,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(
            width: 5,
          ),
          itemBuilder: (context, index) {
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
                      CircleAvatar(
                        radius: 32,
                        child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR3hizBuSvPUyEHHLmOX0qX7Ha3JKHjYsUbw&s"),
                      ),
                      Text(
                        "Самый сезон! Свежие овощи",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PageViewWithDots extends StatefulWidget {
  const PageViewWithDots({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  State<PageViewWithDots> createState() => _PageViewWithDotsState();
}

class _PageViewWithDotsState extends State<PageViewWithDots> {
  final PageController _pageController = PageController();

  int _currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: PageView.builder(
              onPageChanged: (val) => setState(() {
                _currentIndexPage = val;
              }),
              controller: _pageController,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Сезон клубники",
                          style: widget.theme.textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                          width: 215,
                          child: Text(
                            "Прямо с фермы к столу",
                            style: widget.theme.textTheme.titleMedium,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDotsIndicator(dotsCount: 3, position: _currentIndexPage)
      ],
    );
  }
}

//
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
