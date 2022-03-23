import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_line/utils/constants.dart';

List data = [soul, knives, onward, mulan, birds, now];
List title = [
  'Soul(2020)',
  'Knives Out (2019)',
  'Onward (2020)',
  'Mulan (2020)',
  'Birds of Prey (2020)',
  'Now You See Me 2 (2016)'
];

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

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
            final images = data[index];
            return GestureDetector(
              onTap: () {},
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
                          child: Image(
                              image: AssetImage(images), fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title[index],
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
