import 'package:flutter/material.dart';

///
/// @date: 2022/4/8 18:06
/// @author: TangRen
/// @remark:
///
class RecipeModel extends ChangeNotifier {
  int recipeId;
  bool favourite = false;
  Color? color = Colors.grey.shade300;
  String? title = '';

  RecipeModel(
      {required this.recipeId, this.favourite = false, this.color, this.title});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeModel &&
          runtimeType == other.runtimeType &&
          recipeId == other.recipeId &&
          favourite == other.favourite &&
          color == other.color &&
          title == other.title;

  @override
  int get hashCode =>
      recipeId.hashCode ^ favourite.hashCode ^ color.hashCode ^ title.hashCode;

  refreshFavouriteStatus() {
    notifyListeners();
  }
}
