import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class MyItem{
  bool isExpanded;
  final String header;
  final String body;
  MyItem({this.isExpanded = false , required this.header, required this.body});
}


class rooms extends StatefulWidget {

  String checkInDate = '' ;
  String checkOutDate = '' ;
  double numOfAdults = 0;
  double numOfChildren = 0;
  List <String> extras = [];
  String views ='';


  rooms({ required this.checkInDate,required this.checkOutDate,required this.numOfAdults,
      required this.numOfChildren,required this.extras,required this.views});

  @override
  State<rooms> createState() => _roomsState(checkInDate: checkInDate, checkOutDate: checkOutDate, numOfAdults: numOfAdults, numOfChildren: numOfChildren, extras: extras, views: views);
  
}

class _roomsState extends State <rooms> {

  

  String checkInDate = '' ;
  String checkOutDate = '' ;
  double numOfAdults = 0;
  double numOfChildren = 0;
  List <String> extras = [];
  String views ='';

  String rooms = '';

  bool _swVal = false;
  bool _swVal2 = false;
  bool _swVal3 = false;

  ///////Single-Room-SwitchValue/////////
  void _onChange (bool val) {
    setState(() {
      _swVal = val;
    });
  }

  ///////Double-Room-SwitchValue/////////
  void _onChange2 (bool val2) {
    setState(() {
      _swVal2 = val2;
    });
  }
  ///////Suite-Room-SwitchValue/////////
  void _onChange3 (bool val3) {
    setState(() {
      _swVal3 = val3;
    });
  }




  void showAlertDialog(BuildContext context){
      var alertDialog = AlertDialog(

      title: Text('Are you sure you want to proceed in checking-in?'),
      content: Text('This is a confirmation message that you agree on all data you entered'),
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
          print('Thanks');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
              Text('Your form has been successfully submitted!'),
              duration: Duration(seconds: 3),

            ),);


        },
            child: Text('Confirm')),

        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
            child: Text('Discard')),

      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );

  }


  final List<MyItem> _item1 = <MyItem> [

    MyItem(header:"",
        body:""),
  ];
  final List<MyItem> _item2 = <MyItem> [

    MyItem(header:"",
        body:""),
  ];
  final List<MyItem> _item3 = <MyItem> [

    MyItem(header:"",
        body:""),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Castaway Resort',),
      ),



      body:



Column(children: [
  Container(
  child:


      ////////// Card1 for Single room ///////////
      Card(
        child: Column(children:<Widget>[

        ExpansionPanelList(expansionCallback: (
            int index,
            bool isExpanded
            )
        {
          setState(() {
            _item1[index].isExpanded=!_item1[index].isExpanded;
          });
        },

          children: _item1.map<ExpansionPanel>((MyItem item){

            return ExpansionPanel(
              headerBuilder: (BuildContext context,bool isExpanded)
              {
                return Row(
                  children: [
                    SizedBox(width: 10),
                    Image(image: NetworkImage("https://23c133e0c1637be1e07d-be55c16c6d91e6ac40d594f7e280b390.ssl.cf1.rackcdn.com/responsive/16:9/1200px/u/phhk/home/1a-Superior-Single-Room-min1.jpg"),
                      height: 100,width: 130,),
                    SizedBox(width: 10),
                    Text('Single Room',style: TextStyle(fontSize: 16,color: Colors.blue)),
                    Switch(value: _swVal, onChanged: _onChange,activeColor: Colors.blue,),


                  ],
                );
              },
              body: Row(
                children: [

                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.black26,),

                   Text("       A room assigned to one person",
                     style: TextStyle(color: Colors.blue,fontSize: 14),),

                ],

              ),
              isExpanded: item.isExpanded,
            );

          }).toList(),
        ),

      ],),

      ),
      ),






////////// Card2 for Double room ///////////


  Container(
    child:
    Card(
      child: Column(children:<Widget>[

        ExpansionPanelList(expansionCallback: (
            int index,
            bool isExpanded
            )
        {
          setState(() {
            _item2[index].isExpanded=!_item2[index].isExpanded;
          });
        },

          children: _item2.map<ExpansionPanel>((MyItem item){

            return ExpansionPanel(
              headerBuilder: (BuildContext context,bool isExpanded)
              {
                return Row(
                  children: [
                    SizedBox(width: 10),
                    Image(image: NetworkImage("https://media-cdn.tripadvisor.com/media/photo-s/0d/3d/4f/af/double-double-room.jpg"),
                      height: 100,width: 130,),
                    SizedBox(width: 10),
                    Text('Double Room',style: TextStyle(fontSize: 16,color: Colors.blue)),
                    Switch(value: _swVal2, onChanged: _onChange2,activeColor: Colors.blue,),


                  ],
                );
              },
              body: Row(
                children: [

                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.black26,),

                  Text("       A room assigned to two people. \n    "
                      "     May have one or more beds.",
                    style: TextStyle(color: Colors.blue,fontSize: 14,),),

                ],

              ),
              isExpanded: item.isExpanded,
            );

          }).toList(),
        ),

      ],),

    ),
  ),






////////// Card3 for Suite room ///////////


  Container(
    child:
    Card(
      child: Column(children:<Widget>[

        ExpansionPanelList(expansionCallback: (
            int index,
            bool isExpanded
            )
        {
          setState(() {
            _item3[index].isExpanded=!_item3[index].isExpanded;
          });
        },

          children: _item3.map<ExpansionPanel>((MyItem item){

            return ExpansionPanel(
              headerBuilder: (BuildContext context,bool isExpanded)
              {
                return Row(
                  children: [
                    SizedBox(width: 10),
                    Image(image: NetworkImage("https://www.lottehotel.com/content/dam/lotte-hotel/lotte/yangon/accommodation/hotel/suite/royalsuite/180712-49-2000-acc-yangon-hotel.jpg.thumb.1920.1920.jpg"),
                      height: 100,width: 130,),
                    SizedBox(width: 10),
                    Text('Suite Room',style: TextStyle(fontSize: 16,color: Colors.blue)),
                    Switch(value: _swVal3, onChanged: _onChange3,activeColor: Colors.blue,),


                  ],
                );
              },
              body: Row(
                children: [

                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange),
                  Icon(Icons.star,color: Colors.orange,),

                  Text("       A room with one or more bedrooms \n    "
                      "  and a seperate living space.",
                    style: TextStyle(color: Colors.blue,fontSize: 14,),),

                ],

              ),
              isExpanded: item.isExpanded,
            );

          }).toList(),
        ),

      ],),

    ),
  ),






  ////////////////Book Now btn/////////////////

  Container(

      padding: EdgeInsets.only(left: 10,top: 30),
      width: 260,
      child:
      ElevatedButton(onPressed: (){

        if(_swVal == true && _swVal2 == false && _swVal3 == false)
          {
            rooms = 'Single Room';
          }
        else if(_swVal == false && _swVal2 == true && _swVal3 == false)
        {
          rooms = 'Double Room';
        }
        else if(_swVal == false && _swVal2 == false && _swVal3 == true)
        {
          rooms = 'Suite';
        }



        showAlertDialog(context);
        FirebaseFirestore.instance.collection('Hotel').add(
            {'checkInDate':'$checkInDate',
              'checkOutDate':'$checkOutDate',
              'extras':'$extras',
              'numOfAdults':'$numOfAdults',
              'numOfChildren':'$numOfChildren',
              'rooms':'$rooms',
              'views':'$views',


            });
        print(checkInDate);
        print(checkOutDate);
        print(views);
        print(extras);
        print(numOfAdults);
        print(numOfChildren);
        print(rooms);   },
          child: Text('Book Now!',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))
  ),

],
),



    );
  }

  _roomsState({required this.checkInDate,required this.checkOutDate,required this.numOfAdults,
      required this.numOfChildren,required this.extras,required this.views});
}
