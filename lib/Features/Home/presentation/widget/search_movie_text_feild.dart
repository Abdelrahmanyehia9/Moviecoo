import 'package:flutter/material.dart';

class SearchMovieTextField extends StatelessWidget {
  const SearchMovieTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16) ,
          color: Colors.white.withOpacity(0.08) ,

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextFormField(
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 4),
              icon:  Icon(Icons.search , color: Colors.white,),
              hintText: 'Search Movie or Actor ' ,
              hintStyle: TextStyle( fontSize: 14),

              border: InputBorder.none ,
            ),
          ),
        ),
      ),
    );
  }
}
