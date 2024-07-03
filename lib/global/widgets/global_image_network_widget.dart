import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

String _normalizeImageUrl(String? url) {
  if (url == null || url.isEmpty) {
    return 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png';
  }

  return url;
}

class GlobalImageNetworkWidget extends StatefulWidget {
  const GlobalImageNetworkWidget(
    this.url, {
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
    this.isTapping = false,
    super.key,
  });

  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final bool isTapping;

  @override
  State<GlobalImageNetworkWidget> createState() =>
      _GlobalImageNetworkWidgetState();
}

class _GlobalImageNetworkWidgetState extends State<GlobalImageNetworkWidget> {
  late BoxFit localFit;

  @override
  void initState() {
    localFit = widget.fit ?? BoxFit.cover;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isTapping
          ? () {
              setState(() {
                if (localFit == BoxFit.cover) {
                  localFit = BoxFit.fitHeight;
                } else {
                  localFit = BoxFit.cover;
                }
              });
            }
          : null,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: _normalizeImageUrl(widget.url),
          width: widget.width,
          height: widget.height,
          fit: localFit,
        ),
      ),
    );
  }
}
