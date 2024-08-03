import 'package:flutter_instagram_example/src/ui/app/app_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  group("APP VIEW MODEL TEST", () {
    test("ChangeIndex 메소드 테스트", () {
      final viewModel = AppViewModel();

      expect(viewModel.pageIndex, 0);
      viewModel.changeIndex(3);
      expect(viewModel.pageIndex, 3);
    });
    test("ChangePage 메소드 테스트", () {
      final viewModel = AppViewModel();
      expect(viewModel.pageIndex, 0);
      viewModel.ChangePage(3);
      expect(viewModel.pageIndex, 3);
    });
  });
}