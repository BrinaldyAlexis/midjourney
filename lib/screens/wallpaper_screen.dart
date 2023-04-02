import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:midjourney/bloc/callery/gallery_cubit.dart';
import 'package:midjourney/widgets/wallpaper_option_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class WallPapeScreen extends StatelessWidget {
  const WallPapeScreen({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.select((GalleryCubit cubit) => cubit.isFavorite(imgUrl));
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: imgUrl,
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              WallpaperOptionWidget(
                text: 'Favorite',
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  context.read<GalleryCubit>().toggleFavorite(imgUrl);
                },
              ),
              WallpaperOptionWidget(
                  text: 'Set as wallpaper',
                  icon: const Icon(Icons.imagesearch_roller),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Set as wallpaper'),
                              content: const Text(
                                  'Do you want to set this image as wallpaper?'),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setWallpaper();
                                    },
                                    child: const Text('Set'))
                              ],
                            ));
                  }),
              WallpaperOptionWidget(
                  text: 'Share',
                  icon: const Icon(Icons.share),
                  onPressed: () => shareImg(context)),
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.chevron_left, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      
    );
  }

  shareImg(BuildContext context) async {
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

  Future<void> setWallpaper() async {
    int location = WallpaperManager
        .BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
    final file = await DefaultCacheManager().getSingleFile(imgUrl);
    await WallpaperManager.setWallpaperFromFile(file.path, location);
  }
}
