import 'package:flutter/material.dart';
import 'package:midjourney/bloc/menu/menu_cubit.dart';
import 'package:midjourney/screens/favorites_screen.dart';
import 'package:midjourney/screens/recent_screen.dart';
import 'package:midjourney/screens/top_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = [
      const RecetScreen(),
      const TopScreen(),
      const FavoritesScreen()
    ];
    return Scaffold(
      body: Consumer<MenuCubit>(
        builder: (context, menuCubit, child) {
          return screen[menuCubit.currentScreen];
        },
      ),
      bottomNavigationBar: Consumer<MenuCubit>(
        builder: (context, menuCubit, child) {
          return BottomNavigationBar(
            enableFeedback: false,
            currentIndex:
                menuCubit.currentScreen, // Accede a la propiedad currentScreen
            onTap: (int index) {
              menuCubit.changeScreen(index);
              print('Dame El index: $index');
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Recent',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star_purple500_outlined),
                label: 'Top',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
            ],
          );
        },
      ),
    );
  }
}
