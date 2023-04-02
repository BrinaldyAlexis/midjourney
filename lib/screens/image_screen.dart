import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 500,
            width: 500,
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
                  
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.share),
                  ),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
                  
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.format_paint),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
                  
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.favorite),
                ),
              ),
              
            ],
          ), 
        ],
      )
    );
  }
}