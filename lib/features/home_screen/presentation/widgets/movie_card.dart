import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/core/models/movie.dart';
import 'package:movie_line/utils/constants.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie? movie;

  const MovieCardWidget({
    @required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('${movie!.imageUrl}'), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(120, 16, 15, 0),
              padding: const EdgeInsets.fromLTRB(8, 6, 10, 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1,
                      color: const Color.fromRGBO(255, 255, 255, 0.25)),
                  color: const Color.fromRGBO(218, 218, 218, 0.3)),
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
                        '${movie!.rating}',
                        style: headingStyle.copyWith(
                            fontSize: ScreenUtil().setSp(16),
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      )
                    ],
                  )
                ],
              )),
          Spacer(),
          Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
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
                    '${movie!.movieName}',
                    style: headingStyle.copyWith(
                        fontSize: ScreenUtil().setSp(16),
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ))),
                ],
              ))
        ],
      ));

  // Widget buildGenre({@required Movie movie}) => Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: movie.genres
  //           .map((genre) => Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 5),
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.grey[600]),
  //                       borderRadius: BorderRadius.circular(15)),
  //                   padding: EdgeInsets.all(5),
  //                   child: Text(
  //                     genre,
  //                     style: TextStyle(color: Colors.grey[600], fontSize: 12),
  //                   ),
  //                 ),
  //               ))
  //           .toList(),
  //     );

  // Widget buildRating({@required Movie movie}) => Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(movie.rating.toStringAsFixed(1)),
  //         SizedBox(width: 10),
  //         ...List.generate(
  //           movie.stars,
  //           (index) => Icon(Icons.star_rate, size: 18, color: Colors.orange),
  //         ),
  //       ],
  //     );
}
