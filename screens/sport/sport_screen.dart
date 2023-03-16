import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/state.dart';
import '../../widgets/DividerOrange.dart';
import '../../widgets/card.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocBuilder<NewsCubit, NewsStates>(builder: (context, state) {
        NewsCubit cubit  = NewsCubit.get(context);
        if (state is SportNewsState) {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const DividerOrange(),
            itemCount: cubit.sport.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: NewsCard(
                url: cubit.sport[index]['urlToImage'],
                date: cubit.sport[index]['publishedAt'],
                title: cubit.sport[index]['title'],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );

  }
}
