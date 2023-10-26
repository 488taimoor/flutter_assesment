import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobile/core/resources/resources.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.errorWidget,
    this.fit,
  }) : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;
  final Widget? errorWidget;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      width: width,
      height: height,
      fit: fit,
      errorWidget: (context, url, error) =>
          errorWidget ??
              Icon(Icons.error_outline),
    );
  }
}
