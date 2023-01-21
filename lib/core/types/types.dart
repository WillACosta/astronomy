import 'package:fpdart/fpdart.dart';

import 'package:astronomy/core/failures/failure.exception.dart';
import 'package:astronomy/domain/models/media.dart';

typedef MediaOfTheDayType = Future<Either<Failure, Media>>;
typedef ListOfMediaType = Future<Either<Failure, List<Media>>>;

typedef DownloadServiceType = Future<Either<Failure, dynamic>>;

typedef ToggleFavoriteType = Future<void>;
typedef RemoveFavoriteType = Future<void>;

typedef AsyncEither<T> = Future<Either<Failure, T>>;
