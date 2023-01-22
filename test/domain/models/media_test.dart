import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/mocks/mocks.dart';

void main() {
  group('Media', () {
    test('should supports value comparisons', () {
      expect(MockMedia.media, MockMedia.media);
    });
  });
}
