class Order {
  final String customerName;
  final String drinkType;
  final String specialInstructions;
  bool isCompleted;

  Order({
    required this.customerName,
    required this.drinkType,
    required this.specialInstructions,
    this.isCompleted = false,
  });
}