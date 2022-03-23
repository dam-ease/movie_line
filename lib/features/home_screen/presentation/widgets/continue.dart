import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/providers/trending.dart';
import 'package:movie_line/utils/constants.dart';

class Continue extends StatefulWidget {
  final List<Movies> movies;
  const Continue({Key? key, required this.movies}) : super(key: key);

  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    print(widget.movies.first.toJson());
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: widget.movies.last.backdropPath != null
                ? 'https://image.tmdb.org/t/p/original/${widget.movies.last.backdropPath}'
                : 'https://image.tmdb.org/t/p/original/${widget.movies.last.posterPath}',
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Image(image: imageProvider, fit: BoxFit.cover)),
            ),
            placeholder: (context, url) =>
                const Center(child: CupertinoActivityIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Positioned(
            bottom: 10.0,
            right: ScreenUtil().setWidth(90),
            left: 10.0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 11, 14, 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(255, 255, 255, 0.25)),
                  color: const Color.fromRGBO(218, 218, 218, 0.3)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(play),
                    height: 35,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Continue Watching',
                        style: headingStyle.copyWith(
                            fontSize: ScreenUtil().setSp(12),
                            color: const Color.fromRGBO(188, 188, 188, 1)),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text(
                        'Ready Player one',
                        style: headingStyle.copyWith(
                            fontSize: ScreenUtil().setSp(16),
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
