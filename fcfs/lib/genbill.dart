import 'package:flutter/material.dart';

class genBill extends StatefulWidget {
  const genBill({super.key});

  @override
  State<genBill> createState() => _genBillState();
}

class _genBillState extends State<genBill> {

  final GlobalKey _parentKey = GlobalKey();
  int countItems = 0;
  TextEditingController textController = TextEditingController();
  List<TextEditingController>? _controllers = [];
  List<TextField> _fields = [];
  List<TextEditingController>? _controllers2 = [];
  
  List<String> arrivals = []; // arival
  List<String> burst = []; // burst
  List<int> finishTime = []; // finish
  List<int> turnAroundtime = [];
  List<int> waitingTime = []; // waiting time

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }
    List<int> arrivalsInt = [];
      List<int> burstInt = [];
      

  @override
  Widget build(BuildContext context) {
    print(arrivals);
    fcfsAlgo() {
      int temp;
      int processNum = int.parse(textController.text);
      for (int i = 0; i < arrivals.length; i++) {
        var arInt = int.parse(arrivals[i]);
        arrivalsInt.add(arInt);
      }
       for (int i = 0; i < burst.length; i++) {
        var arInt = int.parse(burst[i]);
        arrivalsInt.add(arInt);
      }
      for(int i=0; i<burstInt.length; i++){
        var varInt = int.parse(burst[i]);
        burstInt.add(varInt);
      }
      for (int i = 0; i < processNum; i++) {
        for (int j = i + 1; j < processNum; j++) {
          if (arrivalsInt[i] > arrivalsInt[j]) {
            temp = arrivalsInt[i];
            arrivalsInt[i] = arrivalsInt[j];
            arrivalsInt[j] = temp;

            temp = burstInt[i];
            burstInt[i] = burstInt[j];
            burstInt[j] = burstInt[i];
          }
        }
      }
      finishTime[0] = burstInt[0] + arrivalsInt[0];
      for(int i=0; i<processNum; i++){
        finishTime[i] = finishTime[i-1] + burstInt[i];
      }
      for(int i=0; i < processNum; i++){
        turnAroundtime[i] = finishTime[i] - arrivalsInt[i];
        waitingTime[i] = turnAroundtime[i] - burstInt[i];
      }
    }

    void showTextFields() {
      setState(() {
        countItems = int.parse(textController.text);
      });
    }

    return Scaffold(
      
      appBar: AppBar(
        title: Text("First Come First Serve"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                    labelText: 'Enter Arrival feild numbers'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: showTextFields,
                child: const Text('Press to show text field')),
            const SizedBox(
              height: 10,
            ),
            (countItems > 0)
                ? Flexible(
                    child: ListView.builder(
                        itemCount: countItems,
                        itemBuilder: (BuildContext context, int index) {
                          _controllers!.add(TextEditingController());
                          arrivals.add(_controllers.toString());
                          return TextField(
                            controller: _controllers![index],
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.white,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "TextField " + index.toString(),
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          );
                        }),
                  )
                : const SizedBox(),
                Padding(
              padding: const EdgeInsets.only(left: 20, right: 20.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                    labelText: 'Enter Burst feild numbers'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: showTextFields,
                child: const Text('Press to show text field')),
            const SizedBox(
              height: 10,
            ),
            (countItems > 0)
                ? Flexible(
                    child: ListView.builder(
                        itemCount: countItems,
                        itemBuilder: (BuildContext context, int index) {
                          _controllers2!.add(TextEditingController());
                          burst.add(_controllers2.toString());
                          return TextField(
                            controller: _controllers2![index],
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.white,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "TextField " + index.toString(),
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          );
                        }),
                  )
                : const SizedBox(),
                ElevatedButton(onPressed: (){
                //  Navigator.pushNamed(context, "/newScreen");
                  showDialog(
                    context: context,
                     builder: (context) => (
                       Scaffold(
                        body: Container(
                          
                          child: Column(
                            children: arrivals.map((arrivalsInt){
                              return Text(arrivalsInt);
                            }).toList(),
                          ),
                        width: double.infinity,
                        height: 400,
                        ),
                        
                      )
                     ),
                     );
                }, child: Text("Calculate")),
          ],
        ),
      ),
    );
  }
}
