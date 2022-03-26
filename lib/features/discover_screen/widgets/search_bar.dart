import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_line/core/state/providers/search.dart';
import 'package:movie_line/utils/route_name.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController? searchController;
  SearchBar({this.searchController});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, watch, _) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(33, 31, 48, 1))),
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: TextFormField(
            key: _formKey,
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (value) {
              print(widget.searchController?.text);
            },
            controller: widget.searchController,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color.fromRGBO(187, 187, 187, 1)),
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color.fromRGBO(187, 187, 187, 1)),
                hintText: 'Sherlock Holmes'),
          ),
        );
      },
    );
  }

  search(value) async {
    print('${widget.searchController?.text}');
    handleSearch;
  }

  handleSearch() async {
    final value = widget.searchController?.text ?? '';
    print(value);
    if (value.isEmpty) {
      return;
    }

    await context.read(searchNotifierProvider.notifier).search(value);
    // handleSearch();
    print("here");
    final result =
        await Navigator.of(context).pushNamed(RouteName.searchScreen);
    final word = result as String?;
    if (word != null) {
      widget.searchController?.text = word;
    }
  }
}
