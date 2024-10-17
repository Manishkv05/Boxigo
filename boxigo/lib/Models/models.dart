import 'dart:async';
import 'dart:convert';

class MovingDataList {
  List<MovingDataModel>? estimates;

  MovingDataList({this.estimates});

  factory MovingDataList.fromJson(Map<String, dynamic> json) {
    // Check for the specific key in the JSON
    if (json['Customer_Estimate_Flow'] != null) {
      return MovingDataList(
        estimates: (json['Customer_Estimate_Flow'] as List<dynamic>)
            .map((e) => MovingDataModel.fromJson(e))
            .toList(),
      );
    }
    return MovingDataList(estimates: []); // Return an empty list if null
  }
}

class MovingDataModel {
  String? estimateId;
  String? userId;
  String? movingFrom;
  String? movingTo;
  String? movingOn;
  String? distance;
  String? propertySize;
  String? oldFloorNo;
  String? newFloorNo;
  String? oldElevatorAvailability;
  String? newElevatorAvailability;
  String? oldParkingDistance;
  String? newParkingDistance;
  String? unpackingService;
  String? packingService;
  String? old_house_additional_info;
  String? new_house_additional_info;
  List<Inventory>? inventory;
  String? fromCity;
  String? tocity;
  String? total_items;
    CustomItems? customItems;


  MovingDataModel({
    this.estimateId,
    this.userId,
    this.movingFrom,
    this.movingTo,
    this.movingOn,
    this.distance,
    this.propertySize,
    this.oldFloorNo,
    this.newFloorNo,
    this.oldElevatorAvailability,
    this.newElevatorAvailability,
    this.oldParkingDistance,
    this.newParkingDistance,
    this.unpackingService,
    this.packingService,
    this.new_house_additional_info,
    this.old_house_additional_info,
    this.inventory,
    this.fromCity,
    this.tocity,
    this.total_items,
    this.customItems,
    
  });

  factory MovingDataModel.fromJson(Map<String, dynamic> json) {
   print(json['items']['customItems'].toString());
    return MovingDataModel(
      estimateId: json['estimate_id'],
      userId: json['user_id'],
      movingFrom: json['moving_from'],
      movingTo: json['moving_to'],
      movingOn: json['moving_on'],
      distance: json['distance'],
      propertySize: json['property_size'],
      oldFloorNo: json['old_floor_no'],
      newFloorNo: json['new_floor_no'],
      oldElevatorAvailability: json['old_elevator_availability'],
      newElevatorAvailability: json['new_elevator_availability'],
      oldParkingDistance: json['old_parking_distance'],
      newParkingDistance: json['new_parking_distance'],
      unpackingService: json['unpacking_service'],
      packingService: json['packing_service'],
      
      new_house_additional_info: json['new_house_additional_info'],
      old_house_additional_info: json['old_house_additional_info'],
      inventory: (json['items']['inventory'] as List<dynamic>?)
          ?.map((i) => Inventory.fromJson(i))
          .toList(),
          
         fromCity:json['from_address']['fromCity'],
          tocity:json['to_address']['toCity'],
          total_items:json['total_items'],
             customItems: json['items']['customItems'] != null 
          ? CustomItems.fromJson(json['items']['customItems']) // Access customItems as a map
          : null, // Check for customItems// Correctly parse CustomItems
           // Check for customItems
    );
  }
}
class CustomItems {
  String? units;
  List<CustomItem>? items;

  CustomItems({this.units, this.items});

  factory CustomItems.fromJson(Map<String, dynamic> json) {
    return CustomItems(
      units: json['units'],
      items: (json['items'] as List<dynamic>?)?.map((item) => CustomItem.fromJson(item)).toList(),
    );
  }
}

// Model for individual custom items
class CustomItem {
  String? id;
  String? itemHeight;
  String? itemLength;
  String? itemQty;
  String? itemWidth;
  String? itemDescription;
  String? itemName;

  CustomItem({
    this.id,
    this.itemHeight,
    this.itemLength,
    this.itemQty,
    this.itemWidth,
    this.itemDescription,
    this.itemName,
  });

  factory CustomItem.fromJson(Map<String, dynamic> json) {
    return CustomItem(
      id: json['id'],
      itemHeight: json['item_height'],
      itemLength: json['item_length'],
      itemQty: json['item_qty'],
      itemWidth: json['item_width'],
      itemDescription: json['item_description'],
      itemName: json['item_name'],
    );
  }
}


class Inventory {
  String? id;
  String? displayName;
  List<Category>? category;

  Inventory({this.id, this.displayName, this.category});

  factory Inventory.fromJson(Map<String, dynamic> json) {
    print(json['id'].toString());
   try{

    return Inventory(
      id: json['id'],
      displayName: json['displayName'],
      category: (json['category'] as List<dynamic>?)
          ?.map((i) => Category.fromJson(i))
          .toList()?? [],
    );
   
    } catch (e) {
    print('Error parsing Inventory: $e');
    return Inventory();
  }
  }
}

class Category {
 
  String? id;
  String? displayName;
  List<Item>? items;

  Category({this.id, this.displayName, this.items});

  factory Category.fromJson(Map<String, dynamic> json) {
     //print(json['items'].toString());
    return Category(
      id: json['id'],
      displayName: json['displayName'],
      items: (json['items'] as List<dynamic>?)
          ?.map((i) => Item.fromJson(i))
          .toList(),
    );
  }
}

class Item {
  String? name;
  String? displayName;
  int? qty;
  String? size;
  String? selectedTypes;
  Meta? meta;

  Item({this.name, this.displayName, this.qty, this.selectedTypes, this.meta,this.size});
  

  factory Item.fromJson(Map<String, dynamic> json) {
    String? sizeValue;
    String? type;
    if ( json['size'] != null&&json['size'] !=[]) {
      sizeValue = (json['size'] as List<dynamic>?)
        ?.firstWhere((element) => element['selected'] == true, orElse: () => null)?['option']; // Convert any type to string
    } else {
      sizeValue = "NULL"; // Default value if null or missing
    }
    if ( json['type'] != null&&json['type'] !=[]) {
      type = (json['type'] as List<dynamic>?)
        ?.firstWhere((element) => element['selected'] == true, orElse: () => null)?['option']; // Convert any type to string
    } else {
      type = "NULL"; // Default value if null or missing
    }
   print(json['size'].toString());
    return Item(
      name: json['name'],
      displayName: json['displayName'],
      qty: json['qty'],
      selectedTypes:type,

      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
     size: sizeValue,
    );
  }
}

// class TypeOption {
//   String? id;
//   String? option;
//   bool selected;

//   TypeOption({this.id, this.option, required this.selected});

//   factory TypeOption.fromJson(Map<String, dynamic> json) {
//     return TypeOption(
//       id: json['id'],
//       option: json['option'],
//       selected: json['selected'] ?? false,
//     );
//   }
// }

class Meta {
  bool? hasType;
  String? selectType;
  bool? hasVariation;
  bool? hasSize;

  Meta({this.hasType, this.selectType, this.hasVariation, this.hasSize});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      hasType: json['hasType'],
      selectType: json['selectType'],
      hasVariation: json['hasVariation'],
      hasSize: json['hasSize'],
    );
  }
}

// class MovingDataList {
//   List<MovingDataModel>? estimates;

//   MovingDataList({this.estimates});

//   factory MovingDataList.fromJson(Map<String, dynamic> json) {
//     // Check for the specific key in the JSON
//     if (json['Customer_Estimate_Flow'] != null) {
//       return MovingDataList(
//         estimates: (json['Customer_Estimate_Flow'] as List<dynamic>)
//             .map((e) => MovingDataModel.fromJson(e))
//             .toList(),
//       );
//     }
//     return MovingDataList(estimates: []); // Return an empty list if null
//   }
// }

// class MovingDataModel {
//   String? estimateId;
//   String? userId;
//   String? movingFrom;
//   String? movingTo;
//   String? movingOn;
//   String? distance;
//   String? propertySize;
//   String? oldFloorNo;
//   String? newFloorNo;
//   String? oldElevatorAvailability;
//   String? newElevatorAvailability;
//   String? oldParkingDistance;
//   String? newParkingDistance;
//   String? unpackingService;
//   String? packingService;
//   List<Inventory>? inventory;

//   MovingDataModel({
//     this.estimateId,
//     this.userId,
//     this.movingFrom,
//     this.movingTo,
//     this.movingOn,
//     this.distance,
//     this.propertySize,
//     this.oldFloorNo,
//     this.newFloorNo,
//     this.oldElevatorAvailability,
//     this.newElevatorAvailability,
//     this.oldParkingDistance,
//     this.newParkingDistance,
//     this.unpackingService,
//     this.packingService,
//     this.inventory,
//   });

//   factory MovingDataModel.fromJson(Map<String, dynamic> json) {
//     return MovingDataModel(
//       estimateId: json['estimate_id'],
//       userId: json['user_id'],
//       movingFrom: json['moving_from'],
//       movingTo: json['moving_to'],
//       movingOn: json['moving_on'],
//       distance: json['distance'],
//       propertySize: json['property_size'],
//       oldFloorNo: json['old_floor_no'],
//       newFloorNo: json['new_floor_no'],
//       oldElevatorAvailability: json['old_elevator_availability'],
//       newElevatorAvailability: json['new_elevator_availability'],
//       oldParkingDistance: json['old_parking_distance'],
//       newParkingDistance: json['new_parking_distance'],
//       unpackingService: json['unpacking_service'],
//       packingService: json['packing_service'],
//       inventory: (json['items']['inventory'] as List<dynamic>?)
//           ?.map((i) => Inventory.fromJson(i))
//           .toList(),
//     );
//   }
// }


// class Inventory {
//   String? id;
//   String? displayName;
//   List<Category>? category;

//   Inventory({this.id, this.displayName, this.category});

//   factory Inventory.fromJson(Map<String, dynamic> json) {
//     return Inventory(
//       id: json['id'],
//       displayName: json['displayName'],
//       category: (json['category'] as List<dynamic>?)
//           ?.map((i) => Category.fromJson(i))
//           .toList()?? [],
//     );
//   }
// }

// class Category {
//   String? id;
//   String? displayName;
//   List<Item>? items;

//   Category({this.id, this.displayName, this.items});

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json['id'],
//       displayName: json['displayName'],
//       items: (json['items'] as List<dynamic>?)
//           ?.map((i) => Item.fromJson(i))
//           .toList(),
//     );
//   }
// }

// class Item {
//   String? name;
//   String? displayName;
//   int? qty;

//   Item({this.name, this.displayName, this.qty});

//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       name: json['name'],
//       displayName: json['displayName'],
//       qty: json['qty'],
//     );
//   }
// }