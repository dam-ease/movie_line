import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/features/discover_screen/widgets/movies.dart';
import 'package:movie_line/utils/constants.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final Movies movie;
  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String releaseDate =
        DateFormat.yMMMMd().format(movie.releaseDate!.toLocal());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.only(top: 38),
            width: ScreenUtil().screenWidth,
            height: 287,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(movie.backdropPath != null
                    ? 'https://image.tmdb.org/t/p/original/${movie.backdropPath}'
                    : 'https://image.tmdb.org/t/p/original/${movie.posterPath}'),
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${movie.title}',
                        style: headingStyle.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white24, width: 3)),
                      padding: EdgeInsets.fromLTRB(7, 3, 6, 6),
                      child: Text(
                        '4K',
                        style: headingStyle.copyWith(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '152 minutes',
                      style: headingStyle.copyWith(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '${movie.voteAverage} (IMDb)',
                      style: headingStyle.copyWith(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Divider(
                    thickness: 0.2,
                    color: Color(0xFF515151),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Release date',
                          style: headingStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(16),
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          releaseDate,
                          style: headingStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenUtil().setSp(12),
                              color: Color(0xFFBCBCBC)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 47,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Genre',
                          style: headingStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(16),
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            genre('Action'),
                            SizedBox(
                              width: 12,
                            ),
                            genre('Sci-Fi')
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Divider(
                    thickness: 0.2,
                    color: Color(0xFF515151),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Synopsis',
                  style: headingStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(16),
                      color: Colors.white),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Text(
                      movie.overview.toString(),
                      style: headingStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(14),
                        color: Color(0xFFBCBCBC),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Related Movies',
                  style: headingStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(16),
                      color: Colors.white),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 146,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return related(title[index], data[index]);
                    },
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget genre(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
            border: Border.all(width: 2, color: Colors.white24)),
        child: Text(
          text,
          style: headingStyle.copyWith(
            fontSize: ScreenUtil().setSp(12),
            color: Color(0xFFBCBCBC),
          ),
        ));
  }

  Widget related(String title, String image) {
    return Container(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 106,
            width: 142,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: Text(
              title,
              style: headingStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(12),
                color: Color(0xFFBCBCBC),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
