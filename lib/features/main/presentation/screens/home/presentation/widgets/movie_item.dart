import 'package:flutter/material.dart';
import 'package:mobile/app/app_config.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/movie_response.dart';

class MovieItem extends StatelessWidget {
   const MovieItem(this.movie, {super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image:NetworkImage(AppConfig.imagePath+ movie.backdrop_path),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(
                left: Dimensions.padding_20,
                bottom: Dimensions.padding_20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [
                    0.1,
                    0.3,
                  ],
                  colors: [
                    AppColors.blackColor.withOpacity(0.4),
                    Colors.transparent,
                  ],
                )),
            child: Text(movie.original_title,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorWhite,
                  fontSize: 18,
                )),
          ),
        ],
      ),
    );
  }
}
