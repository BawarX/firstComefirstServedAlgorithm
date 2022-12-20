import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class doubleTest extends StatefulWidget {
  const doubleTest({super.key});

  @override
  State<doubleTest> createState() => _doubleTestState();
}

class _doubleTestState extends State<doubleTest> {

  final x = TextEditingController();
  final y = TextEditingController();

  int sum(){
    print('working?');
    int xInt = int.parse(x.text); 
    int yInt = int.parse(y.text); 
    int result =  xInt + yInt;
    print("$result is the final result");
    return result;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("double input check"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: x,
            ),
            TextField(
              controller: y,
            ),
            ElevatedButton(onPressed: (){
              sum();
            }, child: Text("press to calculate"))
          ],
        ),
      ),
    );
  }
}