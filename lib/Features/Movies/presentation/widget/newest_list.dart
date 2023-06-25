import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/dim.dart';
import '../manger/Newest_cubit.dart';
import '../manger/newest_state.dart';
import '../view/streaminvy_review.dart';

class NewestMovies extends StatelessWidget {
  const NewestMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Top Rated' ,
          style: GoogleFonts.oswald(fontSize: 16 , fontWeight: FontWeight.normal),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: dimHeight(context)*0.22,
          child: BlocBuilder<NewestMovieCubit , NewestState>(
              builder: (context , state) {
                if (state is NewestSuccess){

                  return   ListView.builder(itemCount: state.movieModel.length ,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index) => MovieImage(movieModel: state.movieModel[index],) ) ;

                }else if (state is NewestFailure){
                  return Center( child:  Text (state.errorMessage),) ;
                }else{
                  return const Center(child:  CircularProgressIndicator(),) ;
                }


              }

          ),
        ) ,
      ],
    ) ;
  }
}
