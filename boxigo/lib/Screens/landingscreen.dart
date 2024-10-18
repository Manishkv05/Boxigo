import 'dart:ffi';

import 'package:boxigo/Business%20logics/darshboard_bloc/dashboard_bloc.dart';
import 'package:boxigo/Models/models.dart';
import 'package:boxigo/Screens/floor_info.dart';
import 'package:boxigo/Screens/items.dart';
import 'package:boxigo/bottomnav/botomnav_items.dart';
import 'package:boxigo/servise/boxi_aoi_servise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/src/bloc_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Landingscreen extends StatefulWidget {
  const Landingscreen({super.key});

  @override
  State<Landingscreen> createState() => _dashboardState();
  
}

class _dashboardState extends State<Landingscreen> {
  bool is_all=false;
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
     
      builder: (context, state) {
        return  
    Scaffold(
         appBar: AppBar(
          title:Container(width: 140,height: 70,color: Colors.grey.shade300,),
          actions:[
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined)),
             IconButton(onPressed: (){}, icon: Icon(Icons.search)),

          ]),
      body: Center(child: bottomnavscreen.elementAt(state.tabIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomitems,
      currentIndex: state.tabIndex,
      selectedItemColor: Colors.red,
      showUnselectedLabels:true,
      unselectedItemColor: Colors.grey.shade500,
      onTap: (index){
        BlocProvider.of<DashboardBloc>(context).add(Tabchange(tabIndex: index));

      },
      ),
    );

      },
    );
    
   

    
  }
 Widget cards(MovingDataModel? data){
  
 DateTime dateTime = DateTime.parse(data!.movingOn??"");
  // Format the month as 3 letters (MMM) and get the day
  String formattedMonth = DateFormat('MMM').format(dateTime); // e.g., "Nov"
  String formattedDay = DateFormat('d').format(dateTime); // e.g., "6"
  
  // Format the time (HH:mm:ss)
  String formattedTime = DateFormat('HH:mm').format(dateTime); // e.g., "22:00:00"

return Container(
  child: Column(
   
  children: [
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:0.0),
          child: Container(width:MediaQuery.of(context).size.width*0.2,
          //height:185,
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
        ),
        Padding(
          padding: const EdgeInsets.only(top:0.0),
          child: Container(width: MediaQuery.of(context).size.width*0.7,child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data!.fromCity??"",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          Text(data!.estimateId ?? '',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(width:  MediaQuery.of(context).size.width*0.7, child: Text(data!.movingFrom??"",style: TextStyle(color: Colors.grey),),),
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
                  Container(
                    width:  MediaQuery.of(context).size.width*0.7, child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(data!.tocity??"",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                       Container(width: MediaQuery.of(context).size.width*0.7, child: Text(data!.movingTo??"",style: TextStyle(color: Colors.grey),),),
                    ],
                  ),)
                ],
              ),
            
            ],
          )),
        ),
        
      ],
    ),
    Padding(
      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*0.2 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 40,
            width:  MediaQuery.of(context).size.width*0.38,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: GestureDetector(onTap:  (){
             Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Items(data)),
                  );
          },child: Center(child: Text('view Details',style: TextStyle(color: Colors.red),))),),
          Container( 
            height: 40,
            width: MediaQuery.of(context).size.width*0.38,
            color: Colors.red,
            child: GestureDetector(onTap: (){
         Navigator.push(
                context,
                
                MaterialPageRoute(builder: (context) => FloorInfo(data)),
              );
      },child: Center(child: Text('Submit Quote',style: TextStyle(color: Colors.white
      ),))),),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(),
    )
       
  ],
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