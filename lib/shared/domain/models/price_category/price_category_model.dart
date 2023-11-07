import 'package:equatable/equatable.dart';

class PriceCategoryModel extends Equatable{

  final int id;
  final String text;
  final int value;
  final bool isSelected;

  const PriceCategoryModel({this.id=0, this.text='', this.value=0, this.isSelected=false});

  @override
  List<Object?> get props => [id, text,value,isSelected];

  PriceCategoryModel copyWith({
     int? id,
     String? text,
     int? value,
     bool? isSelected
}){
    return PriceCategoryModel(id:id??this.id,
        text:text??this.text,
        value:value??this.value,
        isSelected:isSelected??this.isSelected);
}
}