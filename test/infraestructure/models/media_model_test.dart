import 'package:astronomy/infraestructure/models/media_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/mocks/media.dart';

void main() {
  group('MediaModel', () {
    test('should supports value comparisons', () {
      expect(MockMedia.mediaModel, MockMedia.mediaModel);
    });
  });
}
