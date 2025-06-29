import 'package:flutter/material.dart';
import 'package:kapruka_cal/widgets/custom_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _kaprukaCommissionController =
      TextEditingController();
  final TextEditingController _ourPriceController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();

  double _profit = 0.00;

// calculate profit based on the inputs
  void _calculateProfit() {
    if ((_formKey.currentState as FormState).validate()) {
      double commission =
          double.tryParse(_kaprukaCommissionController.text.trim()) ?? 0;
      double ourPrice = double.tryParse(_ourPriceController.text.trim()) ?? 0;
      double sellingPrice =
          double.tryParse(_sellingPriceController.text.trim()) ?? 0;

      double commissionAmount = sellingPrice * (commission / 100);
      double profit = sellingPrice - commissionAmount - ourPrice;

      setState(() {
        _profit = profit;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Column(
              children: [
                Image.asset(
                  "lib/assets/logo.png",
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff432A72),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Kapruka Commission Input
                          CustomInput(
                            controller: _kaprukaCommissionController,
                            labelText: "Kapruka Commission %",
                            hintText: "example: 19.23",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value';
                              }
                              if (double.tryParse(value.trim()) == null) {
                                return 'Enter a valid number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          // Our Price Input
                          CustomInput(
                            controller: _ourPriceController,
                            labelText: "Our Price (Rs.)",
                            hintText: "example: 3250",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value';
                              }
                              if (double.tryParse(value.trim()) == null) {
                                return 'Enter a valid number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          // Selling Price Input
                          CustomInput(
                            controller: _sellingPriceController,
                            labelText: "Selling Price (Rs.)",
                            hintText: "example: 5250",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a value';
                              }
                              if (double.tryParse(value.trim()) == null) {
                                return 'Enter a valid number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          // Calculate Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffffffff),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: _calculateProfit,
                            child: const Text(
                              "Calculate",
                              style: TextStyle(
                                color: Color(0xff432A72),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Profit Display
                          Text(
                            "PROFIT : Rs. ${_profit.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
