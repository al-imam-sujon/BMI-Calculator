import 'package:flutter/material.dart';

class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({Key? key}) : super(key: key);

  @override
  _BMI_CalculatorState createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {


  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late double _result;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x7ae204f1),
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _heightController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Height in cm',
                prefixIcon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(
              height: 20,
            ),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  labelText: 'Weigth',
                  prefixIcon: Icon(Icons.line_weight),
                ),
              ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: calculatorBMI,
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              _result == null? "Enter value":"${_result.toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
  void calculatorBMI(){
    double height = double.parse(_heightController.text)/100;
    double weigth =double.parse(_weightController.text);

    double heightSqt = height*height;
    double result = weigth/heightSqt;
    _result = result;
    setState(() {

    });
  }
}
