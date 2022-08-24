import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:hotel_registration/rooms.dart';

void main() {

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
  ));

}

class homePage extends StatefulWidget {
   homePage({Key? key}) : super(key : key);

  @override
  State<homePage> createState() => _homePageState();

}

class _homePageState extends State <homePage> {

  String checkInDate = '' ;
  String checkOutDate = '' ;
  double numOfAdults = 0;
  double numOfChildren = 0;
  List <String> extras = [];
  String views ='';

        //numOfChildren


  DateTime date1 = DateTime.now();    //checkInDate
  Future<Null> selectinDate(BuildContext context) async {

    final DateTime? picked =await showDatePicker(
      context:context,
      initialDate: date1,
      firstDate: DateTime(1960),
      lastDate: DateTime(2040),);
    if(picked != null && picked != date1) {
      setState(() {

        date1 = picked;
        print(date1.toString());
      });
    }
  }

  DateTime date2 = DateTime.now();      //checkOutDate
  Future<Null> selectoutDate(BuildContext context) async {

    final DateTime? picked =await showDatePicker(
      context:context,
      initialDate: date2,
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),);
    if(picked != null && picked != date2) {
      setState(() {

        date2 = picked;
        print(date2.toString());
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    checkInDate = ('${date1.year} - ${date1.month} - ${date1.day}').toString() ;
    checkOutDate = ('${date2.year} - ${date2.month} - ${date2.day}').toString() ;

    return Scaffold(
      appBar: AppBar(
        title: Text('Castaway Resort',),
      ),




      body:

      Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[


            ListView(
              shrinkWrap: true,
              children: <Widget> [


              //////////////////////Home-Image////////////////////////

                Container(child: Image(image:NetworkImage("https://trevo.my/stories/wp-content/uploads/2022/05/best-beach-resorts-in-langkawi-casa-del-mar-langkawi-1-840x473.jpg"))),



              ///////////////////////Check-inDate////////////////////////
                Row(
                  children: [
                    Text('Check-in Date:',style: TextStyle(color: Colors.blue)),
                    SizedBox(width: 38,),
                    IconButton(onPressed: () {selectinDate(context);}, icon: Icon(Icons.date_range)),
                    Text(('${date1.year} - ${date1.month} - ${date1.day}').toString(),style: TextStyle(color: Colors.blue),)
                  ],
                ),


                ////////////////////Check-outDate/////////////////////
                Row(
                  children: [
                    Text('Check-out Date:',style: TextStyle(color: Colors.blue)),
                    SizedBox(width: 30,),
                    IconButton(onPressed: () {selectoutDate(context);}, icon: Icon(Icons.date_range)),
                    Text(('${date2.year} - ${date2.month} - ${date2.day}').toString(),style: TextStyle(color: Colors.blue))
                  ],
                ),



                //////////////////Number of Adults////////////////////
                Row(
                  children: [
                    Text('Number of Adults: ',style: TextStyle(color: Colors.blue)),
                    SizedBox(width: 30,),
                    Slider(value: numOfAdults ,
                      onChanged: (newRating1){

                        setState(() {
                          numOfAdults = newRating1;
                        });

                      },

                      divisions: 10,
                      label: numOfAdults.toInt().toString(),
                      min: 0,
                      max: 10,

                    ),
                    Text(numOfAdults.toInt().toString()),

                  ],
                ),



                ///////////////Number of Children/////////////////
                Row(
                  children: [
                    Text('Number of Children: ',style: TextStyle(color: Colors.blue)),
                    SizedBox(width: 20,),
                    Slider(value: numOfChildren,
                      onChanged: (newRating2){

                        setState(() {
                          numOfChildren = newRating2;
                        });

                      },

                      divisions: 10,
                      label: numOfChildren.toInt().toString(),
                      min: 0,
                      max: 10,

                    ),
                    Text(numOfChildren.toInt().toString()),

                  ],
                ),


              //////////////////Extras////////////////////
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  <Widget> [

                    Text('Extras: ',style: TextStyle(color: Colors.blue)),
                    CheckboxGroup(
                      labels:<String> ["Breakfast (50EGP/Day)",
                        "Internet WiFi (50EGP/Day)","Parking (100EGP/Day)"],
                      onSelected: (List<String>checked){extras = checked;},
                    ),


                    SizedBox( height: 10,),
                    Text('View:',style: TextStyle(color: Colors.blue)),
                    RadioButtonGroup(labels:<String> ["Garden View","Sea View"],
                      onSelected: (String selected) {views = selected;},


                    ),

                  ],

                ),




              ///////////////Rate////////////////////
                Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 100),
                 child: ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: ((context)
                 => rooms(checkInDate: checkInDate, checkOutDate: checkOutDate, numOfAdults: numOfAdults, numOfChildren: numOfChildren, extras: extras, views: views) )));},
                   child: Text('Check Rooms and Rates'),),

                  ),

                ],),



              ],
            )
          ],
        ),
      ),
    );
  }
}
