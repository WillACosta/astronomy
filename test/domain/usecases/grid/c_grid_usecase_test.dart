import 'package:astronomy/core/failures/service_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';

import 'package:astronomy/domain/usecases/grid/c_grid_usecase.dart';
import 'package:astronomy/core/failures/failure.exception.dart';
import 'package:astronomy/domain/models/grid_page_dto.dart';
import 'package:astronomy/domain/models/media.dart';

import '../../../fixtures/mocks/data.dart';
import '../../../fixtures/mocks/mocktail_class.dart';

void main() {
  late FakeApodRepository apodRepository;
  late CGridUseCase usecase;

  setUp(() {
    apodRepository = FakeApodRepository();
    usecase = CGridUseCase(apodRepository);
  });

  test(
    'should request a list of media to APOD Repository and return Right',
    () async {
      final List<Media> fakeList = [];

      when(
        () => apodRepository.getMediaList(
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
        ),
      ).thenAnswer(
        (_) async => Right(fakeList),
      );

      final response = await usecase.getMediaList(
        GridPageDto(dateTimeRange: dateTimeRange),
      );

      expect(response.isRight(), true);
      expect(response.fold(id, id), isA<List<Media>>());
    },
  );

  test(
    'should request a list of media to APOD Repository and return Left',
    () async {
      when(
        () => apodRepository.getMediaList(
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
        ),
      ).thenAnswer(
        (_) async => Left(
          ServiceFailure(),
        ),
      );

      final response = await usecase.getMediaList(
        GridPageDto(dateTimeRange: dateTimeRange),
      );

      expect(response.isLeft(), true);
      expect(response.fold(id, id), isA<Failure>());
    },
  );
}
