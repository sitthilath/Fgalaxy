import 'package:equatable/equatable.dart';

class NumberPanelModel extends Equatable{
   final int id;
   final String digit;
   final bool isSelected;

   const NumberPanelModel({required this.id, required this.digit, required this.isSelected});

  @override
  List<Object?> get props => [id, digit, isSelected];

   NumberPanelModel copyWith({
      int? id,
      String? digit,
      bool? isSelected
}){
     return NumberPanelModel(
       id:id ?? this.id,
       digit:digit ?? this.digit,
       isSelected:isSelected ?? this.isSelected
     );
}
}