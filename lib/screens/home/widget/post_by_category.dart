import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/providers/recommended_provider.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class PostByCategory extends StatefulWidget {
  int categorID = 9999;
  bool? isLoading;
  PostByCategory(this.isLoading, this.categorID);

  @override
  _PostByCategoryState createState() => _PostByCategoryState();
}

class _PostByCategoryState extends State<PostByCategory> {
  @override
  Widget build(BuildContext context) {
    return  widget.isLoading == true ?
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
    ) : Consumer<ReProvider>(
        builder: (context,postData,_) => Container(
          margin: const EdgeInsets.only(top: 10,bottom: 30),
          height: MediaQuery.of(context).size.height/2,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (_,index) => GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: greyLighter,
                      borderRadius: BorderRadius.circular(8)

                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.network(Network().ImageUrl() +postData.rePost[index].imagePost.toString())
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(postData.rePost[index].authorPost.toString(),style: const TextStyle(color: greyPrimary,fontSize: 15,fontFamily: FontFamily.SourceSansPro,fontWeight: FontWeight.w400)),
                              const SizedBox(height: 5),
                              Text(postData.rePost[index].titlePost.toString(),style: const TextStyle(color: blackPrimary,fontSize: 18,fontFamily: FontFamily.SourceSansPro,fontWeight: FontWeight.w600))
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (_,index) => const SizedBox(height: 10),
              itemCount: postData.rePost.length
          ),
        )
    );
  }
}
