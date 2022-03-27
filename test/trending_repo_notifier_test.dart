import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_line/core/models/result_model.dart';
import 'package:movie_line/core/state/repositories/movies/trending_repo.dart';

class MockTrendingService extends Mock implements TrendingRepo {}

void main() {
  late TrendingRepo sut;
  late MockTrendingService mockTrendingService;
  setUp(() {
    mockTrendingService = MockTrendingService();
    sut = TrendingRepo();
  });

  test("initial values are correct", () {
    expect(sut.client, isA<Dio>());
  });

  group('getTrendingMovies', () {
    test('gets Trending Movies', () async {
      when(() => mockTrendingService.getTrendingMovies())
          .thenAnswer((invocation) async => []);
      await sut.getTrendingMovies();
      // verify(() => mockTrendingService.getTrendingMovies()).called(1);
    });
  });

  test('indicates loading of trennding data', () async {
    final future = sut.getTrendingMovies();
    expect(sut.state.loading, true);
    await future;
    expect(sut.state.movies, isA<List>());
  });
}
