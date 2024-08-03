import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ImageAvatarType { ON, OFF, STORY, MYSTORY }

class ImageAvatar extends StatelessWidget {
  final String path;
  final double size;
  final ImageAvatarType type;
  const ImageAvatar(
      {super.key, required this.path, required this.size, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageAvatarType.MYSTORY:
        return _myStory();
      case ImageAvatarType.STORY:
        return _story();
      case ImageAvatarType.ON:
        return _basic();
      case ImageAvatarType.OFF:
        return _bottomNavAvatar();
      default:
        return _story();
    }
  }

  Widget _myStory() => Stack(
        children: [
          Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: _basic()),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      );

  Widget _story() => Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffceB0a),
                Color(0xfffc3a0a),
                Color(0xffc80afc),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(100)),
        child: Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: _basic()),
      );

  Widget _bottomNavAvatar() => Container(
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: (type == ImageAvatarType.ON) ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(100)),
        child: Container(
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: _basic(),
        ),
      );

  Widget _basic() => ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
          height: size,
          width: size,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: path,
          ),
        ),
      );
}
