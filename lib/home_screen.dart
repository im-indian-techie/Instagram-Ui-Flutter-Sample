import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:instagram_sample/widgets/bottombar_widget.dart';

import 'model/myItem.dart';
import 'model/post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Post>> _futurePost;
  List myitems=[];


  Future<List<Post>> getPostList() async {
    print("comes");
    var url = Uri.parse('https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas');
    final response = await get(url,headers:{"Content-Type":
    "application/json"});
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Post.fromJson(job)).toList();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futurePost=getPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.camera_alt_outlined,size: 40,
        color: Colors.grey[600],),
        titleSpacing: 3,
        title: Text("Instagram",style: TextStyle(decoration:TextDecoration.none,fontFamily:'Billabong',fontSize: 30),),

        actions: [
          IconButton(icon: Image.asset('assets/images/send.png'), onPressed: (){})
        ],),
     body: FutureBuilder<List<Post>>(
      future: _futurePost,
      builder: (context,snapshot)
      {
        if(snapshot.hasData)
        {
          return ListView.builder(itemCount:snapshot.data!.length,itemBuilder: (context,index){
            Post myitem=snapshot.data![index];
            return Column(
              children: [
                ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(),
                        image: DecorationImage(image: AssetImage('assets/images/men.png'))
                    ),
                  ),
                  title: Text(myitem.channelname),
                  trailing: IconButton(icon: Icon(Icons.more_vert),onPressed: null,),
                ),
                // Container(
                //   height: 300,
                //   decoration: BoxDecoration(image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: Image.network(myitem.high_thumbnail)
                //   )),
                // ),
                Container(
                  height: 300.0,
                  padding: const EdgeInsets.all(10.0),
                  child: myitem.high_thumbnail!=null?
                  Image.network(myitem.high_thumbnail,fit:BoxFit.cover,):
                  Image.asset(
                    "assets/images/gallery.png",
                    fit: BoxFit.fill,
                  ),
                ) ,
                ListTile(
                  leading: Wrap(
                    children: [
                      Icon(Icons.favorite_border,color: Colors.black,size: 30,),
                      SizedBox(width: 10,),
                      Image.asset('assets/images/chatbubble.png',height: 30,width: 30,),
                      SizedBox(width: 10,),
                      Image.asset('assets/images/send.png',height: 30,width: 30,),
                    ],
                  ),
                  trailing: Icon(Icons.bookmark_border,size: 30,color: Colors.black,),
                ),
                DescriptionTextWidget(text: myitem.title),


              ],
            );
          });
        }
        else
          if(snapshot.hasError)
            {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
        return Center(
          child:CircularProgressIndicator() ,
        );

      },
    ),
      bottomNavigationBar: Bottombarwidget(),
    );
  }
}
class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
        children: <Widget>[
          new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
          new InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  flag ? "show more" : "show less",
                  style: new TextStyle(color: Colors.grey),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}
