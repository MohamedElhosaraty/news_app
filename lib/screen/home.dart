import 'package:flutter/material.dart';
import 'package:news_app/modeis/news-models.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/screen/article.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  Future<Temperatures>? newsBusiness;
  @override
  void initState() {
    super.initState();
    newsBusiness = News_repository().getTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        setState(() {
          newsBusiness = News_repository().getTopNews();
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE9EEFA),
          title: Text(
            'News',
            style: TextStyle(
                color: Color(0xff231F20),
                fontWeight: FontWeight.w600,
                fontSize: 35),
          ),
        ),
        body: FutureBuilder(
          future: newsBusiness,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData ) {
              final newsModel =snapshot.data!;

              return ListView.builder(
                itemCount: newsModel.articles!.length,
                itemBuilder: (context, index) {
                  final item = newsModel.articles![index];
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Article_Screen(articleItem: item,);
                        },));
                      },
                      trailing: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.urlToImage ??
                                  'https://th.bing.com/th?id=OIP.nXspRGpq3HMWpLd13YdU7AHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')),
                        ),
                      ),
                      title: Text(
                        item.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                          item.source?.name ?? 'empty Description',
                          maxLines: 3, overflow: TextOverflow.ellipsis),

                    ),
                  );
                },
              );
            }
            return const Text('There an error try again');
          },
        ),
      ),
    );
  }
}
