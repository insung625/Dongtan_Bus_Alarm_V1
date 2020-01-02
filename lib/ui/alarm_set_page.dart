import 'package:flutter/material.dart';

class AlarmSetPage extends StatefulWidget {
  @override
  _AlarmSetPageState createState() => _AlarmSetPageState();
}

class _AlarmSetPageState extends State<AlarmSetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AlarmAppBar(),
          AlarmBody(),
        ],
      ),
    );
  }
}


class AlarmAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final appTopPaddingHeight = MediaQuery.of(context).padding.top;  
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SizedBox(
          height: appTopPaddingHeight,
          child: Container(
            color: Colors.blueGrey,
          ),
        ),
        Container(
          height: 60,
          width: deviceSize.width,
          color: Colors.blueGrey,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                iconSize: 35, 
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    '알람추가',
                    style: TextStyle(
                      fontFamily: 'Godo',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.check_circle_outline),
                iconSize: 35,
                color: Colors.white,
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AlarmBody extends StatefulWidget {
  @override
  _AlarmBodyState createState() => _AlarmBodyState();
}

class _AlarmBodyState extends State<AlarmBody> {

  bool _togglevalue = false;
  var _numMinutes = 5;


  @override
  Widget build(BuildContext context) {

    TextEditingController stationController = TextEditingController();
    TextEditingController busController = TextEditingController();

    return Column(
      children: <Widget>[
        //정류장 검색
        Padding(
           padding: const EdgeInsets.all(8),
           child: TextField(
             onChanged: (value) {

             },
             controller: stationController,
             decoration: InputDecoration(
               prefixIcon: Icon(Icons.search),
               labelText: "정류장",
               hintText: "정류장명",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(25)),
               )
             ),
           ),
         ),
        //번호 검색
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            onChanged: (value) {

            },
            controller: busController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelText: "버스",
              hintText: "번호",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              )
            ),

          ),
        ),
        //아이콘 버튼을 이용한 +/- 증,감분
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  '알람시간',
                  style: TextStyle(
                    fontFamily: 'Godo',
                    fontSize: 20,
                  ),
                )
              ),
              // Text(
              //   '도착',
              //   style: TextStyle(
              //       fontFamily: 'Godo',
              //       fontSize: 20,
              //     ),

              // ),
              IconButton(
                icon: Icon(Icons.remove_circle_outline), 
                onPressed: () {
                  setState(() {
                    _numMinutes--;
                  });
                },
              ),
              Text(
                _numMinutes.toString(),
                style: TextStyle(
                    fontFamily: 'Godo',
                    fontSize: 20,
                  ),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline), 
                onPressed: () {
                  setState(() {
                    _numMinutes++;
                  });
                },
              ),            
              Text(
                '분전',
                style: TextStyle(
                    fontFamily: 'Godo',
                    fontSize: 20,
                  ),
              ),
            ]
          ),
        ),
        //토글 스위치 이용한 진동/알람
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: _togglevalue ? Colors.teal : Colors.amber
          ),
        ),

      ],
    );
  }
}
