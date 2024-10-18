import 'package:flutter/material.dart';
import 'package:boxigo/Models/models.dart';
import 'package:boxigo/Screens/itemslist.dart';
import 'package:flutter/widgets.dart';

class Items extends StatefulWidget {
  final MovingDataModel? data;

  Items(this.data, {super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      if (widget.data != null) {
        for (var i in widget.data!.inventory ?? []) {
          print(i.id);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView(
        children: [
        
          if (widget.data?.inventory != null)
            ...widget.data!.inventory!.map((inventoryItem) {
              return InventoryDropdown(inventory: inventoryItem);
            }).toList(),

        
          if (widget.data?.customItems?.items != null &&
              widget.data!.customItems!.items!.isNotEmpty)
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                child: ExpansionTile(
                  childrenPadding:EdgeInsets.only(left: 10),
                  collapsedBackgroundColor: Colors.grey.shade300,
                  backgroundColor: Colors.grey.shade300,
                  title: Container(
                    child: Padding(
                       padding: EdgeInsets.only(top: 10, bottom: 10,left: 10),
                      child: Text(
                        widget.data!.customItems!.items![0].itemName ?? "Unknown Item",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                          "Description: ${widget.data!.customItems!.items![0].itemDescription ?? 'N/A'}"),
                    ),
                    ListTile(
                      title: Text(
                          "Quantity: ${widget.data!.customItems!.items![0].itemQty ?? 'N/A'}"),
                    ),
                    ListTile(
                      title: Text(
                        "L: ${widget.data!.customItems!.items![0].itemLength ?? 'N/A'} ${formatUnit(widget.data!.customItems!.units.toString())}    W: ${widget.data!.customItems!.items![0].itemWidth ?? 'N/A'} ${formatUnit(widget.data!.customItems!.units.toString())}   H: ${widget.data!.customItems!.items![0].itemHeight ?? 'N/A'} ${formatUnit(widget.data!.customItems!.units.toString())} ",
                     style: TextStyle(fontWeight: FontWeight.bold), ),
                    ),
                  ],
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "No custom items available",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
  String formatUnit(String unit) {
  if (unit.length > 2) {
    return "${unit[0]}${unit[unit.length - 1]}"; // First and last characters
  }
  return unit; // Return as is if unit is 2 characters or less
}
}

//    itemscard(Inventory){

//     return Center(child: Container( child: ExpansionTile(
//           title: Text(Inventory.displayName ?? "Unknown Inventory"),
//           children: _buildItems(Inventory.category),
//         ),));
//   }
//    // Helper function to build a list of Items from Inventory
//   List<Widget> _buildItems(List<Category>? categories) {
//     if (categories == null || categories.isEmpty) {
//       return [Text("No categories available")];
//     }

//     // Build a list of items from each category and ensure it is a List<Widget>
//     return categories.expand((category) {
//       return category.items?.map<Widget>((item) {
//         return ListTile(
//           title: Text(item.displayName ?? "Unknown Item"),
//           subtitle: Text("Quantity: ${item.qty?.toString() ?? 'N/A'}"),
//         );
//       }).toList() ?? [];
//     }).toList(); // Convert expanded result to List<Widget>
//   }

// }



// class InventoryDropdown extends StatelessWidget {
//   final Inventory inventory; // The inventory object

//   InventoryDropdown({required this.inventory});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: ExpansionTile(
//           title: Text(inventory.displayName ?? "Unknown Inventory"),
//           children: _buildItems(inventory.category),
//         ),
//       ),
//     );
//   }

//   // Helper function to build a list of Items from Inventory
//   List<Widget> _buildItems(List<Category>? categories) {
//     if (categories == null || categories.isEmpty) {
//       return [Text("No categories available")];
//     }

//     // Build a list of items from each category
//     return categories.expand((category) {
//       return category.items?.map((item) {
//         return ListTile(
//           title: Text(item.displayName ?? "Unknown Item"),
//           subtitle: Text("Quantity: ${item.qty?.toString() ?? 'N/A'}"),
//         );
//       }).toList() ?? [];
//     }).toList();
//   }
// }

