import 'package:flutter/material.dart';
import 'package:news_app/modeis/news-models.dart';

class Article_Screen extends StatelessWidget {
  final Article articleItem;
  const Article_Screen({super.key, required this.articleItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                //ToDo : used BlocBuilder
                child: Stack(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height*.45,
                      //TODO : used to state
                      child: Image.network(
                        articleItem.urlToImage ??
                        'https://th.bing.com/th?id=OIP.nXspRGpq3HMWpLd13YdU7AHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
                      fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height*.40,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        //ToDo : used to MediaQuery
                        height: 735,
                        width: MediaQuery.of(context).size.width,
                        decoration:const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                articleItem.title ?? 'No Title',style: TextStyle(
                                 fontWeight: FontWeight.w600,fontSize: 30,
                                color: Color(0xff231F20),
                              ),),
                              SizedBox(
                                height: 18,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage: NetworkImage('https://th.bing.com/th?id=OIP.hLTThhxHPeGqFQVjpD1-hwHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),

                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      articleItem.author ?? 'No Author',style: TextStyle(
                                      fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff6D6265)
                                    ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      articleItem.publishedAt.toString(),style: TextStyle(
                                        fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff6D6265)
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                  articleItem.description ?? 'No Description',style: TextStyle(
                                fontWeight: FontWeight.w400,fontSize: 20,color: Color(0xff231F20)
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
