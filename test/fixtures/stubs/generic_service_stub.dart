import 'package:chopper/chopper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

void setUpServiceResponseOf<T>(
  Future<Response<T>> Function() stubFn, {
  required T body,
  required int statusCode,
}) {
  when(stubFn).thenAnswer(
    (_) async {
      return Response(
        http.Response(body.toString(), statusCode),
        body,
      );
    },
  );
}

void setUpServiceExceptionResponse<T>(Future<Response<T>> Function() stubFn) {
  when(stubFn).thenThrow((_) => Exception('Could not complete your request.'));
}
