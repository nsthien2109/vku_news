import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/providers/post_provider.dart';
import 'package:vku_news/screens/category/widget/waiting.dart';
import 'package:vku_news/screens/home/widget/home_header.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class PostWithCategory extends StatefulWidget {
  int categoryID;
  String nameCategory;
  PostWithCategory({required this.nameCategory , required this.categoryID});

  @override
  _PostWithCategoryState createState() => _PostWithCategoryState();
}

class _PostWithCategoryState extends State<PostWithCategory> {
  bool _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<PostProvider>(context,listen: false).fetchPostWithCategory(widget.categoryID).then((value){
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading == true ? const WaitingScreen() : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Consumer<PostProvider>(
            builder: (context,postData,_) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 15,vertical:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(title: widget.nameCategory, subTitle: ""),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/1.18,
                    child: ListView.separated(
                        itemBuilder: (_,index) => Container(
                          decoration: BoxDecoration(
                              color: index  % 2 == 0 ? purpleLighter : white,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(Network().ImageUrl() + postData.postList[index].imagePost.toString(),width: 140)
                              ),
                              const SizedBox(width: 15),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(postData.postList[index].authorPost.toString(),style: const TextStyle(
                                      fontSize: 15,
                                      color: greyDarker,
                                      fontFamily: FontFamily.SourceSansPro,
                                    )),
                                    const SizedBox(height: 5),
                                    Text(postData.postList[index].titlePost.toString(),style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: FontFamily.SourceSansPro,
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w600
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        separatorBuilder: (_,index) => const SizedBox(height: 10),
                        itemCount: postData.postList.length
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
