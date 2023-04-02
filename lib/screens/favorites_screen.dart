import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourney/bloc/callery/gallery_cubit.dart';
import 'package:midjourney/screens/wallpaper_screen.dart';
import 'package:midjourney/widgets/wallpaper_card_widget.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.select(
      (GalleryCubit cubit) => cubit.state.favorites);

      final sorted = favorites.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      final fovoritesGrid = sorted.isEmpty? const Center(
        child: Text('No tienes favoritas aún'),
      ) : GridView.builder(
            itemCount: sorted.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.2,

            ),
            itemBuilder: (context, index) {
              return WallapeprCardWidget(
                onPressed: (){
                   Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WallPapeScreen(imgUrl: sorted[index].key)
                      )
                    );
                }, 
                imgUrl: sorted[index].key
              );
            },
      );


    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Images'),
      ),
      body: fovoritesGrid
    
    );
  }
}