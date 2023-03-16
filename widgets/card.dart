import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  NewsCard({Key? key, required this.url, required this.title, required this.date}) : super(key: key);
  final String? url;
  final String? title;
  final String? date;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(

      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.deepOrange,
                      Colors.yellow,
                    ],
                  ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child:url!.isEmpty
                      ? SizedBox()
                      : Image.network(

                    url!,


                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    title??"title",
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                  )),
                  Text(date??"date"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
