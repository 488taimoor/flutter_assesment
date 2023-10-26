// import 'package:collection/collection.dart';
// import 'package:dio/dio.dart';
// import '../network_keys.dart';

// class CacheInterceptor extends Interceptor {
//   CacheInterceptor({required this.cacheOptions});

//   static final Map<Uri, Response> _cache = <Uri, Response>{};

//   CacheOptions cacheOptions;

//   @override
//   Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     bool isSync = _isSyncRequired(options);
//     if (_cache.containsKey(options.uri) && !isSync) {
//       final cachedResponse = _getResponse(options.uri);
//       if (cachedResponse == null) {
//         handler.next(options);
//       } else {
//         handler.resolve(
//           cachedResponse,
//           false,
//         );
//       }
//     } else {
//       handler.next(options);
//     }
//   }

//   @override
//   onResponse(response, handler) {
//     final path = response.requestOptions.uri.pathSegments.last;
//     if (_canCache(path)) {
//       _saveResponse(response);
//     }
//     handler.next(response);
//   }

//   bool _isSyncRequired(RequestOptions options) {
//     bool isSyncRequired = options.headers.containsKey(NetworkKeys.requiresSync);
//     if (isSyncRequired) {
//       isSyncRequired = options.headers[NetworkKeys.requiresSync] as bool;
//     }
//     return isSyncRequired;
//   }

//   bool _canCache(String path) {
//     return cacheOptions.endpointsToCache
//                 .firstWhereOrNull((element) => element.pathLocation == path) ==
//             null
//         ? false
//         : true;
//   }

//   void _saveResponse(Response response) {
//     _cache[response.requestOptions.uri] = response;
//   }

//   Response? _getResponse(Uri uri) {
//     return _cache[uri];
//   }

//   static void clearCache() {
//     _cache.clear();
//   }

//   static void clearSpecificCache(Uri response) {
//     _cache.removeWhere((key, value) => key == response);
//   }
// }

// class CacheOptions {
//   List<String> endpointsToCache;
//   Duration? maxAge;

//   CacheOptions({required this.endpointsToCache, this.maxAge});
// }
