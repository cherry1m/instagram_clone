import 'package:flutter/material.dart';
import 'package:flutter_instagram_example/src/widget/feed_box.dart';
import 'package:flutter_instagram_example/src/widget/image_avatar.dart';
import 'package:flutter_instagram_example/src/widget/image_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            _story(),
            _feeds(),
          ],
        ),
      ),
    );
  }

  SliverAppBar _appBar() => SliverAppBar(
        floating: true,
        title: ImageData(path: ImagePath.logo, width: 300),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ImageData(path: ImagePath.active, width: 70),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ImageData(path: ImagePath.dm, width: 70),
          ),
        ],
      );

  Widget _story() => SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageAvatar(
                type: ImageAvatarType.MYSTORY,
                size: 70,
                path:
                    "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
              ),
            ),
            ...List.generate(
                20,
                (index) => const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageAvatar(
                      type: ImageAvatarType.STORY,
                      size: 70,
                      path:
                          "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
                    )))
          ]),
        ),
      );

  Widget _feeds() => SliverList.builder(
      itemCount: 50,
      itemBuilder: (context, index) => FeedBox(
            userThumnail:
                "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
            images: [
              "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
              "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
              "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
              "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
            ],
          ));
}
