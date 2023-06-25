import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:moviecoo/core/utils/dim.dart';

import '../../data/model/result.dart';
import '../manger/home_cubit.dart';
import '../manger/home_states.dart';
import '../view/streaminvy_review.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Popular' ,
          style: GoogleFonts.oswald(fontSize: 16 , fontWeight: FontWeight.normal),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: dimHeight(context)*0.22,
          child: BlocBuilder<AllMovieCubit , HomeState>(
            builder: (context , state) {
              if (state is HomeSuccess){

              return   ListView.builder(itemCount: state.model.length ,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index) => MovieImage(movieModel: state.model[index],) ) ;

              }else if (state is HomeFailure){
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
