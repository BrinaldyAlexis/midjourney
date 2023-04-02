import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourney/bloc/callery/gallery_cubit.dart';

class WallapeprCardWidget extends StatelessWidget {
  const WallapeprCardWidget({super.key, required this.onPressed, required this.imgUrl});

  final VoidCallback? onPressed;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select(
      (GalleryCubit cubit) => cubit.isFavorite(imgUrl)
    );
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(child: SizedBox(height: 15, width: 15, child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
              ),
              onPressed: (){
                context.read<GalleryCubit>().toggleFavorite(imgUrl);
              }, 
            )
          )
          
        ],
      ));
  }
}