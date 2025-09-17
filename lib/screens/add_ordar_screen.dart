// lib/screens/add_order_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ordar.dart';
import '../services/ordar_services.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  _AddOrderScreenState createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _customerNameController = TextEditingController();
  final _specialInstructionsController = TextEditingController();
  String? _selectedDrink;

  @override
  Widget build(BuildContext context) {
    final orderService = Provider.of<OrderService>(context);
    final availableDrinks = orderService.availableDrinks;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Add Order',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _customerNameController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Customer Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedDrink,
              hint: const Text('Select Drink'),
              decoration: InputDecoration(
                labelText: 'Drink Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              menuMaxHeight: 250,
              items: availableDrinks.map((drink) {
                return DropdownMenuItem<String>(
                  value: drink,
                  child: Row(
                    children: [
                      const Icon(Icons.local_cafe, color: Colors.brown),
                      const SizedBox(width: 10),
                      Text(drink, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDrink = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _specialInstructionsController,
              decoration: InputDecoration(
                labelText: 'Special Instructions',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (_customerNameController.text.isNotEmpty &&
                    _selectedDrink != null) {
                  final order = Order(
                    customerName: _customerNameController.text,
                    drinkType: _selectedDrink!,
                    specialInstructions: _specialInstructionsController.text,
                  );
                  orderService.addOrder(order);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Submit Order',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
