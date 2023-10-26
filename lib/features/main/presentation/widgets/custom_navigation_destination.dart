import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/core/resources/colors.dart';

class CustomNavigationDestination extends StatelessWidget {
  const CustomNavigationDestination(this.iconPath, this.activeIconPath,
      {super.key,
      required this.label,
      this.showBadge = false,
      this.count,
      required this.selected});

  final IconData iconPath;
  final IconData activeIconPath;
  final String label;
  final bool showBadge;
  final int? count;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (selected)
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width: 48,
                  child: Divider(
                      thickness: 2, color: AppColors.primaryColor))),
        NavigationDestination(
          icon: NavIcon(
            iconPath,
            showBadge: showBadge,
            count: count,
          ),
          selectedIcon: NavIcon(
            activeIconPath,
            showBadge: showBadge,
            count: count,
          ),
          label: label,
        )
      ],
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon(
    this.iconPath, {
    super.key,
    this.showBadge = false,
    this.count,
  });

  final IconData iconPath;
  final bool showBadge;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      clipBehavior: Clip.none,
      children: [
        Icon(iconPath),
        if (showBadge)
          Positioned(
            right: -4,
            top: -2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8)),
              child: count != null
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: count != null
                          ? Center(
                              child: Text("$count",
                                 ),
                            )
                          : null,
                    )
                  : const SizedBox(
                      width: 8,
                      height: 8,
                    ),
            ),
          )
      ],
    );
  }
}
