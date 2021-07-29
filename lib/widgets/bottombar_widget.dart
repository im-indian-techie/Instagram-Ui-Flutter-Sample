import 'package:flutter/material.dart';

class Bottombarwidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,size: 30,),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.black,size: 30),label: ''),
        BottomNavigationBarItem(icon: Image.asset('assets/images/add.png',height: 30,width: 30,),label: ''),
        BottomNavigationBarItem(icon: Image.asset('assets/images/like.png',height: 30,width: 30,),label: ''),
        BottomNavigationBarItem(icon:CircleAvatar(backgroundImage: AssetImage('assets/images/men.png'),),label: ''),

      ],
    ));
  }
}
