import 'package:flutter/material.dart';

import 'package:tmdb_app/constants/app_constants.dart';
import 'package:tmdb_app/models/movie.dart';

// ignore: must_be_immutable
class RatingChip extends StatelessWidget {
  Movie? movie;
  RatingChip({
    Key? key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppConstants.colors.ratingChipColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppConstants.colors.secondaryColor.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star_outline_sharp,
            color: AppConstants.colors.textColor,
            size: 14,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "${movie?.voteAverage!}",
            style: TextStyle(
              color: AppConstants.colors.textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
