import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/constants/app_constants.dart';
import 'package:tmdb_app/models/movie.dart';
import 'package:tmdb_app/utils/app_utils.dart';
import 'package:tmdb_app/widgets/rating_chip.dart';

class MoviePage extends StatelessWidget {
  final Movie? movie;
  const MoviePage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.colors.primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(
                  color: AppConstants.colors.secondaryColor,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppConstants.colors.secondaryColor.withOpacity(0.15),
                    blurRadius: 10,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: "${AppUtils.imageUrl}${movie?.backdropPath!}",
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, progress) {
                      return LinearProgressIndicator(
                        value: progress.progress,
                        color: AppConstants.colors.secondaryColor,
                        backgroundColor:
                            AppConstants.colors.secondaryColor.withOpacity(0.3),
                      );
                    },
                  ),
                  BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CachedNetworkImage(
                        fit: BoxFit.fitHeight,
                        imageUrl: "${AppUtils.imageUrl}${movie?.posterPath!}",
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        progressIndicatorBuilder: (context, url, progress) {
                          return LinearProgressIndicator(
                            value: progress.progress,
                            color: AppConstants.colors.secondaryColor,
                            backgroundColor: AppConstants.colors.secondaryColor
                                .withOpacity(0.3),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppConstants.colors.primaryColor,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: AppConstants.colors.secondaryColor
                                      .withOpacity(0.1),
                                  blurRadius: 10,
                                )
                              ]),
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.keyboard_arrow_left_sharp,
                            color: AppConstants.colors.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              alignment: Alignment.center,
              child: Container(
                height: 3,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: AppConstants.colors.secondaryColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.movie_sharp,
                    size: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      movie!.title!,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      maxLines: 5,
                      style: TextStyle(
                        color: AppConstants.colors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  RatingChip(
                    movie: movie,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Text(
                movie!.overview!,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppConstants.colors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
