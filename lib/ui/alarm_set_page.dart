import 'package:flutter/material.dart';
import 'package:search_widget/search_widget.dart';

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
  FocusNode _focusNodeStation = FocusNode();
  FocusNode _focusNodeBus = FocusNode();

  Color _mainColor = Colors.blueGrey;

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
             focusNode: _focusNodeStation,
             onChanged: (value) {

             },
             controller: stationController,
             decoration: InputDecoration(
               prefixIcon: Icon(Icons.search, color: _mainColor,),
               labelText: "정류장",
               hintText: "정류장명",
               labelStyle: TextStyle(
                  fontFamily: 'Godo',
                  fontSize: 20,
                  color: _mainColor
               ),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: _mainColor
                 )
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: _mainColor
                 )
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
              prefixIcon: Icon(Icons.search, color: _mainColor),
              labelText: "버스",
              hintText: "번호",
              labelStyle: TextStyle(
                  fontFamily: 'Godo',
                  fontSize: 20,
                  color: _mainColor
               ),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: _mainColor
                 )
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: _mainColor
                 )
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
                    color: _mainColor
                  ),
                )
              ),
              IconButton(
                icon: Icon(Icons.remove_circle_outline, color: _mainColor), 
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
                    color: _mainColor
                  ),
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline, color: _mainColor), 
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
                    color: _mainColor
                  ),
              ),
            ]
          ),
        ),
        //토글 스위치 이용한 진동/알람
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  '진동',
                  style: TextStyle(
                        fontFamily: 'Godo',
                        fontSize: 20,
                        color: _mainColor
                      ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: _togglevalue ? Colors.greenAccent[100].withOpacity(0.5) : Colors.grey.withOpacity(0.5),
                ),
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      top: 0,
                      left: _togglevalue ? 40 : 0,
                      right: _togglevalue ? 0 : 40,
                      child: InkWell( //inkwell 실제 버튼처럼 동작하게 해줌.
                        onTap: (){
                          setState(() {
                            _togglevalue = !_togglevalue;
                          });
                        },
                        child: AnimatedSwitcher(
                           duration: Duration(milliseconds: 500),
                           transitionBuilder: (Widget child, Animation<double> animation){
                             return RotationTransition(child: child, turns: animation);
                           },
                           child: _togglevalue ? 
                           Icon(Icons.check_circle, color: Colors.green, size: 40, key: UniqueKey()) : 
                           Icon(Icons.remove_circle, color: Colors.grey, size: 40, key: UniqueKey()),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
