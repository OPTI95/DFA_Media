import 'package:dfa_media/core/utilities/extension/extension_on_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/styles/app_colors.dart';
import '../../../../app/res/app_string.dart';
import '../../../../core/assets/gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required StatefulNavigationShell navigationShell})
      : _navigationShell = navigationShell;
  final StatefulNavigationShell _navigationShell;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: _navigationShell,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                Assets.icons.profile,
                height: 22,
                width: 22,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                AppString.kName,
                style: theme.textTheme.bodyMedium,
              ),
              const Spacer(),
              SvgPicture.asset(Assets.icons.mark),
              const SizedBox(
                width: 8,
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, right: 2),
                    child: SvgPicture.asset(
                      Assets.icons.bell,
                    ),
                  ),
                  Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.kThirdColor,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      AppString.kCountNotf,
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        currentIndex: _navigationShell.currentIndex,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (value) {
          value == 2
              ? null
              : _navigationShell.goBranch(value, initialLocation: true);
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SizedBox(
                child: SvgPicture.asset(
                  Assets.icons.home,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    _navigationShell.currentIndex == 0
                        ? AppColors.kThirdColor
                        : AppColors.kBlackColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: AppString.kHome,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SizedBox(
                child: SvgPicture.asset(
                  height: 24,
                  width: 24,
                  Assets.icons.bag,
                  colorFilter: ColorFilter.mode(
                    _navigationShell.currentIndex == 1
                        ? AppColors.kThirdColor
                        : AppColors.kBlackColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: AppString.kDelivery,
          ),
          const BottomNavigationBarItem(icon: SizedBox(width: 50), label: ""),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                bottom: 4.0,
              ),
              child: SizedBox(
                child: SvgPicture.asset(
                  height: 24,
                  width: 24,
                  Assets.icons.shop,
                  colorFilter: ColorFilter.mode(
                    _navigationShell.currentIndex == 3
                        ? AppColors.kThirdColor
                        : AppColors.kBlackColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: AppString.kShops,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SizedBox(
                child: SvgPicture.asset(
                  height: 24,
                  width: 24,
                  Assets.icons.message,
                  colorFilter: ColorFilter.mode(
                    _navigationShell.currentIndex == 4
                        ? AppColors.kThirdColor
                        : AppColors.kBlackColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            label: AppString.kSupport,
          ),
        ],
      ),
    );
  }
}
