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
import 'package:boxigo/Models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InventoryDropdown extends StatefulWidget {
  final Inventory inventory;

  InventoryDropdown({required this.inventory});

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
          ExpansionTile(
            title: Text(widget.inventory.displayName ?? "Unknown Inventory"),
            onExpansionChanged: (bool expanded) {
              setState(() {
                isExpanded = expanded;
              });
            },
            children: _buildFilteredItems(),
          ),
        ],
      ),
    );
  }

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
              ListTile(
                title: Text(item.displayName ?? "Unknown Item"),
                subtitle: Column(
                  children: [
                    Text("Quantity: ${item.qty}"),
                    Text("size: ${item.size}"),
                     Text("size: ${item.selectedTypes}")
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
      return [Text("No items.....")];
    }

    return itemWidgets;
  }
}