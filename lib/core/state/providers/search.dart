import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/repositories/search_repo.dart';

final searchNotifierProvider = StateNotifierProvider<SearchRepo, SearchState>(
    (ref) => SearchRepo(ref.read));

final searchProvider = StateProvider<List<Result>>((ref) {
  final repo = ref.watch(searchNotifierProvider);
  return repo.result;
});
final searchLoadingProvider = StateProvider<bool>((ref) {
  final repo = ref.watch(searchNotifierProvider);
  return repo.loading;
});
