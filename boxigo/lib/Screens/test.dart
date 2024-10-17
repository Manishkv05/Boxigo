import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date and Location Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Date
              Column(
                children: [
                  Text(
                    'Aug',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    '23',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '23:45',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              // Location and ID
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bangalore',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '1 MG-Lido Mall, Swami Vivekananda Road,\nSomeshwarpura, Halasuru, Bengaluru\nKarnataka',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              // Job ID
              Text(
                'E53552',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Property Info Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconTextWidget(icon: Icons.home, text: '2 BHK'),
              IconTextWidget(icon: Icons.inventory, text: '70 items'),
              IconTextWidget(icon: Icons.local_shipping, text: '20 boxes'),
              IconTextWidget(icon: Icons.route, text: '12.3 kms'),
            ],
          ),
          SizedBox(height: 16),
          // Location Repeated
          Text(
            'Bangalore',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '1 MG-Lido Mall, Swami Vivekananda Road,\nSomeshwarpura, Halasuru, Bengaluru\nKarnataka',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          // Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(iconColor: Colors.white),
                child: Text(
                  'View Details',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(iconColor:  Colors.red),
                child: Text(
                  'Submit Quote',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  IconTextWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.red),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}
