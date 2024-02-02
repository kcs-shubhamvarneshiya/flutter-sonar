import 'package:akdmvisitorsapp/service/cached_network_tile_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('CachedNetworkTileProvider', () {
    test('getImage returns CachedNetworkImageProvider', () {
      // Arrange
      final baseCacheManager = DefaultCacheManager();
      final cachedNetworkTileProvider = CachedNetworkTileProvider(
        baseCacheManager: baseCacheManager,
      );
      const coordinates = TileCoordinates(0, 0, 0);
      final options = TileLayer();

      // Act
      final imageProvider = cachedNetworkTileProvider.getImage(coordinates, options);

      // Assert
      expect(imageProvider, isA<CachedNetworkImageProvider>());
    });
  });


}
