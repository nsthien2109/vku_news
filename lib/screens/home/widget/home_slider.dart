import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/providers/account_provider.dart';
import 'package:vku_news/providers/bookmark_provider.dart';
import 'package:vku_news/providers/comment_provider.dart';
import 'package:vku_news/providers/slide_provider.dart';
import 'package:vku_news/screens/detail/detail_screen.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class HomeSlider extends StatefulWidget {
  bool? _isLoading;
  HomeSlider(this._isLoading);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

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
    ) : Consumer<SlideProvider>(
        builder: (context,slideData,_) => Container(
          height: MediaQuery.of(context).size.height/5.5,
          margin: const EdgeInsets.only(top: 15),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index) => GestureDetector(
                onTap: (){
                  bool _loadingComment = true;
                  Provider.of<CommentProvider>(context,listen: false).fetchComment(slideData.slides[index].idPost!.toInt()).then((value){
                    setState(() {
                      _loadingComment = false;
                    });
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                    id: slideData.slides[index].idPost!.toInt(),
                    image: slideData.slides[index].imagePost.toString(),
                    title: slideData.slides[index].titlePost.toString(),
                    description: slideData.slides[index].descriptionPost.toString(),
                    date: slideData.slides[index].createdAt.toString(),
                    author: slideData.slides[index].authorPost.toString(),
                    loadingComment: _loadingComment,
                      )
                    )
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(3),
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(Network().ImageUrl() +slideData.slides[index].imagePost.toString(),color: greyLight.withOpacity(0.9), colorBlendMode: BlendMode.modulate,fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border_outlined,color: white,size: 20)
                        ),
                        right: 0,
                        top: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8,left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(slideData.slides[index].authorPost.toString().toUpperCase(),style: const TextStyle(color: white, fontFamily: FontFamily.SourceSansPro,fontSize: 15,fontWeight: FontWeight.w300,)),
                            const SizedBox(height: 5),
                            Text(slideData.slides[index].titlePost.toString(),style: const TextStyle(color: white,fontSize: 17,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (_,index) => const SizedBox(width: 10),
              itemCount: 5
          ),
        )
    );
  }
}
