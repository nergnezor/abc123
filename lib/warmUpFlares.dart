import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/services.dart';

final assetProvider =
    AssetFlare(bundle: rootBundle, name: 'assets/animations/loop.flr');
Future<void> warmupFlare() async {
  await cachedActor(assetProvider);
}
