import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/core/models/movie.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/utils/constants.dart';

class MovieCardWidget extends StatelessWidget {
  final Movies? movie;

  const MovieCardWidget({
    @required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {},
      child: Stack(children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: movie!.backdropPath != null
              ? 'https://image.tmdb.org/t/p/original/${movie!.backdropPath}'
              : 'https://image.tmdb.org/t/p/original/${movie!.posterPath}',
          imageBuilder: (context, imageProvider) => Container(
            margin: const EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CupertinoActivityIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Positioned(
          left: 120,
          top: 36,
          right: 15,
          child: Container(
              padding: const EdgeInsets.fromLTRB(8, 6, 10, 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(255, 255, 255, 0.25)),
                color: const Color.fromRGBO(218, 218, 218, 0.3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'IMDb',
                    style: headingStyle.copyWith(
                        fontSize: ScreenUtil().setSp(8),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 24,
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(5),
                      ),
                      Text(
                        '${movie!.voteAverage}',
                        style: headingStyle.copyWith(
                            fontSize: ScreenUtil().setSp(16),
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      )
                    ],
                  )
                ],
              )),
        ),
        Positioned(
            bottom: 15.0,
            right: 15.0,
            left: 15.0,
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(255, 255, 255, 0.25)),
                    color: const Color.fromRGBO(218, 218, 218, 0.3)),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                      movie!.title != null
                          ? '${movie!.title}'
                          : movie!.originalTitle != null
                              ? '${movie!.originalTitle}'
                              : '${movie!.originalName}',
                      style: headingStyle.copyWith(
                          fontSize: ScreenUtil().setSp(16),
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ))),
                  ],
                )))
      ]));
}
