import 'dart:developer';

import 'package:fluroDemo/model/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_bundle.dart';
import 'package:provider/provider.dart';

import '../../model/app_recipe_model.dart';

///
/// @date: 2022/4/8 15:34
/// @author: TangRen
/// @remark:
///
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    RecipeModel? recipeModel;
    if (arguments != null && arguments is Bundle) {
      recipeModel = arguments.get<RecipeModel>('detail');
      log('${DateTime.now()} build>>(DetailScreen:22)>>${recipeModel.hashCode}');
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(recipeModel?.title ?? 'Detail'),
          backgroundColor: recipeModel?.color),
      body: _item(
          context,
          recipeModel ??
              RecipeModel(recipeId: -1, color: Colors.red, title: 'error')),
    );
  }

  _item(BuildContext context, RecipeModel model) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 300.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: model.color),
          child: Stack(children: [
            Positioned.fill(
              child: Center(
                  child: Text('${model.title}-${DateTime.now().second}')),
            ),
            Positioned(
                child: Consumer(
                  builder: (BuildContext context, AppRecipeModel appRecipeModel,
                          Widget? child) =>
                      IconButton(
                    icon: Icon(Icons.favorite,
                        color: model.favourite ? Colors.red : Colors.white),
                    onPressed: () {
                      model.favourite = !model.favourite;
                      context.read<AppRecipeModel>().toggle(model);
                    },
                  ),
                ),
                right: 10.0,
                top: 10.0)
          ]),
        ),
      ),
    );
  }
}
