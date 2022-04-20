import 'package:fluroDemo/screen/explore/explore_io.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/app_recipe_model.dart';
import 'explore_item.dart';

///
/// @date: 2022/4/8 15:28
/// @author: TangRen
/// @remark:
///
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // context.read<AppRecipeModel>().exploreRecipeModelList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ExploreIo().getIndexList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> response) {
            if (response.hasData) {
              context.read<AppRecipeModel>().exploreRecipeModelList
                ..clear()
                ..addAll(response.data);
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => ExploreItem(
                    index: index, recipeModel: response.data[index]),
                itemCount: response.data.length,
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
