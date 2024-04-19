import 'package:flutter/material.dart';
import 'inventory_item.dart'; 

class SalesForm extends StatefulWidget {
  final List<InventoryItem> inventoryItems;

  SalesForm({required this.inventoryItems});

  @override
  _SalesFormState createState() => _SalesFormState();
}

class _SalesFormState extends State<SalesForm> {
  final _formKey = GlobalKey<FormState>();
  InventoryItem? _selectedItem;
  int _quantitySold = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField<InventoryItem>(
              value: _selectedItem,
              items: widget.inventoryItems.map((item) {
                return DropdownMenuItem<InventoryItem>(
                  value: item,
                  child: Text(item.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
              decoration: InputDecoration(labelText: 'Producto'),
              validator: (value) {
                if (value == null) {
                  return 'Por favor selecciona un producto';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            if (_selectedItem != null)
              Text('Cantidad Disponible: ${_selectedItem!.quantity}'),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Cantidad Vendida'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa la cantidad vendida';
                }
                return null;
              },
              onSaved: (value) {
                _quantitySold = int.parse(value!);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
               
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Nueva Venta Registrada'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Producto: ${_selectedItem!.name}'),
                            Text('Precio del Producto: $_quantitySold'),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, 
              ),
              child: Text(
                'Registrar Venta',
                style: TextStyle(color: Colors.white), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
