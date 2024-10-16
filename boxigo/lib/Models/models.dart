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
  List<Inventory>? inventory;

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
    this.inventory,
  });

  factory MovingDataModel.fromJson(Map<String, dynamic> json) {
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
      inventory: (json['items']['inventory'] as List<dynamic>?)
          ?.map((i) => Inventory.fromJson(i))
          .toList(),
    );
  }
}


class Inventory {
  String? id;
  String? displayName;
  List<Category>? category;

  Inventory({this.id, this.displayName, this.category});

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      id: json['id'],
      displayName: json['displayName'],
      category: (json['category'] as List<dynamic>?)
          ?.map((i) => Category.fromJson(i))
          .toList()?? [],
    );
  }
}

class Category {
  String? id;
  String? displayName;
  List<Item>? items;

  Category({this.id, this.displayName, this.items});

  factory Category.fromJson(Map<String, dynamic> json) {
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

  Item({this.name, this.displayName, this.qty});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      displayName: json['displayName'],
      qty: json['qty'],
    );
  }
}

