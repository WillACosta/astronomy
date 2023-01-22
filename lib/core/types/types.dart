import 'package:fpdart/fpdart.dart';

import '../../domain/models/media.dart';
import '../core.dart';

typedef MediaOfTheDayType = Future<Either<Failure, Media>>;
typedef ListOfMediaType = Future<Either<Failure, List<Media>>>;

typedef DownloadServiceType = Future<Either<Failure, dynamic>>;

typedef ToggleFavoriteType = Future<void>;
typedef RemoveFavoriteType = Future<void>;

typedef AsyncEither<T> = Future<Either<Failure, T>>;
