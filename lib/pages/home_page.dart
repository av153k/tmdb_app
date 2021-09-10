import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_app/constants/app_constants.dart';
import 'package:tmdb_app/models/movie.dart';
import 'package:tmdb_app/pages/movie_page.dart';
import 'package:tmdb_app/providers/home_provider.dart';
import 'package:tmdb_app/providers/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/utils/app_utils.dart';
import 'package:tmdb_app/widgets/rating_chip.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Movies Database",
          style: TextStyle(
            color: AppConstants.colors.secondaryColor,
          ),
        ),
        backgroundColor: AppConstants.colors.primaryColor,
        centerTitle: false,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(5),
            onPressed: () {},
            icon: Icon(
              Icons.search_sharp,
              color: AppConstants.colors.secondaryColor,
            ),
          ),
          Consumer(
            builder: (context, watch, child) {
              final _layout = watch(homeProvider);
              return IconButton(
                padding: const EdgeInsets.all(5),
                onPressed: () {
                  context.read(homeProvider).changeLayout();
                },
                icon: Icon(
                  !_layout.isGridView ? Icons.grid_on_sharp : Icons.list_sharp,
                  color: AppConstants.colors.secondaryColor,
                ),
              );
            },
          )
        ],
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final _movies = watch(movieProvider);
          final _layout = watch(homeProvider);
          if (_movies == null) {
            return CircularProgressIndicator(
              color: AppConstants.colors.secondaryColor,
            );
          } else if (_movies.length == 0) {
            return Center(
              child: Text("No movies to show"),
            );
          }
          return _layout.isGridView
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.58,
                  ),
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    Movie _movie = _movies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviePage(movie: _movie),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppConstants.colors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: AppConstants.colors.secondaryColor
                                  .withOpacity(0.05),
                              blurRadius: 6,
                              offset: Offset(6, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 8,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${AppUtils.imageUrl}${_movie.posterPath!}",
                                      progressIndicatorBuilder:
                                          (context, url, progress) {
                                        return LinearProgressIndicator(
                                          value: progress.progress,
                                          color: AppConstants
                                              .colors.secondaryColor,
                                          backgroundColor: AppConstants
                                              .colors.secondaryColor
                                              .withOpacity(0.3),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 6,
                                      child: Text(
                                        _movie.title!,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: AppConstants.colors.textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 4,
                                      child: RatingChip(
                                        movie: _movie,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    Movie _movie = _movies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviePage(movie: _movie),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                          color: AppConstants.colors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: AppConstants.colors.secondaryColor
                                  .withOpacity(0.05),
                              blurRadius: 6,
                              offset: Offset(6, 6),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 70,
                              margin: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppUtils.imageUrl}${_movie.posterPath!}",
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return LinearProgressIndicator(
                                      value: progress.progress,
                                      color: AppConstants.colors.secondaryColor,
                                      backgroundColor: AppConstants
                                          .colors.secondaryColor
                                          .withOpacity(0.3),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    flex: 6,
                                    child: Text(
                                      _movie.title!,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: AppConstants.colors.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 4,
                                    child: RatingChip(
                                      movie: _movie,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
