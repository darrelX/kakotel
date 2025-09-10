import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakotel_test/core/constants/colors/app_colors.dart';
import 'package:kakotel_test/core/constants/images/app_image.dart';


class BottomNivagatorBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onDestinationSelected;
  const BottomNivagatorBar({
    super.key,
    this.selectedIndex = 0,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                    color: AppColors.secondary, fontWeight: FontWeight.bold);
              }
              return const TextStyle(
                  color: AppColors.black); // Couleur pour les non-sélectionnés
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          // backgroundColor: context.theme.scaffoldBackgroundColor,
          // indicatorColor: context.theme.scaffoldBackgroundColor,
          height: 50.h,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                AppImage.home,
                height: 20.r,
                width: 20.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.sponsorButton,
                  BlendMode.srcIn,
                ),
              ),
              selectedIcon: SvgPicture.asset(
                AppImage.homeActive,
                height: 20.r,
                width: 20.r,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AppImage.searchIcon,
                height: 20.r,
                width: 20.r,
              ),
              selectedIcon: SvgPicture.asset(
                AppImage.searchActive,
                height: 20.r,
                width: 20.r,
              ),
              label: 'Thematiques',
            ),
          ],
        ),
      ),
    );
  }
}
