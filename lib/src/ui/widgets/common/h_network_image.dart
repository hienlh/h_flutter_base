import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/assets.dart';
import 'skeleton.dart';

class CustomNetworkImage extends StatefulWidget {
  final String? url;
  final BoxFit fit;
  final bool isAvatar;
  final BorderRadius? borderRadius;
  final bool isLoading;

  const CustomNetworkImage(
    this.url, {
    Key? key,
    this.fit = BoxFit.cover,
    this.isAvatar = false,
    this.borderRadius,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final loading = Skeleton(
        child: Container(
      color: context.colorScheme.background,
    ));
    final image = ClipRRect(
      borderRadius: widget.isAvatar && widget.borderRadius == null
          ? BorderRadius.circular(90)
          : widget.borderRadius ?? BorderRadius.circular(0),
      child: widget.isLoading
          ? loading
          : widget.url.isEmptyOrNull
              ? Image.asset(
                  widget.isAvatar
                      ? Assets.images.defaultAvatar
                      : Assets.images.defaultImage,
                  fit: widget.fit,
                )
              : CachedNetworkImage(
                  imageUrl: widget.url ?? '',
                  fit: widget.fit,
                  errorWidget: (context, url, error) {
                    if (widget.isAvatar) {
                      return Image.asset(Assets.images.defaultAvatar,
                          fit: widget.fit);
                    }
                    return Container(
                      color: context.colorScheme.surface,
                    );
                  },
                  progressIndicatorBuilder: (ctx, url, process) => loading,
                ),
    );

    return widget.url.isEmptyOrNull
        ? image
        : Hero(tag: widget.url!, child: image);
  }

  @override
  bool get wantKeepAlive => widget.url.isNotEmptyAndNotNull;
}
