import 'package:flutter/material.dart';
import 'package:flutter_instagram_example/src/ui/search/search_focus_view.dart';
import 'package:flutter_instagram_example/src/ui/utils/animation_route.dart';
import 'package:flutter_instagram_example/src/widget/image_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            _imageGrid(),
          ],
        ),
      ),
    );
  }

  Widget _imageGrid() => SliverGrid.builder(
      itemCount: 40,
      gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          pattern: [
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
          ]),
      itemBuilder: (context, index) => Container(
            color: Colors.blue,
          ));

  Widget _appBar() => SliverAppBar(
        floating: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context)
                .push(AnimationRoute(const SearchFocusView())),
            child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Color(0xffefefef),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      Text(
                        "검색",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      )
                    ],
                  ),
                )),
          ),
        ),
      );
}
