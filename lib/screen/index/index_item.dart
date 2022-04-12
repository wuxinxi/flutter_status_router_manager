import 'dart:developer';

import 'package:fluroDemo/model/app_recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_bundle.dart';
import 'package:lib_router/app_router.dart';
import 'package:provider/provider.dart';

import '../../model/recipe_model.dart';
import '../../router/config/app_page_path.dart';

///
/// @date: 2022/4/8 18:24
/// @author: TangRen
/// @remark:
///

class IndexItem extends StatefulWidget {
  final int index;
  final RecipeModel recipeModel;

  const IndexItem({Key? key, required this.index, required this.recipeModel})
      : super(key: key);

  @override
  _RecipeItemState createState() => _RecipeItemState();
}

class _RecipeItemState extends State<IndexItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _item(widget.index, widget.recipeModel);
  }

  _item(int index, RecipeModel model) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          log('${DateTime.now()} _item>>(_RecipeItemState:48)>>${model.hashCode}');
          AppRouter.navigateTo(context, AppPagePath.detail,
              bundle: Bundle()..put('detail', model));
        },
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
                child: Selector<AppRecipeModel, bool>(
                  builder: (BuildContext context, favourite, Widget? child) =>
                      IconButton(
                    icon: Icon(Icons.favorite,
                        color: favourite ? Colors.red : Colors.white),
                    onPressed: () {
                      model.favourite = !favourite;
                      context.read<AppRecipeModel>().toggle(model);
                    },
                  ),
                  selector: (context, AppRecipeModel appRecipeModel) =>
                      appRecipeModel.indexRecipeModelList[index]
                          .favourite, //当favourite发生改变的时候会rebuild Selector的builder函数
                ),
                right: 10.0,
                top: 10.0)
          ]),
        ),
      ),
    );
  }
}
