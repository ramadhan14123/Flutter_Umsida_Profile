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
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index); // tetap panggil callback parent

        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/goal');
            break;
          case 2:
            Navigator.pushNamed(context, '/info');
            break;
          case 3:
            Navigator.pushNamed(context, '/contact');
            break;
        }
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
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
    );
  }
}
