import 'package:flutter/material.dart';

class StepperApp extends StatefulWidget {
  @override
  _StepperAppState createState() => _StepperAppState();
}

class _StepperAppState extends State<StepperApp> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  TabBar makeTabBar(){
   return TabBar(tabs: <Tab>[
     Tab(
       icon: Icon(Icons.home),
     ),
     Tab(
       icon: Icon(Icons.settings),
     )
   ],
   controller: tabController);
  }

  TabBarView makeTabBarView(tabs){
    return TabBarView(
      controller: tabController,
      children: tabs,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid"),
          backgroundColor: Colors.indigo,
          bottom: makeTabBar(),
        ),
        body: makeTabBarView(<Widget>[
          TheGridView().build(),
          StepperTab(),
        ]),
      ),
        debugShowCheckedModeBanner:false
    );
  }
}

class TheGridView{

  Card makeGridCell(String name, IconData icon){
    return Card(
      elevation: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Icon(icon),
          ),
          Center(child: Text(name)),
        ],
      ),
      shape: CircleBorder(side: BorderSide(style: BorderStyle.solid)),
    );
  }

  GridView build(){
    return GridView.count(
      padding: EdgeInsets.all(1.0),
      primary: true,
      childAspectRatio: 1.0,
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisCount: 2,
      children: <Widget>[
        makeGridCell("Home", Icons.account_box),
        makeGridCell("Email", Icons.email),
        makeGridCell("Chat", Icons.chat),
        makeGridCell("News", Icons.new_releases),
        makeGridCell("Home", Icons.account_box),
        makeGridCell("Email", Icons.email),
        makeGridCell("Chat", Icons.chat),
        makeGridCell("News", Icons.new_releases),
        makeGridCell("Home", Icons.account_box),
        makeGridCell("Email", Icons.email),
        makeGridCell("Chat", Icons.chat),
        makeGridCell("News", Icons.new_releases),
        makeGridCell("Home", Icons.account_box),
        makeGridCell("Email", Icons.email),
        makeGridCell("Chat", Icons.chat),
        makeGridCell("News", Icons.new_releases),
      ],
    );
  }
}


class StepperTab extends StatefulWidget {
  @override
  _StepperTabState createState() => _StepperTabState();
}

class _StepperTabState extends State<StepperTab> {

  int stepCounter = 0;

  List<Step> steps = [
    Step(
      title: Text("Step One"),
      content: new Column(
        children: <Widget>[
          Text("Vikas"),
          Text("Pandey")
        ],
      ),
      isActive: true,
    ),
    Step(
      title: Text("Step two"),
      content: Text("This is a second step"),
      isActive: true,
    ),
    Step(
      title: Text("Step three"),
      content: Text("This is a third step"),
      isActive: true,
    ),
    Step(
      title: Text("Step four"),
      content: Text("This is a forth step"),
      isActive: true,
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stepper(
        currentStep: this.stepCounter,
          type: StepperType.vertical,
          steps: steps,
        onStepTapped: (steps){
          setState(() {
            stepCounter = steps;
          });
        },
        onStepContinue: (){
          setState(() {
            setState(() {
              stepCounter < steps.length - 1 ?
              stepCounter += 1:
              stepCounter = 0;
            });
          });
        },
        onStepCancel: (){
          setState(() {
            stepCounter > 0 ?
            stepCounter -= 1:
            stepCounter = 0;
          });
        },
      ),
    );
  }
}


