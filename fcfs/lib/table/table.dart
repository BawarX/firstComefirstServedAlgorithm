import 'package:flutter/material.dart';

class DataTables extends StatefulWidget {
  const DataTables({super.key});

  @override
  State<DataTables> createState() => _DataTablesState();
}

class _DataTablesState extends State<DataTables> {
  final String routName = 'Datatable';
  int process1 = 1;
  int process2 = 2;
  int process3 = 3;
  int process4 = 4;

late int  avgWaiting=0;
late int avgTurnTime=0;
final arrival1= TextEditingController();
final arrival2= TextEditingController();
final arrival3= TextEditingController();
final arrival4= TextEditingController();

final burst1= TextEditingController();
final burst2 = TextEditingController();
final burst3= TextEditingController();
final burst4= TextEditingController();

  List<int> arrivals = []; // arival
  List<int> burst = []; // burst
  List<int> finishTime = [0,0,0,0]; // finish
  List<int> turnAroundtime = [0,0,0,0];
  List<int> waitingTime = [0,0,0,0]; // waiting time

  double calculateAlgo(){
     int temp;
    print("era esh daka1");
      int arrival1Int = int.parse(arrival1.text);
      int arrival2Int = int.parse(arrival2.text);
      int arrival3Int = int.parse(arrival3.text);
      int arrival4Int = int.parse(arrival4.text);
print("era esh daka2");
      int burst1int = int.parse(burst1.text);
      int burst2int = int.parse(burst2.text);
      int burst3int = int.parse(burst3.text);
      int burst4int = int.parse(burst4.text);
            print("era esh daka3");
    arrivals.add(arrival1Int);
    arrivals.add(arrival2Int);
    arrivals.add(arrival3Int);
    arrivals.add(arrival4Int);
   print("era esh daka4");
    burst.add(burst1int);
    burst.add(burst2int);
    burst.add(burst3int);
    burst.add(burst4int);
print("era esh daka5");

    // sorting  arrival--->
  for(int i=0; i<4; i++){
    for(int j=i+i; j<4; j++){
      print("era esh daka6");
      if(arrivals[i] > arrivals[j]){
        temp = arrivals[i] ;
        arrivals[i] = arrivals[j];
        arrivals[j] = temp;
         print("era esh daka6.1");

        // temp = burst[i];
	      //  burst[i] = burst[j];
	      // burst[j] = temp ;
        // print("era esh daka6.2");
      }
    }
  }
  // sorting burst --->
  for(int i=0; i<4; i++){
    for(int j=i+i; j<4; j++){
      print("era esh daka6");
      if(burst[i] > burst[j]){
        temp = burst[i];
	       burst[i] = burst[j];
	      burst[j] = temp ;
        print("era esh daka6.2");
      }
    }
  }
  print(burst);
  print(arrivals);
print("era esh daka7");
  for(int i=0; i<4; i++){
    if(i==0){
      finishTime[i] = arrivals[i] + burst[i];
      print("era esh daka7.1");
    }else{
      if(arrivals[i] > finishTime[i-1]) {
					finishTime[i] = arrivals[i] + burst[i];
				}else {
					finishTime[i] =finishTime[i-1] + burst[i];
				}
    }
  }
  print("era esh daka8");
  for(int i=0; i<4; i++) {
			turnAroundtime[i] = finishTime[i] - arrivals[i];
			waitingTime[i] = turnAroundtime[i] - burst[i];
			avgWaiting = (avgWaiting + waitingTime[i]);
			avgTurnTime = (avgTurnTime + turnAroundtime[i]);
		}
    print("era esh daka9");
  
    print("this is avg waiting time${avgWaiting/4}");
    print("this is avg turn time${avgTurnTime/4}");
    return avgWaiting/4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Come First Served Algo"),
      ),
      body: Column(
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'ProcessNumber',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Arrival',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Burst',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows:  <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('$process1')),
                  DataCell(
                    SizedBox(
                    width: 40,
                    child: TextField(
                      controller: arrival1,
                     
                    ),
                  ),
                  ),
                  DataCell(
                    SizedBox(
                    width: 40,
                    child: TextField(
                       controller: burst1,
                    ),
                  ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                   DataCell(Text('$process2')),
                   DataCell(
                    SizedBox(
                    width: 40,
                    child: TextField(
                     controller: arrival2,
                    ),
                  ),
                  ),
                   DataCell(
                    SizedBox(
                    width: 40,
                    child: TextField(
                      controller: burst2,
                    ),
                  ),
                  ),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('$process3')),
                   DataCell(
                    SizedBox(
                    width: 40,
                    child: TextField(
                      controller: arrival3,
                    ),
                  ),
                  ),
                   DataCell(
                    SizedBox(
                    width: 40,
                    child: TextField(
                          controller: burst3,
                    ),
                  ),
                  ),
                ],
              ),
               DataRow(
                cells: <DataCell>[
                  DataCell(Text('$process4')),
                   DataCell(
                    SizedBox(
                    width: 40,
                    child: TextField(
                      controller: arrival4,
                    ),
                  ),
                  ),
                   DataCell(
                    SizedBox(
                    width: 40,
                    child: TextField(
                       controller: burst4,
                    ),
                  ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height:70,
            child: Center(
              child: ElevatedButton(onPressed: (){
                calculateAlgo();
              }, child: Text("Calculate")),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                children: [
                    Text("Turn around time is:",style: TextStyle(fontSize: 30, color: Colors.white), ),
                    SizedBox(
                      height: 40,
                    ),
                    Text("Waiting time is:",style: TextStyle(fontSize: 30, color: Colors.white), ),
                    
                ],
              ),
            ),
         
          width: double.infinity,
          height: 200,
          color: Colors.blue,
          )
        ],
      ),
    );
  }
}
