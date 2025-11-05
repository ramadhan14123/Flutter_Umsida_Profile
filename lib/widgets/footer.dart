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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),  // hanya atas kiri
          topRight: Radius.circular(25), // hanya atas kanan
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, -2), // sedikit ke atas supaya natural
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
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
          backgroundColor: Colors.white,
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
    );
  }
}
