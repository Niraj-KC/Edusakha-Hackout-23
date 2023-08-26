import 'package:flutter/material.dart';

hexStringToColors(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}


class AppColors {
  static Map theme = themes["Theme1"];

  static Map themes = {
    "Theme1": {
      "bg": hexStringToColors("#33363F"),
      "white" : hexStringToColors("#FFFFFF"),
      "loginc" : hexStringToColors("#D9D9D9") ,
      "logincot" : hexStringToColors("#474A52"),



    },
  };


}