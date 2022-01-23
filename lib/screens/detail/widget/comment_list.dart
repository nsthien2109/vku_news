import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vku_news/providers/comment_provider.dart';
import 'package:vku_news/screens/detail/widget/loading_comment.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';

class ListComment extends StatefulWidget {
  bool loading;
  ListComment({Key? key, required this.loading}) : super(key: key);

  @override
  _ListCommentState createState() => _ListCommentState();
}

class _ListCommentState extends State<ListComment> {


  @override
  Widget build(BuildContext context) {
    return Consumer<CommentProvider>(
        builder: (context,dataComment,_) => widget.loading == true ? SizedBox(
          height: MediaQuery.of(context).size.height/2.5,
          child: ListView.separated(
              itemBuilder: (_,index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                decoration: BoxDecoration(
                    color: greyLighter,
                    border: Border.all(
                        color: purpleLighter,
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset('assets/images/avatar.png',width: 30),
                        ),
                        const SizedBox(width: 10),
                        Text(dataComment.comment[index].username.toString(),style: const TextStyle(
                            color: greyDarker,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.SourceSansPro
                        ))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(dataComment.comment[index].commentContent.toString(),style: const TextStyle(
                        color: blackPrimary,
                        fontFamily: FontFamily.SourceSansPro,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    )),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        const Icon(Icons.watch_later_outlined,size: 15,color: greyDarker),
                        const SizedBox(width: 5),
                        Text(dataComment.comment[index].createdAt.toString(),style: const TextStyle(
                            color: greyDarker,
                            fontSize: 13,
                            fontFamily: FontFamily.SourceSansPro
                        ))
                      ],
                    )
                  ],
                ),
              ),
              separatorBuilder: (_,index) => const SizedBox(height: 15),
              itemCount: dataComment.comment.length
          ),
        ) : LoadingComment()
    );
  }
}
