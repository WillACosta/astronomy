import 'package:astronomy/core/failures/service_failure.dart';
import 'package:astronomy/infraestructure/repositories/c_apod_repository.dart';
import 'package:astronomy/network/services/nasa_open_apis_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/mocks/mocks.dart';
import '../../fixtures/stubs/generic_service_stub.dart';

class MockNASAOpenAPIsService extends Mock implements NASAOpenAPIsService {}

void main() {
  late NASAOpenAPIsService service;
  late CApodRepository repository;

  setUp(() {
    service = MockNASAOpenAPIsService();
    repository = CApodRepository(service);
  });

  group('CApodRepository', () {
    test(
      'should call service method and return an Right with MediaModel',
      () async {
        setUpServiceResponseOf(
          () => service.getMediaOfTheDay(),
          body: MockMedia.media,
          statusCode: 200,
        );

        final actual = await repository.getMediaOfTheDay();

        expect(actual, Right(MockMedia.media));
        verify(() => service.getMediaOfTheDay());
      },
    );

    test('shuld call service method and throw an Exception', () async {
      setUpServiceExceptionResponse(() => service.getMediaOfTheDay());

      final actual = await repository.getMediaOfTheDay();

      expect(actual, const Left(ServiceFailure()));
      verify(() => service.getMediaOfTheDay());
    });
  });
}
