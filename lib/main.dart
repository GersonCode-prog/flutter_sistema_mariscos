import 'package:flutter/material.dart';
import 'package:flutter_application_1/sales.dart';
import 'inventory_page.dart';
import 'sales_page.dart';
import 'total_sales_page.dart'; 
import 'inventory_item.dart'; 


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Sale> sales = [
    Sale(productName: 'Producto 1', quantity: 5, totalPrice: 100.0),
    Sale(productName: 'Producto 2', quantity: 3, totalPrice: 75.0),
   
  ];

  @override
  Widget build(BuildContext context) {
    
    List<InventoryItem> inventoryItems = [
      InventoryItem(name: 'Producto 1', quantity: 10),
      InventoryItem(name: 'Producto 2', quantity: 15),
      
    ];

    return MaterialApp(
      title: '🦐 Control de Inventarios 🦐',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(inventoryItems: inventoryItems, sales: sales),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<InventoryItem> inventoryItems;
  final List<Sale> sales;

  MyHomePage({required this.inventoryItems, required this.sales});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🦐 Control de Inventarios 🦐',
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Inventario'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryPage()),
                );
              },
            ),
            ListTile(
              title: Text('Ventas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalesPage(inventoryItems: inventoryItems)), 
                );
              },
            ),
            ListTile(
              title: Text('Total de Ventas'),
              onTap: () {
                Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => TotalSalesPage()),
);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bienvenidos'),
      ),
    );
  }
}
