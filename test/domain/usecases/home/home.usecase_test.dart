import 'package:astronomy/core/exception/apod_repository.exception.dart';
import 'package:astronomy/core/exception/failure.exception.dart';
import 'package:astronomy/domain/entities/media.dart';
import 'package:astronomy/domain/usecases/home/home_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocktail_class.dart';

void main() {
  final apodRepository = FakeApodRepository();
  final usecase = HomeUseCase(apodRepository);

  test('Should request a media of the day to APOD Repository and return Right', () async {
    final fakeMedia = Media(
      copyright: 'Copyright',
      date: DateTime(12222),
      explanation: 'explanation',
      hdurl: 'http://',
      mediaType: 'image/jpeg',
      title: 'Title',
      url: 'http://',
    );

    when(() => apodRepository.getMediaOfTheDay()).thenAnswer(
      (_) async => Right(fakeMedia),
    );

    final response = await usecase.getMediaOfTheDay();

    expect(response.isRight(), true);
    expect(response.fold(id, id), isA<Media>());
  });

  test('Should request a media of the day to APOD Repository and return Left', () async {
    when(() => apodRepository.getMediaOfTheDay()).thenAnswer(
      (_) async => Left(ApodRepositoryException(message: 'An error occurred while requesting media!')),
    );

    final response = await usecase.getMediaOfTheDay();

    expect(response.isLeft(), true);
    expect(response.fold(id, id), isA<Failure>());
  });
}
