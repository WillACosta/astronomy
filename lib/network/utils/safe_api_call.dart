import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';

import 'package:astronomy/core/failures/service_failure.dart';
import 'package:astronomy/core/types/types.dart';

AsyncEither<T> safeApiCall<T>(
  Future<Response<T>> Function() callback,
) async {
  try {
    final response = await callback.call();
    return option(
      response,
      (_) => response.isSuccessful,
    ).match(
      () => const Left(ServiceFailure()),
      (data) => Right(data.body as T),
    );
  } catch (e) {
    return const Left(ServiceFailure());
  }
}
