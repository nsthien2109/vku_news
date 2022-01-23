import 'package:flutter/material.dart';
import 'package:vku_news/providers/bookmark_provider.dart';
import 'package:vku_news/screens/bookmarks/widget/bookmark_list.dart';
import 'package:vku_news/screens/bookmarks/widget/empty_bookmark.dart';
import 'package:vku_news/screens/home/widget/home_header.dart';
import 'package:provider/src/provider.dart';


class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  _BookMarkScreenState createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15,vertical:20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(title: "Bookmark", subTitle: "Saved articles to the library"),
                    context.read<BookmarkProvider>().listBookmark.isEmpty ? const EmptyBookmark() : const BookmarkList()
                  ],
                ),
              ),
            )
        )
    );
  }
}
