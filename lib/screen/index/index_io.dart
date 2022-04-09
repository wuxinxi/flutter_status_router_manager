import 'package:fluroDemo/model/recipe_model.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/4/8 18:09
/// @author: TangRen
/// @remark:
///
class IndexIo {
  Future<List<RecipeModel>> getIndexList() async {
    List<RecipeModel> list = [];
    list
      ..add(RecipeModel(
          recipeId: 1, favourite: false, color: Colors.grey, title: 'A'))
      ..add(RecipeModel(
          recipeId: 2, favourite: false, color: Colors.yellow, title: 'B'))
      ..add(RecipeModel(
          recipeId: 2, favourite: false, color: Colors.yellow, title: 'B'))
      ..add(RecipeModel(
          recipeId: 3, favourite: false, color: Colors.green, title: 'C'))
      ..add(RecipeModel(
          recipeId: 4, favourite: false, color: Colors.redAccent, title: 'D'))
      ..add(RecipeModel(
          recipeId: 5, favourite: false, color: Colors.blueGrey, title: 'E'))
      ..add(RecipeModel(
          recipeId: 6, favourite: false, color: Colors.grey, title: 'F'))
      ..add(RecipeModel(
          recipeId: 2, favourite: false, color: Colors.yellow, title: 'B'))
      ..add(RecipeModel(
          recipeId: 7, favourite: false, color: Colors.blue, title: 'G'))
      ..add(RecipeModel(
          recipeId: 8, favourite: false, color: Colors.pink, title: 'H'))
      ..add(RecipeModel(
          recipeId: 9, favourite: false, color: Colors.blueGrey, title: 'I'))
      ..add(RecipeModel(
          recipeId: 10, favourite: false, color: Colors.redAccent, title: 'J'))
      ..add(RecipeModel(
          recipeId: 11, favourite: false, color: Colors.grey, title: 'K'));
    return await Future.delayed(const Duration(seconds: 1))
        .then((value) => list);
  }
}
