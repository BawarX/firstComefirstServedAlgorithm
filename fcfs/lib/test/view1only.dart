import 'package:flutter/material.dart';

class View11 extends StatefulWidget {
  @override
  _View1State createState() => _View1State();
}
class _View1State extends State<View11> {
   int avgWaiting = 0;
     int avgTurnTime = 0;
   
  List<TextEditingController> TextControl1 = [];
  List<TextField> _fields1 = [];

  List<TextEditingController> TextControl2 = [];
  List<TextField> _fields2 = [];

  List<String> arrivals = []; // arival
  List<String> burst = []; // burst
  List<int> finishTime = []; // finish
  List<int> turnAroundtime = [];
  List<int> waitingTime = []; // waiting time
   List<int> arrivalsInt = [];
   List<int> burstInt = [];
   List<TextEditingController> arrivalsIntTEXT = [];
   List<TextEditingController> burstIntTEXT = [];


 
  
  @override
  void dispose() {
    for (final controller in TextControl1) {
      controller.dispose();
    }
    for (final controller in TextControl2) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
     TextEditingController  controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Dynamic  Field"),
          ),
          body: Column(
            children: [
              _addTile(),
              Expanded(child: _listView()),

              _addTile1(),
              Expanded(child: _listView1()),

              _okButton(),
            ],
          )),
    );
   
  }
  

  Widget _addTile() {
   late TextEditingController controller = TextEditingController() ;
    return ListTile(
      title: Icon(Icons.add),
      onTap: () {
        final field = TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Arrival ${TextControl1.length + 1}",
          ),
        
        );
  	   
        setState(() {
          
         arrivals.add(controller.text);
          TextControl1.add(controller);
          _fields1.add(field);
        });
      //  arrivalsInt.add(int.parse(controller.text));
      },
      
    );
  }

  Widget _listView() {
    return ListView.builder(
      itemCount: _fields1.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: _fields1[index],
        );
      },
    );
  }
// ***********************************************************************
  Widget _addTile1() {
    return ListTile(
      title: Icon(Icons.add),
      onTap: () {
        final controller2 = TextEditingController();
        final field2 = TextField(
          controller: controller2,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Burst ${TextControl2.length + 1}",
          ),
        );

        setState(() {
          burst.add(controller2.text);
          TextControl2.add(controller2);
          _fields2.add(field2);
        });
      },
    );
  }

  Widget _listView1() {
    return ListView.builder(
      itemCount: _fields2.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: _fields2[index],
        );
      },
    );
  }
// print the array in here
  Widget _okButton() {
    return ElevatedButton(
      onPressed: () async {
         fcfs();
        String text = arrivalsInt.toString();
        //String WAIT = avgWaiting.toString();
        print("hellllllllo what is this? $text");
            // .where((element) => element != "")
            // .fold("", (acc, element) => acc += "${element}\n");
        final alert = AlertDialog(
          title: Text("Arrival: ${TextControl1.length}"),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
        await showDialog(
          context: context,
          builder: (BuildContext context) => alert,
        );
        setState(() {

        });
        print("this is arrival list $TextControl1");
        //fcfs();
      },
      child: Text("Cacluate"),
      
    );  
  }
  
  void fcfs() {
    print("keshaka leray ??");
      int temp;
     
      for(int i=0; i<TextControl1.length; i++){
           var arInt1 = int.parse(TextControl1[i].text);
        arrivalsInt.add(arInt1);
      }
      // arrivalsInt = TextControl1.map((e) =>
      //   int.parse(e.text)
      // ).toList();
      //print(arrivalsInt);
      for (int i = 0; i < TextControl2.length; i++) {
        var arInt2 = int.parse(TextControl2[i].text);
        burstInt.add(arInt2);
      }
      //arrivalsInt.sort();
     for(int i=0; i<TextControl1.length;i++){
      for(int j=i+1; j<TextControl1.length;j++){
        if(arrivalsInt[i] > arrivalsInt[j]){
              temp = arrivalsInt[i];
              arrivalsInt[i] = arrivalsInt[j];
              arrivalsInt[j] = temp;
             // arrivals[i] = temp.toString();
              temp = burstInt[i];
              burstInt[i] = burstInt[j];
              burstInt[j] = burstInt[i];
             // TextControl2[i].text = temp.toString();
        }
      }
     }   
     print("kesha leraya 1");
     for(int i=0; i<TextControl1.length; i++){
      
      if(i==0){
        finishTime[i] = arrivalsInt[i] + burstInt[i];
      }else{
        if(arrivalsInt[i] > finishTime[i-1]){
          finishTime[i] = arrivalsInt[i] + burstInt[i];
        }else{
          finishTime[i] = finishTime[i-1] + burstInt[i];
        }
      }
     }
     
     print("kesha leraya 2");
     
    //  for(int i=0; i<TextControl1.length; i++){
    //   turnAroundtime[i] = finishTime[i] -arrivalsInt[i];
    //   waitingTime[i] = turnAroundtime[i] - burstInt[i];
    //     avgWaiting = avgTurnTime + turnAroundtime[i];
    //     avgTurnTime = avgTurnTime + turnAroundtime[i];
    //  }
     
     print("kesha leraya 3");
    //   avgWaiting = (avgWaiting/TextControl1.length) as int;
    //  avgTurnTime = (avgTurnTime/TextControl1.length) as int;
    
     
    }
}