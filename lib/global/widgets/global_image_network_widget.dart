import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

String _normalizeImageUrl(String? url) {
    if (url == null || url.isEmpty) {
      return 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';
    }

    return url;
  }

class GlobalImageNetworkWidget extends StatelessWidget {
  const GlobalImageNetworkWidget(
    this.url, {
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    super.key,
  });

  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: _normalizeImageUrl(url),
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}
