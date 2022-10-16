import 'package:flutter/material.dart';


class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
  child:   Center(
    child: Container(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
SizedBox(height: 30,),
            Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    Expanded(

                      child: GestureDetector(

                        onTap: (){

                          // Navigator.push(context, MaterialPageRoute(builder: (c) => FarmersListScreen()));

                        },

                        child: InkWell(

                          onTap: () {

                            // Navigator.push(context, MaterialPageRoute(builder: (c) => InputFsnDistribution(member_id: 0)));

                          },

                          child: Column(

                            children: <Widget>[

                              Image.asset(

                                'assets/images/question.png',

                                width: 100,

                                height: 100,

                              ),

                              Text('Ask health question', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)

                            ],

                          ),

                        ),

                      ),



                    ),



                    Expanded(

                      child: InkWell(

                        onTap: () {

                          // Navigator.push(context, MaterialPageRoute(builder: (c) => PlantPopulationScreen()));

                        },

                        child: Column(

                          children: <Widget>[

                            Image.asset(

                              'assets/images/heart.png',

                              width: 100,

                              height: 100,

                            ),

                            Text('Check Health Status',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))

                          ],

                        ),

                      ),

                    ),



                  ],

                ),

                SizedBox(height: 30,),



                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    Expanded(

                      child: InkWell(

                        onTap: (){

                          // Navigator.push(context, MaterialPageRoute(builder: (c) => GerminationTracking()));

                        },

                        child: Column(

                          children: <Widget>[

                            Image.asset(

                              'assets/images/amb.png',

                              width: 100,

                              height: 100,

                            ),

                            Text('Emergency', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))

                          ],

                        ),

                      ),

                    ),



                    Expanded(

                      child: InkWell(

                        onTap: () {

                          // Navigator.push(context, MaterialPageRoute(builder: (c) => StockManagement(recordId: 0)));

                        },

                        child: Column(

                          children: <Widget>[

                            Image.asset(

                              'assets/images/book.jpg',

                              width: 100,

                              height: 100,

                            ),

                            Text('Book Appointment with doctor', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))

                          ],

                        ),

                      ),

                    ),



                  ],

                ),

              ],

            ),

          ],

        ),
      ),

    ),
  ),
),
    );
  }
}
