import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/utils/constants.dart';
import 'package:movie_line/utils/movie_data.dart';
import 'package:movie_line/utils/page_router.dart';
import 'package:movie_line/utils/route_name.dart';

class ScreenList extends StatefulWidget {
  final List<Result> screen;
  const ScreenList({Key? key, required this.screen}) : super(key: key);

  @override
  State<ScreenList> createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 10, top: 10, right: 15),
      child: StaggeredGridView.countBuilder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            final movie = widget.screen[index];
            final images = movie.backdropPath != null
                ? 'https://image.tmdb.org/t/p/original/${movie.backdropPath}'
                : 'https://image.tmdb.org/t/p/original/${movie.posterPath}';
            ;
            return GestureDetector(
              onTap: () => PageRouter.gotoNamed(RouteName.detail, context,
                  args: widget.screen[index]),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: images,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider, fit: BoxFit.cover),
                            placeholder: (context, url) => const Center(
                                child: CupertinoActivityIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            movie.title != null
                                ? movie.title.toString()
                                : movie.name.toString(),
                            style: headingStyle.copyWith(
                                fontSize: ScreenUtil().setSp(16),
                                color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(1, index.isEven ? 1.3 : 1)),
    );
  }
}
