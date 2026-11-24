/// Asset groups supported by the app's semantic media widgets.
enum AppAssetKind { image, illustration, icon }

/// A typed asset reference. Asset paths live only in this file.
class AppAsset {
  const AppAsset._(this.path, this.kind);

  final String path;
  final AppAssetKind kind;
}

/// Central registry of packaged visual assets.
abstract final class AppAssets {
  /// The user-supplied Okhati logo. Add the file at this path when provided.
  static const AppAsset logo = AppAsset._(
    'assets/images/logo.png',
    AppAssetKind.image,
  );
}
