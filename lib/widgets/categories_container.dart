import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genresList = Provider.of<MoviesProvider>(context).genresList;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.8,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: genresList.length,
          itemBuilder: (BuildContext context, int index) {
            final genre = genresList[index];
            Provider.of<MoviesProvider>(context).getMoviesByGenre(genre.id);
            final movies =
                Provider.of<MoviesProvider>(context).genreMovies[genre.id] ??
                    [];
            return MovieSlider(
                movies: movies, title: genre.name, onNextPage: () => {});
          },
        ),
      ),
    );
  }
}
