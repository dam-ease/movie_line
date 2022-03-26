import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_line/core/state/providers/search.dart';
import 'package:movie_line/utils/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, watch, _) {
      final searchResult = watch(searchProvider.notifier);
      final loading = watch(searchLoadingProvider.notifier);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 15, 68, 5),
            child: Text(
              'Search Result',
              style: headingStyle.copyWith(
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ],
      );
    });
  }
}
