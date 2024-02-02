import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_map/flutter_map.dart';

class CachedNetworkTileProvider extends NetworkTileProvider {
  final BaseCacheManager _baseCacheManager;

  CachedNetworkTileProvider({BaseCacheManager? baseCacheManager})
      : _baseCacheManager = baseCacheManager ?? DefaultCacheManager();

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    final url = getTileUrl(coordinates, options);

    return CachedNetworkImageProvider(url, cacheManager: _baseCacheManager);
  }
}