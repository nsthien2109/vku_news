import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/recommended_provider.dart';
import 'package:vku_news/screens/home/widget/category_list.dart';
import 'package:vku_news/screens/home/widget/home_header.dart';
import 'package:vku_news/screens/home/widget/home_slider.dart';
import 'package:vku_news/screens/home/widget/post_item.dart';
import 'package:vku_news/screens/home/widget/search_bar.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';
import 'package:vku_news/widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  bool? isLoading;
  HomeScreen({this.isLoading});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  var categoryID = 9999;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.isLoading == true ? const LoadingScreen() : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                HomeHeader(title: "VKU News",subTitle: "Discover things of this world"),
                const SizedBox(height: 30),
                const SearchBar(),
                const SizedBox(height: 30),
                CategoryList(
                  widget.isLoading,
                  selected: selected,
                  callback: (int index,int idCategory){
                    setState(() {
                      selected = index;
                      categoryID = idCategory;
                      Provider.of<ReProvider>(context,listen: false).findCategory(context.read<ReProvider>().listTemp, categoryID);
                    });
                  }
                ),
                const SizedBox(height: 20),
                const Text("Newest",style: TextStyle(color: blackPrimary,fontSize: 20,fontFamily: FontFamily.SourceSansPro,fontWeight: FontWeight.w600)),
                HomeSlider(widget.isLoading!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Recommended for you",style: TextStyle(color: blackPrimary,fontSize: 20,fontFamily: FontFamily.SourceSansPro,fontWeight: FontWeight.w600)),
                    TextButton(onPressed: (){}, child: const Text("See all",style: TextStyle(color: greyPrimary,fontSize: 15,fontFamily: FontFamily.SourceSansPro,fontWeight: FontWeight.w600)))
                  ],
                ),
                PostItem(widget.isLoading,categoryID)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
