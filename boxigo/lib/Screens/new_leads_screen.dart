// import 'package:boxigo/Models/models.dart';
// import 'package:boxigo/Screens/floor_info.dart';
// import 'package:boxigo/Screens/items.dart';
// import 'package:flutter/material.dart';

// class New_leads extends StatefulWidget {
//    final MovingDataModel? data;

//   const New_leads({super.key,required this.data});
//   @override
//   new_leadsScreenState createState() => new_leadsScreenState();
// }

// class new_leadsScreenState extends State<New_leads> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3, // Number of sections/screens
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: TabBar(
//             labelColor: Colors.red, // Active label color
//             unselectedLabelColor: Colors.grey, // Inactive label color
//             indicatorColor: Colors.red, // Active line color
//             indicatorWeight: 4.0, // Thickness of the active line
//             tabs: [
//               Tab(text: "items"), // Tab for first screen
//               Tab(text: "Flor Info"), // Tab for second screen
//               Tab(text: "Send Quote"), // Tab for third screen
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Items(widget.data), // Screen for section 1
//             FloorInfo(widget.data), // Screen for section 2
//             Text('Something went wronng.....!'), // Screen for section 3
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:boxigo/Models/models.dart';
import 'package:boxigo/Screens/floor_info.dart';
import 'package:boxigo/Screens/items.dart';
import 'package:flutter/material.dart';



class New_leads extends StatefulWidget {
   final MovingDataModel? data;

  const New_leads({super.key,required this.data});
  @override
  new_leadsScreenState createState() => new_leadsScreenState();
}

class new_leadsScreenState extends State<New_leads> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of sections/screens
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Leads'),
          actions: [
            IconButton(
              onPressed: () {
                // Action for notifications
              },
              icon: Icon(Icons.notifications_none_outlined),
            ),
            IconButton(
              onPressed: () {
                // Action for search
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Column(
          children: [
            // This is where you move the TabBar below the AppBar
            Container(
              color: Colors.white, // Background color for the TabBar section
              child: TabBar(
                labelColor: Colors.red, // Active label color
                unselectedLabelColor: Colors.grey, // Inactive label color
                indicatorColor: Colors.red, // Active line color
                indicatorWeight: 4.0, // Thickness of the active line
                tabs: [
                  Tab(text: "items"), // Tab for first screen
                  Tab(text: "Flor Info"), // Tab for second screen
                 Tab(text: "Send Quote"), // Tab for third screen  
                ]               
              ),
            ),

            // Expanded widget to hold the TabBarView content
            Expanded(
              child: TabBarView(
                children: [
                Items(widget.data), // Screen for section 1
                FloorInfo(widget.data), // Screen for section 2
                Text('Something went wronng.....!'), // Screen for section 3
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}