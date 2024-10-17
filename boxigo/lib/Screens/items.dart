import 'package:boxigo/Models/models.dart';
import 'package:boxigo/Screens/itemslist.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
    MovingDataModel? data;
   Items( this.data, { super.key});
   
  
 


  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  void initState() {
    
    super.initState();
          if (widget.data != null) {
    // if (widget.data!.customItems != null) {
    //   print('Custom Items:');
    //   // Text(widget.data.customItems!.units.toString),
    //    print('Units: ${widget.data!.customItems!.units}');
    //   for (var item in widget.data!.customItems!.items ?? []) {
    //     print(' - Item ID: ${item.id}');
    //     print('   Name: ${item.itemName}');
    //     print('   Description: ${item.itemDescription}');
    //     print('   Height: ${item.itemHeight}');
    //     print('   Length: ${item.itemLength}');
    //     print('   Width: ${item.itemWidth}');
    //     print('   Quantity: ${item.itemQty}');
    //   }
    // }
    if(widget.data!=null){
      for(var i in widget.data!.inventory??[]){
     print(i.id);
      }
    }
   // print(widget.data!.inventory.toString());
        }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        child:ListView.builder(
        itemCount: widget.data!.inventory!.length,
        itemBuilder:(context, index){ 
  return InventoryDropdown( inventory : widget.data!.inventory![index], );
         
       // Text( widget.data!.inventory![index].id.toString());
        }
        )
        
      ),
    );
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

