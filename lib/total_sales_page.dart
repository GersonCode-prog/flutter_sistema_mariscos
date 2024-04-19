import 'package:flutter/material.dart';

class TotalSalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total de Ventas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total de Ventas:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\100 Ventas', // Aquí muestra el total de ventas
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Total de Ganancias:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\Q3000', // Aquí muestra el total de ganancias
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
