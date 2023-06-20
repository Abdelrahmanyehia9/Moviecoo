import 'package:flutter/material.dart';

import 'category_movie.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({Key? key}) : super(key: key);

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  final List<bool>_selected = [false , false , false , false , false ] ;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(

      fillColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      renderBorder: false,
      selectedBorderColor: Colors.white,
      selectedColor: const Color(0xffEC255A),
      isSelected: _selected ,
      onPressed: (index){
        setState(() {
          for(int i = 0 ; i < _selected.length ; i++ ){
            if(i == index){
              _selected[i] = true ;

            }else {
              _selected[i] = false ;

            }
          }

        });
      },children: [
      nonActiveButton('romance'),
      nonActiveButton('war'),
      nonActiveButton('action'),
      nonActiveButton('comedy'),
      nonActiveButton('adults')    ],);
  }}
