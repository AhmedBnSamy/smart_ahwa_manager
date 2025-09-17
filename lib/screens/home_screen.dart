import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/screens/widgets/custom_button.dart';

import 'add_ordar_screen.dart';
import 'dashboard_screen.dart';
import 'report_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Smart Ahwa Manager',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigateButton(
              label: "Add Order",
              destination: AddOrderScreen(),
            ),
            SizedBox(height: 30),
            NavigateButton(
              label: "View Dashboard",
              destination: DashboardScreen(),
            ),
            SizedBox(height: 30),
            NavigateButton(
              label: "Generate Report",
              destination: ReportScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
