import 'package:fluroDemo/model/recipe_model.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/4/8 21:28
/// @author: TangRen
/// @remark:
///
class AppRecipeModel extends ChangeNotifier {
  final List<RecipeModel> _indexRecipeModelList = [];

  List<RecipeModel> get indexRecipeModelList => _indexRecipeModelList;

  final List<RecipeModel> _exploreRecipeModelList = [];

  List<RecipeModel> get exploreRecipeModelList => _exploreRecipeModelList;

  toggle(RecipeModel recipeModel) {
    for (var model in _indexRecipeModelList) {
      if (model.recipeId == recipeModel.recipeId) {
        model.favourite = recipeModel.favourite;
      }
    }

    for (var model in _exploreRecipeModelList) {
      if (model.recipeId == recipeModel.recipeId) {
        model.favourite = recipeModel.favourite;
      }
    }
    notifyListeners();
  }
}
