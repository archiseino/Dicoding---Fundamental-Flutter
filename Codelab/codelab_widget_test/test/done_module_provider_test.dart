import 'package:dicodingacademy/provider/done_module_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("provider test", () {
    test('should contain new item when module completed', () {
      // arrange
      var doneModuleProvider = DoneModuleProvider();
      var testModuleName = 'Test Module';
      // act
      doneModuleProvider.complete(testModuleName);
      // assert
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);
      expect(result, true);
    });

    test("should contain no item after the item removed", () {
      // arrange
      var doneModuleProvider = DoneModuleProvider();
      var item1 = "Item 1";
      // act
      doneModuleProvider.complete(item1);
      doneModuleProvider.removed(item1);
      //assert
      var result = doneModuleProvider.doneModuleList.isEmpty;
      expect(result, true);
    });
  });
}
