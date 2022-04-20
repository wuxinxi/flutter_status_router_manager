import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/app_recipe_model.dart';
import 'index_io.dart';
import 'index_item.dart';

///
/// @date: 2022/4/8 15:28
/// @author: TangRen
/// @remark:
///
class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // context.read<AppRecipeModel>().indexRecipeModelList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: IndexIo().getIndexList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> response) {
            if (response.hasData) {
              context.read<AppRecipeModel>().indexRecipeModelList
                ..clear()
                ..addAll(response.data);
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) =>
                    IndexItem(index: index, recipeModel: response.data[index]),
                itemCount: response.data.length,
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
