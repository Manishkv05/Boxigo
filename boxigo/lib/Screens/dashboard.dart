import 'dart:ffi';

import 'package:boxigo/Models/models.dart';
import 'package:boxigo/servise/boxi_aoi_servise.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
  
}

class _dashboardState extends State<dashboard> {
  bool is_all=false;
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<MovingDataList?>(
        stream: MovingDataService().fetchMovingData(),
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator()); // Show loading indicator
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        print(snapshot.data.toString());
        // Access your MovingDataList here
        MovingDataList? dataList = snapshot.data;
        return Scaffold(
          appBar: AppBar(actions:[
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined)),
             IconButton(onPressed: (){}, icon: Icon(Icons.search)),

          ]),
          body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Colors.amber,
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                               is_all=!is_all;
                            });
                          

                          }, child: Container(height: 60, child: Center(child: Text("All",style: TextStyle(color:is_all?Colors.amber: Colors.black),)))),
                          // Text("New"),
                          //   Text("Follow UP"),
                          //     Text("Booked"),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: dataList?.estimates?.length ?? 0,
                      itemBuilder: (context, index) {
                        return cards(dataList!.estimates![index]);
                        // ListTile(
                        //   title: Text(dataList!.estimates![index].estimateId ?? ''),
                        //   subtitle: Text(dataList.estimates![index].movingFrom ?? ''),
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
        );
      } else {
        return Text('No data found');
      }
        },
      ),
    );


    
  }
 Widget cards(MovingDataModel? data){
  
 DateTime dateTime = DateTime.parse(data!.movingOn??"");
  // Format the month as 3 letters (MMM) and get the day
  String formattedMonth = DateFormat('MMM').format(dateTime); // e.g., "Nov"
  String formattedDay = DateFormat('d').format(dateTime); // e.g., "6"
  
  // Format the time (HH:mm:ss)
  String formattedTime = DateFormat('HH:mm').format(dateTime); // e.g., "22:00:00"

return Container(child: Row(
  children: [
    Container(width:100,height:200,
    

 
    child: Column(
      children: [
        Text(formattedMonth),
        Text(formattedDay),
        Text(formattedTime)
      ],
    ),),
    Container(width: 200,height: 200,child: Row(
      children: [
        Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text(data!.fromCity??""),
                    Text(data!.estimateId ?? ''),
                ],
              ),
            ),
            Container(width: 200,height: 50, child: Text(data!.movingFrom??""),),
            Container(child: Row(children: [
              Text(data!.propertySize??""),
              Text(data!.total_items??""),
             // Text(getTotalItemsForBoxesTrolley(data!.inventory??"").toString()),
              Text(data!.distance??""),
            ],),),
            Container(child: Column(
              children: [
                Text(data!.tocity??""),
                 Container(width: 200,height: 50, child: Text(data!.movingTo??""),),
              ],
            ),)
          ],
        ),
      
      ],
    )),
  ],
),);
  }

// int getTotalItemsForBoxesTrolley(inventory) {
  
//   int totalQty = 0;

//   // Check if inventory is not null
//   if (inventory != null) {
//     for (var inv in inventory!) {
//       // Check if categories exist
//       if (inv.category != null) {
//         // Loop through each category
//         for (var cat in inv.category!) {
//           // Check for the category targetCategory (e.g., "boxes_trolley")
//           if (cat.displayName == "boxes_trolley") {
//             // Loop through the items in the category and sum the qty
//             for (var item in cat!.items!) {
//               totalQty += item.qty ?? 0; // Add qty or 0 if null
//             }
//           }
//         }
//       }
//     }
//   }

//   return totalQty;
// }



}