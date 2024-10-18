// import 'package:boxigo/Models/models.dart';
// import 'package:flutter/material.dart';

// class InventoryDropdown extends StatefulWidget {
//   final Inventory inventory;

//   InventoryDropdown( {required this.inventory, });

//   @override
//   _InventoryDropdownState createState() => _InventoryDropdownState();
// }

// class _InventoryDropdownState extends State<InventoryDropdown> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           // ExpansionTile for displaying Inventory and its items
//           ExpansionTile(
//             title: Text(widget.inventory.displayName ?? "Unknown Inventory"),
//             onExpansionChanged: (bool expanded) {
//               setState(() {
//                 isExpanded = expanded;
//               });
//             },
//             children: [
//               ListView.builder(
//                 shrinkWrap: true, // Ensures ListView takes only necessary space
//                 itemCount: widget.inventory.category?.length ?? 0,
//                 itemBuilder: (context, index) {
//                   final category = widget.inventory.category![index];
//                   return ExpansionTile(
//                     title: Text(category.displayName ?? "Unknown Category"),
//                     children: _buildItems(category.items),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper function to build a list of Items from a Category
//   List<Widget> _buildItems(List<Item>? items) {
//     if (items == null || items.isEmpty) {
//       return [Text("No items available")];
//     }

//     return items.map((item) {
//       return ListTile(
//         title: Text(item.displayName ?? "Unknown Item"),
//         subtitle: Text("Quantity: ${item.qty?.toString() ?? 'N/A'}"),
//       );
//     }).toList();
//   }
// }

// import 'package:boxigo/Models/models.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class InventoryDropdown extends StatefulWidget {
//   final Inventory inventory;

//   InventoryDropdown({required this.inventory});

//   @override
//   _InventoryDropdownState createState() => _InventoryDropdownState();
// }

// class _InventoryDropdownState extends State<InventoryDropdown> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           // ExpansionTile for displaying Inventory and its items
//           ExpansionTile(
//             title: Text(widget.inventory.displayName ?? "Unknown Inventory"),
//             onExpansionChanged: (bool expanded) {
//               setState(() {
//                 isExpanded = expanded;
//               });
//             },
//             children: _buildFilteredItems(),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper function to filter and build a list of Items directly (skipping category display)
//   List<Widget> _buildFilteredItems() {
//     List<Widget> itemWidgets = [];

//     // Iterate through categories and filter out items with qty > 0
//     if (widget.inventory.category != null) {
//       for (var category in widget.inventory.category!) {
//         for (var item in category.items ?? []) {
//           if (item.qty != null && item.qty! > 0) {
//             // Add the filtered items directly without showing category names
//             itemWidgets.add(
//               ListTile(
//                 title: Text(item.displayName ?? "Unknown Item"),
//                 subtitle: Column(
//                   children: [
//                     Text("Quantity: ${item.qty}"),
//                     Text("size: ${item.size}"),
//                      Text("size: ${item.selectedTypes}")
//                   ],
//                 ),
                
//               ),
//             );
//           }
//         }
//       }
//     }

//     // If no items have qty > 0, display a message
//     if (itemWidgets.isEmpty) {
//       return [Text("No items.....")];
//     }

//     return itemWidgets;
//   }
// }import 'package:flutter/material.dart';

import 'package:boxigo/Models/models.dart';
import 'package:boxigo/utilities/icons_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boxigo/Models/models.dart';

class InventoryDropdown extends StatefulWidget {
  final Inventory inventory;
  

  InventoryDropdown({required this.inventory,});

  @override
  _InventoryDropdownState createState() => _InventoryDropdownState();
}

class _InventoryDropdownState extends State<InventoryDropdown> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
        
          // ExpansionTile for displaying Inventory and its items
           Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              child: ExpansionTile(
               collapsedBackgroundColor:Colors.grey.shade300,
               backgroundColor: Colors.grey.shade300,
                title:  Container(
                //color: Colors.grey.shade300, // Background for the title
                padding: EdgeInsets.only(top: 10, bottom: 10,left: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Text(
                              widget.inventory.displayName ?? "Unknown Inventory",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                tilePadding: EdgeInsets.only(right: 16),
              //      trailing: Container(
              //  // padding: EdgeInsets.all(4),
              //   decoration: BoxDecoration(
              //     color: Colors.grey.shade300, // Background color for the icon
              //     //shape: BoxShape.circle, // To make the background circular
              //   ),
              //   child: Icon(
              //     isExpanded ? Icons.expand_less : Icons.expand_more,
              //     color: Colors.red, // Customize the color of the icon
              //   ),
              // ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    isExpanded = expanded;
                  });
                },
                children: _buildFilteredItems(),
              ),
            ),
          ),
          
            
        ],
      ),
    );
  }
// Widget _buildcustomItems(){
// if(widget.data!.coucustomItems.)
// }
  // Helper function to filter and build a list of Items directly (skipping category display)
  List<Widget> _buildFilteredItems() {
    List<Widget> itemWidgets = [];

    // Iterate through categories and filter out items with qty > 0
    if (widget.inventory.category != null) {
      for (var category in widget.inventory.category!) {
        for (var item in category.items ?? []) {
          if (item.qty != null && item.qty! > 0) {
            // Add the filtered items directly without showing category names
            itemWidgets.add(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon or item representation
                    Icon(getItemIcon(item.displayName), size: 24), // Replace with appropriate icons

                    SizedBox(width: 16), // Space between icon and text

                    // Item details column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.displayName ?? "Unknown Item",
                            style: TextStyle(
                              fontSize: 16,
                             // fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              // Text(
                              //   " ${item.qty}",
                              //   style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                              // ),
                                if (item.size != null &&item.size != "NULL")
                            Text(
                              " ${item.size}",
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                            ),
                             if (item.selectedTypes != null && item.selectedTypes!.isNotEmpty&&item.selectedTypes!="null")
                              if (item.size != null &&item.size != "NULL")
                             Text("|",style: TextStyle(fontWeight: FontWeight.bold),),
                             if (item.selectedTypes != null && item.selectedTypes!.isNotEmpty&&item.selectedTypes!="null")
                            Text(
                              " ${item.selectedTypes}",
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold ),
                            ),
                            ],
                          ),
                        
                          // If item.selectedTypes contains data
                         
                        ],
                      ),
                    ),
                    // Quantity aligned on the right
                    Text(
                      "${item.qty}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      }
    }

    // If no items have qty > 0, display a message
    if (itemWidgets.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "No items available",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ];
    }

    return itemWidgets;
  }
}
