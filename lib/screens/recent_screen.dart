import 'package:flutter/material.dart';

import 'package:midjourney/widgets/image_card_widget.dart';
import 'package:midjourney_api/midjourney_api.dart';


class RecetScreen extends StatelessWidget {
  const RecetScreen({super.key, });


  @override
  Widget build(BuildContext context) {
    // final isFavorite = context.select(
    //   (GalleryCubit cubit) => cubit.isFavorite(imgUrl!)
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
        future: MidJourneyApi().fetchRecent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final images = snapshot.data as List<String>;
            return GridView.builder(
              
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ImageCardWidget(
                  onPressed: (){}, 
                  imgUrl: images[index]
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        ),
      )
    );
  }
}