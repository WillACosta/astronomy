import 'dart:async';

import 'package:chopper/chopper.dart';

import '../../../core/core.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;
  const JsonSerializableConverter(this.factories);

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    final Response dynamicResponse = await super.convertResponse(response);

    final BodyType customBody = _decodeBodyToCustomObject<InnerType>(
      dynamicResponse.body,
    );

    return dynamicResponse.copyWith(body: customBody);
  }

  dynamic _decodeBodyToCustomObject<InnerType>(dynamic element) {
    return _deserializeSingleType<InnerType>(element);
  }

  InnerType _deserializeSingleType<InnerType>(dynamic element) {
    return _decodeMapFromValueOf<InnerType>(element);
  }

  InnerType _decodeMapFromValueOf<InnerType>(dynamic values) {
    if (values is InnerType) return values;

    final jsonFactory = factories[InnerType];

    if (jsonFactory == null || jsonFactory is! JsonFactory<InnerType>) {
      throw JsonDecodeException(
        'Factory Converter not found for given type: $InnerType',
      );
    }

    if (values is List) {
      return values.map((e) => factories[e]).toList() as InnerType;
    }

    return jsonFactory(values);
  }
}
