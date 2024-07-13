import 'package:dfa_media/app/theme/app_colors.dart';
import 'package:dfa_media/core/assets/gen/assets.gen.dart';
import 'package:dfa_media/core/utlis/extension/extension_on_context.dart';
import 'package:dfa_media/features/products/presentation/widgets/banners.dart';
import 'package:dfa_media/features/products/presentation/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/values/app_string.dart';
import '../widgets/story.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const Stories(),
          const SliverPadding(
            padding: EdgeInsets.only(top: 15),
          ),
          const Banners(),
          const SliverPadding(
            padding: EdgeInsets.only(top: 15),
          ),
          HotSales(theme: theme),
          const Products(),
        ],
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
            ).animate().scaleXY(delay: const Duration(milliseconds: 600))
          ],
        ),
      ),
    );
  }
}

