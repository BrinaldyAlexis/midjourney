// ignore_for_file: depend_on_referenced_packages

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
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined),
                label: 'Recent',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star_border_outlined),
                label: 'Top',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_outlined),
                label: 'Favorite',
              ),
            ],
          );
        },
      ),
    );
  }
}
