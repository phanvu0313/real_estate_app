import 'package:flutter/material.dart';

class ViewToggle extends StatelessWidget {
  const ViewToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFEAEAEA),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: const Row(
              children: [
                Icon(Icons.grid_view, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text('Grid View', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(width: 4),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.map_outlined, color: Colors.black, size: 18),
                SizedBox(width: 6),
                Text('Map View', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
