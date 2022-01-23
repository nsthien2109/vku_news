import 'package:flutter/material.dart';
import 'package:vku_news/providers/recommended_provider.dart';
import 'package:vku_news/styles/colors.dart';
import 'package:provider/provider.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) => context.read<ReProvider>().searchPost(text),
      decoration: InputDecoration(
        labelText: "Search",
        filled: true,
        fillColor: greyLighter,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: greyLighter
            )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: greyLighter
          )
        ),
        prefixIcon: const Icon(Icons.search_outlined,color: greyDarker,size: 25),
        suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.mic_none_outlined,color: greyDarker,size: 25))
      ),
    );
  }
}
