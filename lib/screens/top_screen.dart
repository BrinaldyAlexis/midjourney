import 'package:flutter/material.dart';
import 'package:midjourney/screens/image_screen.dart';
import 'package:midjourney/widgets/image_card_widget.dart';
import 'package:midjourney_api/midjourney_api.dart';


class TopScreen extends StatelessWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Images'),
      ),
      body: FutureBuilder(
      future: MidJourneyApi().fetchTop(),
      builder: (context, snapshot) {
          if (snapshot.hasData) {
            final images = snapshot.data as List<String>;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.2,

              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ImageCardWidget(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ImageScreen(imgUrl: images[index])
                      )
                    );
                  }, 
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
      )
    );
  }
}