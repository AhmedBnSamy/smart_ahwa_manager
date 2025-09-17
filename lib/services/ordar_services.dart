// lib/services/order_service.dart
import 'package:flutter/material.dart';
import '../models/ordar.dart';

class OrderService extends ChangeNotifier {
  final List<Order> _orders = [];
  final List<String> _availableDrinks = [
    'Shai',
    'Turkish Coffee',
    'Hibiscus Tea',
    // Can extend with more drinks without modifying core logic (Open-Closed Principle)
  ];

  List<Order> get pendingOrders => _orders.where((order) => !order.isCompleted).toList();

  List<String> get availableDrinks => List.unmodifiable(_availableDrinks);

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  void completeOrder(Order order) {
    order.isCompleted = true;
    notifyListeners();
  }

  Map<String, dynamic> generateReport() {
    final completedOrders = _orders.where((order) => order.isCompleted).toList();
    final totalServed = completedOrders.length;

    final drinkCounts = <String, int>{};
    for (var order in completedOrders) {
      drinkCounts[order.drinkType] = (drinkCounts[order.drinkType] ?? 0) + 1;
    }

    final topSelling = drinkCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return {
      'totalServed': totalServed,
      'topSelling': topSelling.isNotEmpty ? topSelling.first.key : 'None',
    };
  }
}