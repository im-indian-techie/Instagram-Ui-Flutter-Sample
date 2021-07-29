import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:2,itemBuilder: (context,index){
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
            title: Text('Ashin'),
            trailing: IconButton(icon: Icon(Icons.more_vert),onPressed: null,),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/men.png')
            )),
          ),
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

        ],
      );
    });
  }
}
