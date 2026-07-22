import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {

TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();

double bmi = 0;
String result = "";


void calculateBMI() {

if (heightController.text.isEmpty ||
weightController.text.isEmpty) {

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Please enter height and weight"),
),
);

return;
}


double height = double.parse(heightController.text) / 100;
double weight = double.parse(weightController.text);

setState(() {

bmi = weight / (height * height);

if (bmi < 18.5) {
result = "Underweight";
}
else if (bmi >= 18.5 && bmi < 25) {
result = "Normal Weight";
}
else if (bmi >= 25 && bmi < 30) {
result = "Overweight";
}
else {
result = "Obese";
}

});
}


void resetBMI() {

setState(() {
heightController.clear();
weightController.clear();
bmi = 0;
result = "";
});

}


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("BMI Calculator"),
centerTitle: true,
),

body: Padding(
padding: const EdgeInsets.all(20),

child: Column(
children: [            TextField(
  controller: heightController,
  keyboardType: TextInputType.number,
  decoration: const InputDecoration(
    labelText: "Enter Height (cm)",
    border: OutlineInputBorder(),
  ),
),

  const SizedBox(height: 20),


  TextField(
    controller: weightController,
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      labelText: "Enter Weight (kg)",
      border: OutlineInputBorder(),
    ),
  ),


  const SizedBox(height: 30),


  ElevatedButton(
    onPressed: calculateBMI,
    child: const Text("Calculate BMI"),
  ),


  const SizedBox(height: 15),


  OutlinedButton(
    onPressed: resetBMI,
    child: const Text("Reset"),
  ),


  const SizedBox(height: 30),


  Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),

    decoration: BoxDecoration(
      color: Colors.blue.shade100,
      borderRadius: BorderRadius.circular(20),
    ),

    child: Column(
      children: [

        const Text(
          "Your BMI",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),


        const SizedBox(height: 10),


        Text(
          bmi == 0 ? "0" : bmi.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),


        const SizedBox(height: 10),


        Text(
          result,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),

      ],
    ),
  ),

],
),
),
);
}
}