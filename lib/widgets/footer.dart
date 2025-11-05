import 'package:flutter/material.dart';

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
    // Warna background halaman utama
    final Color scaffoldBg = Theme.of(context).scaffoldBackgroundColor;

    return Container(
      // pastikan warna luar sama persis dengan Scaffold
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
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.black54,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.track_changes_outlined),
                  label: 'Goal',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined),
                  label: 'Info',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.phone_outlined),
                  label: 'Contact',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
