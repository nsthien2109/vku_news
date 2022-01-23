import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/providers/account_provider.dart';
import 'package:vku_news/providers/bookmark_provider.dart';
import 'package:vku_news/providers/comment_provider.dart';
import 'package:vku_news/screens/detail/widget/comment_list.dart';
import 'package:vku_news/screens/detail/widget/detail_html.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:vku_news/styles/fonts.dart';
import 'package:vku_news/widgets/buttons/button_big.dart';
import 'package:vku_news/widgets/buttons/button_text.dart';

class DetailScreen extends StatefulWidget {
  int id;
  String image;
  String description;
  String author;
  String date;
  String title;
  int? idCustomer;
  bool loadingComment;
  DetailScreen({required this.id ,required this.image, required this.title , required this.description , required this.author, required this.date,required this.loadingComment});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: greyPrimary,
        ),
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_outlined,size: 20)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share_outlined,size: 20)),
          IconButton(onPressed: (){
            if(context.read<AccountProvider>().account.idCustomer == null){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: primaryColor,
                content: Text("Login Please"),
              ));
            }else{
              if(context.read<BookmarkProvider>().checkBookmarkItem(widget.id) == false){
                Provider.of<BookmarkProvider>(context,listen: false).addBookmark(widget.id, context.read<AccountProvider>().account.idCustomer!.toInt()).then((value){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: primaryColor,
                    content: Text("Add to bookmark"),
                  ));
                });
              }else if(context.read<BookmarkProvider>().checkBookmarkItem(widget.id) == true){
                Provider.of<BookmarkProvider>(context,listen: false).removeBookmark(widget.id).then((value){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: primaryColor,
                    content: Text("Removed bookmark"),
                  ));
                });
              }
            }
          }, icon: context.watch<BookmarkProvider>().checkBookmarkItem(widget.id) == false ? const Icon(Icons.bookmark_border_outlined,size: 25) : const Icon(Icons.bookmark_outlined,size: 25,color: primaryColor))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical:20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(Network().ImageUrl() + widget.image,fit: BoxFit.cover),
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.watch_later_outlined,size: 15,color: white),
                        const SizedBox(width: 5),
                        Text(widget.date,style: const TextStyle(
                          color: white,
                          fontFamily: FontFamily.SourceSansPro,
                          fontSize: 15
                        )),
                      ],
                    ),
                  ),
                  Text(widget.title,style: const TextStyle(
                    color: blackPrimary,
                    fontSize: 30,
                    fontFamily: FontFamily.SourceSansPro,
                    fontWeight: FontWeight.w600
                  )),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset('assets/images/avatar.png',width: 50),
                      ),
                      const SizedBox(width: 5),
                      Text(widget.author,style: const TextStyle(
                        fontSize: 18,
                        fontFamily: FontFamily.SourceSansPro,
                        fontWeight: FontWeight.w600
                      ))
                    ],
                  ),
                  ReadDetail(des: widget.description),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      color: greyLighter,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: greyLighter,
                      )
                    ),
                    child: context.read<AccountProvider>().account.idCustomer != null ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Comment",style: TextStyle(
                          color: greyDarker,
                          fontFamily: FontFamily.SourceSansPro,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        )),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: (val) => val!.isEmpty ? "Please enter comment" : null,
                          controller: commentController,
                          decoration: InputDecoration(
                            label: const Text("Write comment here"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: greyPrimary,
                                width: 1,
                                style: BorderStyle.solid
                              )
                            )
                          ),
                        ),
                        const SizedBox(height: 10),
                        BigButton(
                            textButton: _loading == true ? "Commenting" :"Comment",
                            colorButton: _loading == true ? greyLight : primaryColor,
                            textColor: white,
                            bigClick: (){
                              if (_formKey.currentState!.validate()) {
                                try {
                                  setState(() {
                                    _loading = true;
                                  });
                                  Provider.of<CommentProvider>(context,listen: false).writeComment(
                                      context.read<AccountProvider>().account.idCustomer!.toInt(),
                                      widget.id,
                                      commentController.text,
                                      "unknow.png",
                                      context.read<AccountProvider>().account.nameCustomer.toString()
                                  ).then((value){
                                    setState(() {
                                      _loading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Commented"),
                                    ));
                                  });
                                  commentController.clear();
                                } catch (error) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(error.toString()),
                                  ));
                                }
                              }
                            }
                        )
                      ],
                    ) : ButtonText(textButton: "Login to comment", onClick: (){}),
                  ),
                  ListComment(loading: widget.loadingComment)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
