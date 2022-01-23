import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/category_provider.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class CategoryList extends StatefulWidget {
  final int selected;
  bool? _isLoading;
  final Function callback;
  CategoryList(this._isLoading , {required this.selected , required this.callback});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
    )
    : Consumer<CategoryProvider>(
        builder : (context,categoryData,_) => SizedBox(
          height: 40,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index) => GestureDetector(
                onTap: () {
                    widget.callback(index,categoryData.category[index].idCategory);
                    print("Category DAY : " + categoryData.category[index].idCategory.toString());
                  },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  decoration: BoxDecoration(
                      color: widget.selected == index ? primaryColor : greyLighter,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(categoryData.category[index].nameCategory.toString(),style: TextStyle(
                      color: widget.selected == index ? white : greyPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamily.SourceSansPro
                  )
                  ),
                ),
              ),
              separatorBuilder: (_,index)=> const SizedBox(width: 15),
              itemCount: categoryData.category.length
          ),
        )
    );
  }
}
