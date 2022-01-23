import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/category_provider.dart';
import 'package:vku_news/screens/category/widget/post_with_category.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class ListCategory extends StatefulWidget {
  bool? _isLoading;
  ListCategory(this._isLoading);

  @override
  _ListCategoryState createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    return widget._isLoading == true ?
    Center(
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        child: const CircularProgressIndicator(
          color: greyPrimary,
          strokeWidth: 1,
        ),
      ),
    ) :
    Consumer<CategoryProvider>(
        builder: (context,categoryData,_) => Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          height: (MediaQuery.of(context).size.height)/1.35,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2
              ),
              itemCount: categoryData.category.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PostWithCategory(nameCategory:categoryData.category[index].nameCategory.toString() ,categoryID: categoryData.category[index].idCategory!.toInt(),))),
                  child: Card(
                    color: greyLighter,
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.clear_all_outlined,size: 20,color: primaryColor),
                            const SizedBox(width: 10),
                            Text(categoryData.category[index].nameCategory.toString(),style: const TextStyle(
                              color: greyDarker,
                              fontSize: 20,
                              fontFamily: FontFamily.SourceSansPro,
                              fontWeight: FontWeight.w400
                            ))
                          ],
                        )
                    ),
                  ),
                );
              }
          ),
        )
    );
  }
}
