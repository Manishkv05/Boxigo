import 'package:flutter/material.dart';

IconData getItemIcon(String itemName) {
  switch (itemName.toLowerCase()) {
    case 'trolley bag':
    case 'suitcases':
    case 'luggage bag':
      return Icons.airport_shuttle; // Icon for bags
    case '1 seater sofa':
    case '2 seater sofa':
    case '3 seater sofa':
    case 'sofa cum bed':
    case 'sectional sofa':
    case 'sofa footrest':
    case 'ottoman':
    case 'bean bags':
      return Icons.weekend; // Icon for sofa
    case 'centre / coffee':
    case 'teapoy':
    case 'side table':
    case 'study table':
    case 'dining table':
    case 'plastic table':
    case 'drafting table':
    case 'serving trolley':
      return Icons.table_chart; // Table icon
    case 'king size cot':
    case 'queen size cot':
    case 'double cot':
    case 'single cot':
      return Icons.bed; // Bed icon
    case 'wooden wardrobe':
    case 'steel almirah':
    case 'plastic cupboard':
    case 'chest of drawers':
    case 'china cabinet':
      return Icons.storage; // Storage icon
    case 'tv cabinet':
    case 'shoe rack':
    case 'bookshelf':
      return Icons.book; // Book or shelf icon
    case 'microwave':
    case 'dishwasher':
    case 'cooking range':
      return Icons.kitchen; // Kitchen icon
    case 'window ac':
    case 'split ac':
    case 'ceiling fan':
    case 'table fan':
    case 'pedestal fan':
      return Icons.ac_unit; // AC icon
    case 'guitar':
    case 'drum set':
      return Icons.music_note; // Music icon
    case 'aquarium':
    case 'vase':
    case 'show pieces':
    case 'flower pots':
      return Icons.local_florist; // Flower icon
    case 'water purifier':
    case 'wet grinder':
      return Icons.local_drink; // Drink icon
    case 'printer / fax machine':
    case 'computer / office':
      return Icons.print; // Printer icon
    case 'exercise bike':
    case 'treadmill':
      return Icons.fitness_center; // Fitness icon
    case 'gas stove':
      return Icons.local_fire_department; // Fire icon for stove
    case 'sewing machines':
      return Icons.workspaces_outline; // Sewing icon
    case 'vacuum cleaner':
      return Icons.cleaning_services; // Cleaning icon
    case 'ladder':
      return Icons.view_column_outlined; // Ladder icon
    case 'car':
    case 'bike':
    case 'scooter':
      return Icons.directions_car; // Car icon
    case 'bathtub':
      return Icons.bathtub; // Bathtub icon
    // Add more cases as necessary...
    default:
      return Icons.help; // Default icon if no match found
  }
}
