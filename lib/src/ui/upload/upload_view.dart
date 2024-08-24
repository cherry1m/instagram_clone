import 'package:flutter/material.dart';
import 'package:flutter_instagram_example/src/ui/upload/upload_view_model.dart';
import 'package:flutter_instagram_example/src/widget/image_data.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _preview(),
          _header(),
          _images(),
        ],
      ),
    );
  }

  AppBar _appBar() => AppBar(
          foregroundColor: Colors.black,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          title: Text(
            "새 게시물",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "다음",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )
          ]);

  Widget _preview() => AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          color: Colors.black,
          width: double.infinity,
        ),
      );

  Widget _header() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Recent",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                ImageData(path: ImagePath.arrowDownIcon)
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Color(0xf808080), shape: BoxShape.circle),
                child: ImageData(
                  path: ImagePath.imageSelectIcon,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Color(0xf808080), shape: BoxShape.circle),
                child: ImageData(
                  path: ImagePath.cameraIcon,
                ),
              )
            ],
          )
        ],
      );

  Widget _images() =>
      Consumer<UploadViewModel>(builder: (context, provider, child) {
        return (provider.albums.isNotEmpty)
            ? Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0),
                    itemCount: provider.currentAlbum.images.length,
                    itemBuilder: (context, index) {
                      final image = provider.currentAlbum.images[index];
                      return AssetEntityImage(
                        image,
                        fit: BoxFit.cover,
                      );
                    }))
            : Container();
      });
}
