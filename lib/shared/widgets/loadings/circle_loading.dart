import 'package:flutter/material.dart';

Widget circleLoading({required Color color}){
  return CircularProgressIndicator(
    strokeWidth: 6,
    valueColor: AlwaysStoppedAnimation<Color>(color),
  );
}