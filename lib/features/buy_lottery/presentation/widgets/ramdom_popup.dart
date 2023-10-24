
import 'package:flutter/material.dart';

void randomPopup(BuildContext context, Widget child){
  showModalBottomSheet<void>(context: context, builder: (BuildContext context){
    return child;
  });
}