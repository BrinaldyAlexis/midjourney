
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourney/bloc/callery/gallery_cubit.dart';
import 'package:midjourney/widgets/image_option_widget.dart';
import 'package:share_plus/share_plus.dart';


class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select(
      (GalleryCubit cubit) => cubit.isFavorite(imgUrl)
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imgUrl,
            height: size.height * 0.85,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageOptionWidget(
                  text: 'Favorite',
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: (){
                    context.read<GalleryCubit>().toggleFavorite(imgUrl);
                  },
                ),
                ImageOptionWidget(
                  text: 'Set as wallpaper',
                  icon: const Icon(Icons.imagesearch_roller),
                  onPressed: (){},
                ),
                ImageOptionWidget(
                  text: 'Share',
                  icon: const Icon(Icons.share),
                  onPressed: () => shareImg(context)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  shareImg(BuildContext context) async{
    // await Share.share(imgUrl);
    //share img
    final byteData = await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl);
    final bytes = byteData.buffer.asUint8List();
    final name = imgUrl.split('/').last;
    // ignore: use_build_context_synchronously
    final box = context.findRenderObject() as RenderBox;
    final file = XFile.fromData(bytes, name: name, mimeType: 'image/png');
    await Share.shareXFiles(
      [file],
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );


  }
}