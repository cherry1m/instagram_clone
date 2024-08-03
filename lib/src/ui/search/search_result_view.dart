import 'package:flutter/material.dart';
import 'package:flutter_instagram_example/src/ui/search/search_focus_view.dart';
import 'package:flutter_instagram_example/src/ui/utils/animation_route.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key});

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
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
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: SizedBox(
              width: double.infinity,
              height: AppBar().preferredSize.height,
              child: TabBar(
                labelColor: Colors.black,
                tabAlignment: TabAlignment.fill,
                labelPadding: EdgeInsets.zero,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "추천",
                  ),
                  Tab(
                    text: "계정",
                  ),
                  Tab(
                    text: "오디오",
                  ),
                  Tab(
                    text: "태그",
                  ),
                  Tab(
                    text: "장소",
                  ),
                  Tab(
                    text: "릴스",
                  ),
                ],
              ),
            )));
  }

  Widget _body() => TabBarView(controller: _tabController, children: [
        Center(
          child: Text("추천"),
        ),
        Center(
          child: Text("계정"),
        ),
        Center(
          child: Text("오디오"),
        ),
        Center(
          child: Text("태그"),
        ),
        Center(
          child: Text("징소"),
        ),
        Center(
          child: Text("릴스"),
        ),
      ]);
}
