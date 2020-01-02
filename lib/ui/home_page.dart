import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
              children: <Widget>[
                CustomAppBar(),
                CustomAppBackground(),
                AlarmCard(),
              ],
            )
      );
  }

}

class CustomAppBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final appBarHeight = MediaQuery.of(context).padding.top;
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      height: deviceSize.height,
      width: deviceSize.width,
      color: Colors.blueGrey,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: appBarHeight + 10,
          ),
          Text(
            '동탄버스알람',
            style: TextStyle(
              fontFamily: 'GoDo',
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appbarHeight = MediaQuery.of(context).padding.top;
    final deviceSize = MediaQuery.of(context).size;

    return Positioned(
      top: appbarHeight + 60,
      child: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(80)
        ),
      ),
    );
  }
}

class AlarmCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final appbarHeight = MediaQuery.of(context).padding.top;
    final deviceSize = MediaQuery.of(context).size;

    final cardWidth = deviceSize.width*0.75;
    final cardHeight = deviceSize.height*0.25;

    return Positioned(
      top: appbarHeight + 80,
      left: (deviceSize.width/2 - cardWidth/2),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            )
          ],
            
        ),
        child: IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.add),
                  color: Colors.white, 
                  onPressed: () {
                    Navigator.of(context).pushNamed('/SetAlarm');
                  }, 
               )    
      ),
    );
  }
}