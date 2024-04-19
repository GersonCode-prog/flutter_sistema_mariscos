import 'package:flutter/material.dart';
import 'sales_form.dart';
import 'inventory_item.dart'; 

class SalesPage extends StatelessWidget {
  final List<InventoryItem> inventoryItems;

  SalesPage({required this.inventoryItems}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🦐 Ventas 🦐',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.green,
      ),
      body: SalesForm(inventoryItems: inventoryItems), 
    );
  }
}
