import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCached extends StatelessWidget {

  ImageCached({Key? key, required this.image}):super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: "http://10.0.2.2:3001/fetchimg/${image}",
        placeholder: (context, url) => new Container(color:Colors.grey[200]),
        errorWidget: (context, url, error) => Container(color:Colors.grey[200]),
        fadeOutDuration: Duration(seconds:1),
        fadeInDuration: Duration(seconds:3),
        fit:BoxFit.cover,
    );
  }
}
