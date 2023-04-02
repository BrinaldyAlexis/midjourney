import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourney/bloc/callery/gallery_cubit.dart';
import 'package:midjourney/widgets/image_card_widget.dart';


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
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
            itemBuilder: (context, index) {
              return ImageCardWidget(
                onPressed: (){}, 
                imgUrl: sorted[index].key
              );
            },
      );
      
      
      // ListView.builder(
      //   itemCount: sorted.length,
      //   itemBuilder: (context, index) {
      //     final favorite = sorted[index];
      //     return ListTile(
      //       title: Text(favorite.key),
      //       trailing: Text(favorite.value.toString()),
      //     );
      //   },
      // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: fovoritesGrid
      )
    
    );
  }
}