import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_instagram_example/src/widget/image_avatar.dart';
import 'package:flutter_instagram_example/src/widget/image_data.dart';
import 'package:flutter_instagram_example/src/widget/profile_edit_button.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
          appBar: _appBar(),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverList(
                    delegate: SliverChildListDelegate([_info(), _buttons()]))
              ];
            },
            body: Column(
              children: [
                _tabs(),
                _tabBarView(),
              ],
            ),
          )),
    );
  }

  AppBar _appBar() => AppBar(
        title: Row(
          children: [
            Text("cherry_1m"),
            ImageData(path: ImagePath.arrowDownIcon)
          ],
        ),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        centerTitle: false,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(path: ImagePath.upload),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(path: ImagePath.menuIcon),
          ),
        ],
      );

  Widget _info() => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageAvatar(
                path:
                    "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
                size: 90,
                type: ImageAvatarType.MYSTORY),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "0",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("게시물")
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "0",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("팔로워")
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "0",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("팔로잉")
                  ],
                ),
              ],
            ),
          )
        ],
      );

  Widget _buttons() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ProfileEditButton(
                    onPressed: () {},
                    child: Text(
                      "프로필 편집",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ProfileEditButton(
                    onPressed: () {},
                    child: Text(
                      "프로필 공유",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
              ),
            )
          ],
        ),
      );

  Widget _tabBarView() => Expanded(
        child: TabBarView(children: [
          _myFeeds(),
          _myShorts(),
          _myTageImages(),
        ]),
      );

  Widget _myFeeds() => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
      itemCount: 50,
      itemBuilder: (context, index) => Container(
            color: Colors.blue,
          ));

  Widget _myShorts() => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          childAspectRatio: 0.5),
      itemCount: 50,
      itemBuilder: (context, index) => Container(
            color: Colors.cyan,
          ));

  Widget _myTageImages() => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
      itemCount: 50,
      itemBuilder: (context, index) => Container(
            color: Colors.green,
          ));

  Widget _tabs() => TabBar(tabs: [
        Tab(icon: ImageData(path: ImagePath.gridViewOn)),
        Tab(
          icon: ImageData(path: ImagePath.reelsOff),
        ),
        Tab(
          icon: ImageData(
            path: ImagePath.myTagImageOff,
          ),
        ),
      ]);
}
