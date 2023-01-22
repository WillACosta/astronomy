import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/core.dart';

AsyncEither<T> safeApiCall<T>(
  Future<Response<T>> Function() callback,
) async {
  try {
    final response = await callback.call();
    return option(
      response,
      (_) => response.isSuccessful,
    ).match(
      () => const Left(Failure.unexpected()),
      (data) => Right(data.body as T),
    );
  } catch (e) {
    return const Left(Failure.unexpected());
  }
}
