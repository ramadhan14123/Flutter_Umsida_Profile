import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFooter extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomFooter({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color scaffoldBg = Theme.of(context).scaffoldBackgroundColor;

    // Warna ikon
    const Color selectedColor = Colors.orange;
    const Color unselectedColor = Colors.black54;

    return Container(
      color: scaffoldBg,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (index) {
                onTap(index);
                final routeName = ModalRoute.of(context)?.settings.name;
                switch (index) {
                  case 0:
                    if (routeName != '/home') {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                    break;
                  case 1:
                    if (routeName != '/goal') {
                      Navigator.pushReplacementNamed(context, '/goal');
                    }
                    break;
                  case 2:
                    if (routeName != '/faculty') {
                      Navigator.pushReplacementNamed(context, '/faculty');
                    }
                    break;
                  case 3:
                    if (routeName != '/contact') {
                      Navigator.pushReplacementNamed(context, '/contact');
                    }
                    break;
                }
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: _buildSvgIcon(
                    'assets/icon/homee.svg',
                    isSelected: currentIndex == 0,
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildSvgIcon(
                    'assets/icon/target-hit.svg',
                    isSelected: currentIndex == 1,
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  label: 'Goal',
                ),
                BottomNavigationBarItem(
                  icon: _buildSvgIcon(
                    'assets/icon/book.svg',
                    isSelected: currentIndex == 2,
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  label: 'Info',
                ),
                BottomNavigationBarItem(
                  icon: _buildSvgIcon(
                    'assets/icon/call.svg',
                    isSelected: currentIndex == 3,
                    selectedColor: selectedColor,
                    unselectedColor: unselectedColor,
                  ),
                  label: 'Contact',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Widget pembuat ikon SVG
  static Widget _buildSvgIcon(
    String assetPath, {
    required bool isSelected,
    required Color selectedColor,
    required Color unselectedColor,
  }) {
    return SvgPicture.asset(
      assetPath,
      width: 26,
      height: 26,
      colorFilter: ColorFilter.mode(
        isSelected ? selectedColor : unselectedColor,
        BlendMode.srcIn,
      ),
    );
  }
}
