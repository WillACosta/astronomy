import 'package:astronomy/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:astronomy/infraestructure/repositories/c_apod_repository.dart';
import 'package:astronomy/network/services/nasa_open_apis_service.dart';

import '../../fixtures/mocks/mocks.dart';
import '../../fixtures/stubs/generic_service_stub.dart';

class MockNASAOpenAPIsService extends Mock implements NASAOpenAPIsService {}

void main() {
  late NASAOpenAPIsService service;
  late CApodRepository repository;

  setUpAll(() {
    registerFallbackValue(MockMedia.mediaDate);
  });

  setUp(() {
    service = MockNASAOpenAPIsService();
    repository = CApodRepository(service);
  });

  group('CApodRepository', () {
    group('getMediaOfTheDay', () {
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

      test(
        'should call service method and returns an Left with Failure',
        () async {
          setUpServiceExceptionResponse(() => service.getMediaOfTheDay());

          final actual = await repository.getMediaOfTheDay();

          expect(actual, const Left(Failure.unexpected()));
          verify(() => service.getMediaOfTheDay());
        },
      );
    });

    group('getMediaList', () {
      test(
        'should call service method and return a Right with list of Media',
        () async {
          setUpServiceResponseOf(
            () => service.getMediaList(any(), any()),
            body: MockMedia.mediaList,
            statusCode: 200,
          );

          expect(
            await service.getMediaList(
              MockMedia.mediaDate,
              MockMedia.mediaDate,
            ),
            Right(MockMedia.mediaList),
          );

          verify(() => service.getMediaList(any(), any()));
        },
      );

      test(
        'should call service method and returns an Left with Failure',
        () async {
          setUpServiceExceptionResponse(
            () => service.getMediaList(any(), any()),
          );

          expect(
            await repository.getMediaOfTheDay(),
            const Left(Failure.unexpected()),
          );

          verify(() => service.getMediaOfTheDay());
        },
      );
    });
  });
}
