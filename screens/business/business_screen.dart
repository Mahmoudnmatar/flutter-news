import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/state.dart';

import '../../widgets/DividerOrange.dart';
import '../../widgets/card.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<NewsCubit, NewsStates>(
          builder: (context, state) {
        List<dynamic>? list = NewsCubit.get(context).business;
        if (list.length>0) {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                DividerOrange(),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: NewsCard(
                url: list[index]['urlToImage']??"",
                date: list[index]['publishedAt'],
                title: list[index]['title'],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
