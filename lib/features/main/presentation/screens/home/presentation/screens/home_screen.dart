import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/common/widgets/custom_network_image.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/core/resources/drawables.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/breed_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/random_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/home_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/home_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/Image_loading_widget.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 137,
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  child: Image(image: AssetImage(Drawables.backImage)),
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.padding_16, vertical: Dimensions.padding_16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                            onPressed: () {

                              context.read<HomeScreenCubit>().getRandomImageByBreed();
                            },
                            child: Text("Random image by breed")),
                        Expanded(
                            child: BlocBuilder<HomeScreenCubit,
                                    HomeScreenStates>(
                                builder: (context, state) => state.maybeWhen(
                                  initial: () => Container(),
                                    loading: () => const ImageLoadingWidget(),
                                    onError: (error) =>
                                        Center(child: Text(error.toString())),
                                    onRandomBreed: (RandomResponse randomBreed) => _showRandomImage(randomBreed),
                                    onBreedList: (BreedResponse breedList)=> _showBreedList(breedList),
                                    orElse: () => const Placeholder())))
                      ],
                    ),
                  ),
                ))
              ],
            ),
            Positioned(
              top: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding_16),
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Dogs Collection",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    // SizedBox(width: ,),
                  ],
                ),
              ),
            ),
          ],
        ));






  }

  Widget _showRandomImage(RandomResponse randomBreed ){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CustomNetworkImage(
              width: 200,
              height: 200,
              imageUrl: randomBreed.message,
              fit: BoxFit.cover
          ),
        ),
        SizedBox(height: 20,),
        RichText(
          text: TextSpan(
            text: 'Breed Type is : ',
            style: DefaultTextStyle.of(context).style,
            children:  <TextSpan>[
              TextSpan(text: context.read<HomeScreenCubit>().breedName, style: TextStyle(fontWeight: FontWeight.bold,)),

            ],
          ),
        ),

        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          context.read<HomeScreenCubit>().getBreedList(context.read<HomeScreenCubit>().breedName);
        }, child: RichText(
          text: TextSpan(
            text: 'Get List of  ',
            children:  <TextSpan>[
              TextSpan(text: context.read<HomeScreenCubit>().breedName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              TextSpan(text: " type breed", style: TextStyle(color: Colors.white))

            ],
          ),
        ),)
      ],

    );
  }
  Widget _showBreedList(BreedResponse breedResponse ){
    return ListView.separated(
      itemCount: breedResponse.message.length,
      separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CustomNetworkImage(
              width: 200,
              height: 200,
              imageUrl: breedResponse.message[index],
              fit: BoxFit.cover
          ),
        );
      },
    );




  }
}
