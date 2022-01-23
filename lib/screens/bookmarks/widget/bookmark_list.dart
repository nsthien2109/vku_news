import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/providers/bookmark_provider.dart';
import 'package:vku_news/providers/post_provider.dart';
import 'package:vku_news/screens/home/widget/home_header.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class BookmarkList extends StatefulWidget {
  const BookmarkList();

  @override
  _BookmarkListState createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkProvider>(
        builder: (context,dataBookmark,_) => Container(
          margin: const EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height - 230,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (_,index) => Container(
                height: MediaQuery.of(context).size.height/3.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: purpleLighter
                    ),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                            child: Image.network( Network().ImageUrl() +dataBookmark.listBookmark[index].imagePost!.toString(),fit: BoxFit.cover),
                          ),
                        )
                    ),
                    Expanded(
                        flex:1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text( dataBookmark.listBookmark[index].titlePost.toString() ,style: const TextStyle(
                                    color: blackPrimary,
                                    height: 1.3,
                                    letterSpacing: 1,
                                    fontSize: 18,
                                    fontFamily: FontFamily.SourceSansPro,
                                    fontWeight: FontWeight.w600
                                )),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: greyLighter,
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: IconButton(
                                      iconSize: 25,
                                      onPressed: (){
                                        Provider.of<BookmarkProvider>(context,listen: false).removeBookmark(dataBookmark.listBookmark[index].idPost!.toInt()).then((value){
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                            backgroundColor: primaryColor,
                                            content: Text("Removed bookmark"),
                                          ));
                                        });
                                      },
                                      icon: const Icon(Icons.bookmark_outlined,color: primaryColor)
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_,index) => const SizedBox(height: 10),
              itemCount: dataBookmark.listBookmark.length
          ),
        )
    );
  }
}
