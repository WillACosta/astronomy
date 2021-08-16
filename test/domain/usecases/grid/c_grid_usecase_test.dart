import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:astronomy/core/exception/apod_repository.exception.dart';
import 'package:astronomy/core/exception/failure.exception.dart';
import 'package:astronomy/domain/entities/media.dart';
import 'package:astronomy/domain/usecases/grid/c_grid_usecase.dart';

import '../../../mocks/mocktail_class.dart';

void main() {
  final apodRepository = FakeApodRepository();
  final usecase = CGridUseCase(apodRepository);

  test('Should request a list of media to APOD Repository and return Right', () async {
    final List<Media> fakeList = [];

    when(() => apodRepository.getMediaList()).thenAnswer(
      (_) async => Right(fakeList),
    );

    final response = await usecase.getMediaList();

    expect(response.isRight(), true);
    expect(response.fold(id, id), isA<List<Media>>());
  });

  test('Should request a list of media to APOD Repository and return Left', () async {
    when(() => apodRepository.getMediaList()).thenAnswer(
      (_) async => Left(ApodRepositoryException(message: 'An error occurred while requesting media!')),
    );

    final response = await usecase.getMediaList();

    expect(response.isLeft(), true);
    expect(response.fold(id, id), isA<Failure>());
  });
}