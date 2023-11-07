import 'package:equatable/equatable.dart';

class LotteryPanelTypeModel extends Equatable {
  final int id;
  final String name;
  final bool isSelected;
  final bool isSpecial;

  const LotteryPanelTypeModel({required this.isSpecial,required this.id,required this.name,required this.isSelected});

  @override
  List<Object?> get props => [id, name, isSelected,isSpecial];

  LotteryPanelTypeModel copyWith({int? id, String? name, bool? isSelected,bool? isSpecial}) {
    return LotteryPanelTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        isSelected: isSelected ?? this.isSelected,
        isSpecial:isSpecial ?? this.isSpecial
    );
  }
}
