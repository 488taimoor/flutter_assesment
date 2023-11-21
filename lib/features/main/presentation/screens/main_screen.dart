import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/resources/colors.dart';

class NavBarCubit extends Cubit<bool> {
  NavBarCubit() : super(true);

  void toggleNavBar(bool isShow) => emit(isShow);
}

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('MainScreen'));
  final StatefulNavigationShell navigationShell;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final isShowNavBar = context.watch<NavBarCubit>().state;
    final index = widget.navigationShell.currentIndex;
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: isShowNavBar
          ? Container(
        height: 75,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(27),
                  topLeft: Radius.circular(27),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  unselectedFontSize: 10,
                  selectedFontSize: 10,
                  unselectedItemColor: AppColors.lightGrayColor,
                  unselectedLabelStyle:
                       TextStyle(color: AppColors.lightGrayColor),
                  backgroundColor: AppColors.primaryColor,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.dashboard,
                        color: AppColors.lightGrayColor,
                      ),
                      activeIcon: Icon(
                        Icons.dashboard,
                        color: AppColors.textColorWhite,
                      ),
                      label: 'Dashbaord',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.play_circle_fill_outlined,
                        color: AppColors.lightGrayColor,
                      ),
                      activeIcon: Icon(
                        Icons.play_circle_fill_outlined,
                        color: AppColors.textColorWhite,
                      ),
                      label: 'Watch',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.library_books_rounded,
                        color: AppColors.lightGrayColor,
                      ),
                      activeIcon: Icon(
                        Icons.library_books_rounded,
                        color: AppColors.textColorWhite,
                      ),
                      label: 'Media Library',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.more_horiz,
                        color: AppColors.lightGrayColor,
                      ),
                      activeIcon: Icon(
                        Icons.more_horiz,
                        color: AppColors.textColorWhite,
                      ),
                      label: 'More',
                    ),
                  ],
                  currentIndex: index,
                  selectedItemColor: AppColors.textColorWhite,
                  onTap: _goToDestination,
                ),
              ),
          )
          : const SizedBox.shrink(),
    );
  }

  void _goToDestination(int index) {
    // TODO: For temporary purpose

    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
