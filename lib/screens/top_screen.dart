import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:midjourney/widgets/image_card_widget.dart';
import 'package:midjourney_api/midjourney_api.dart';


class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
        future: MidJourneyApi().fetchTop(),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
              final images = snapshot.data as List<String>;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5
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