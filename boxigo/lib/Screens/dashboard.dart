import 'dart:ffi';

import 'package:boxigo/Models/models.dart';
import 'package:boxigo/Screens/floor_info.dart';
import 'package:boxigo/Screens/items.dart';
import 'package:boxigo/Screens/new_leads_screen.dart';
import 'package:boxigo/Screens/test.dart';
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
    return  DefaultTabController(
      length: 5,
      child: Scaffold(
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
          
            body: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Container(
                     
                      width: double.infinity,
                      child:     Container(
                color: Colors.white, // Background color for the TabBar section
                child: TabBar(
                  labelColor: Colors.red, // Active label color
                  unselectedLabelColor: Colors.black, // Inactive label color
                  indicatorColor: Colors.red, // Active line color
                  indicatorWeight: 4.0, 
                  // Thickness of the active line
                  tabs: [
                    Tab(text: "  All  ",), // Tab for first screen
                    Tab(text: "New"), // Tab for second screen
                   Tab(text: "Follow Up"),
                    Tab(text: "Booked"), 
                     Tab(text: "In Track"),  // Tab for third screen  
                  ]               
                ),
              ),
                    ),
                     
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.77,
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

return Padding(
  padding: const EdgeInsets.all(4.0),
  child: Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    
    child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(width:MediaQuery.of(context).size.width*0.2,
          height:250,
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      formattedMonth,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                       
                      ),
                    ),
                    Text(
                      formattedDay,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 119, 118, 118),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
          
          //  Column(
          //   children: [
          //     Text(formattedMonth),
          //     Text(formattedDay),
          //     Text(formattedTime)
          //   ],
          // ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:0.0),
            child: Container(
             // width: MediaQuery.of(context).size.width*0.7,
              child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data!.fromCity??"",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          
                            Text(data!.estimateId ?? '',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        ]
                    ),
                    Container(width:  MediaQuery.of(context).size.width*0.78, 
                    child: Text(data!.movingFrom??"",style: TextStyle(color: Colors.grey),),),
                    Row(
                      children: [
                        Column(children: [
                           Text('|',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                                 Text('|',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                               Icon(Icons.keyboard_double_arrow_down_sharp,color: Colors.red),
                        ],),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(width:  MediaQuery.of(context).size.width*0.7,
                            child: Column(
                              children: [
                                Row(
                                                
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.house_rounded),
                                        Icon(Icons.inventory),
                                            Icon(Icons.emoji_transportation),
                                                Icon(Icons.route),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Text(data!.propertySize??""),
                                                 
                                          
                                    Text(data!.total_items.toString()+" items",),
                                  Text(getTotalItemsForBoxesTrolley(data!.inventory).toString()+" boxes",),
                                                   // Text(getTotalItemsForBoxesTrolley(data!.inventory??"").toString()),
                                Text(data!.distance??""),
                                                  ],),
                              ],
                            ),),
                        ),
                      ],
                    ),
                    Container(
                      width:  MediaQuery.of(context).size.width*0.75, child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(data!.tocity??"",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                         Container(width: MediaQuery.of(context).size.width*0.7, child: Text(data!.movingTo??"",style: TextStyle(color: Colors.grey),),),
  
  
                      ],
                    ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 3.0,top:15,bottom: 10),
                              child: Container(
                                          height: 38,
                                          width:  MediaQuery.of(context).size.width*0.375,
                                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                                        child: GestureDetector(onTap:  (){
                                           Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => New_leads( data: data,)),
                                                );
                                        },child: Center(child: Text('view Details',style: TextStyle(color: Colors.red),))),),
                            ),
                                        Padding(
                                         padding: const EdgeInsets.only(left: 4.0,top:15,bottom: 10),
                                          child: Container( 
                                                      height: 38,
                                                      width: MediaQuery.of(context).size.width*0.375,
                                                      color: Colors.red,
                                                      child: GestureDetector(onTap: (){},
                                                      child: Center(child: Text('Submit Quote',style: TextStyle(color: Colors.white
                                                ),))),),
                                        ),
                          ],
                        ),
          
                  ],
                ),
              
              ],
            )),
          ),
          
        ],
      ),
     
      // Padding(
      //   padding: const EdgeInsets.only(top: 5.0),
      //   child: Divider(),
      // )
         
    ],
  ),
  ),
);
  }
  
int getTotalItemsForBoxesTrolley(List<Inventory>? inventory) {
  int totalQty = 0;

  // Check if inventory is not null
  if (inventory != null) {
    // Loop through each inventory item
    for (var inv in inventory) {
      // Check if categories exist and loop through each category
      if (inv.category != null) {
        for (var cat in inv.category!) {
          // Check for the category "Boxes/Trolley"
          if (cat.displayName == "Boxes/Trolley" && cat.items != null) {
            // Loop through the items in the category and sum the qty
            for (var item in cat.items!) {
              totalQty += item.qty ?? 0; // Add qty or 0 if null
            }
          }
        }
      }
    }
  }

  return totalQty;
}



} // Column(
                          //   children: [
                          //     Text('|',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                          //        Text('|',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                          //     Icon(Icons.keyboard_double_arrow_down_sharp,color: Colors.red),
                          //   ],
                          // ),