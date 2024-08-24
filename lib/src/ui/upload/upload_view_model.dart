import 'package:flutter/material.dart';
import 'package:flutter_instagram_example/src/model/album.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadViewModel extends ChangeNotifier {
  List<Album> _albums = [];

  int _albumIndex = 0;

  List<Album> get albums => _albums;

  int get albumIndex => _albumIndex;

  Album get currentAlbum => _albums[_albumIndex];

  UploadViewModel() {
    _checkPermission(); // 권한 확인 부분
  }

  void _checkPermission() async {
    final ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      // 앨범 가져와야 함.
      _getAlbums();
    } else {
      //설정을 열어 줌.
      PhotoManager.openSetting();
    }
  }

  void _getAlbums() async {
    final paths = await PhotoManager.getAssetPathList();
    for (AssetPathEntity entity in paths) {
      final images = await entity.getAssetListRange(
          start: 0, end: 10000); // 사용자 앨범 만 장의 사진을 가져옴.
      if (images.isNotEmpty) {
        // 앨범이 비어있지 않으면 앨범을 앱으로 가져옴.
        final album = Album(id: entity.id, name: entity.name, images: images);
        _albums.add(album);
      }
    }
    notifyListeners();
  }
}
