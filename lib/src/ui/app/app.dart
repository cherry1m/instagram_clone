import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_instagram_example/src/ui/app/app_view_model.dart';
import 'package:flutter_instagram_example/src/ui/home/home_view.dart';
import 'package:flutter_instagram_example/src/ui/search/search_view.dart';
import 'package:flutter_instagram_example/src/widget/image_avatar.dart';
import 'package:flutter_instagram_example/src/widget/image_data.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<AppViewModel>(context);
    return PopScope(
      canPop: _viewModel.canPop,
      onPopInvoked: _viewModel.back,
      child: Scaffold(
        body: _body(),
        bottomNavigationBar: _bottomNav(),
      ),
    );
  }

  Widget _body() => Consumer<AppViewModel>(builder: (context, provider, child) {
        return IndexedStack(
          index: provider.pageIndex,
          children: [
            const HomeView(),
            // 중첩 라우팅
            Navigator(
              key: provider.key,
              onGenerateRoute: (setting) {
                return MaterialPageRoute(
                    builder: (context) => const SearchView());
              },
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.black,
            ),
          ],
        );
      });

  Widget _bottomNav() =>
      Consumer<AppViewModel>(builder: (context, provider, child) {
        return BottomNavigationBar(
            currentIndex: provider.pageIndex,
            onTap: provider.ChangePage,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.homeOff),
                  activeIcon: ImageData(path: ImagePath.homeOn),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.searchOff),
                  activeIcon: ImageData(path: ImagePath.searchOn),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.upload), label: ""),
              BottomNavigationBarItem(
                  icon: ImageData(path: ImagePath.reelsOn),
                  activeIcon: ImageData(path: ImagePath.reelsOn),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageAvatar(
                    type: ImageAvatarType.OFF,
                    path:
                        "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
                    size: 28,
                  ),
                  activeIcon: ImageAvatar(
                      type: ImageAvatarType.ON,
                      path:
                          "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
                      size: 28),
                  label: ""),
            ]);
      });
}
