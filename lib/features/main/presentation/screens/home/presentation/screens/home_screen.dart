import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/upcoming_movies_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/home_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/home_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/Image_loading_widget.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/movie_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeScreenCubit>().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("Watch",
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.headingColor,
                  fontSize: 16,
                )),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(Dimensions.padding_20),
            child: BlocBuilder<HomeScreenCubit, HomeScreenStates>(
                builder: (context, state) => state.maybeWhen(
                    loading: () => Expanded(
                        child: const ImageLoadingWidget()),
                    onError: (error) => Center(child: Text(error!)),
                    onResponse: (UpcomingMoviesResponse upcomingMoviesResponse) =>ListView.separated(
                      itemCount: upcomingMoviesResponse.results.length,
                      itemBuilder: (context, index) {
                        return MovieItem(upcomingMoviesResponse.results[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20,);
                      },
                    ),

                    orElse: () => const SizedBox.shrink()))







          )),
    );
  }
}
