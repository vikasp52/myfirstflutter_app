import 'package:flutter/material.dart';
import 'Model/Chat_Model.dart';

class DiallerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "WhatsApp",
      theme: ThemeData(
        primaryColor: new Color(0Xff075E54),
        accentColor: new Color(0Xff25D366),
      ),
      home: new WhatsappHome(),
    );
  }
}


//Home Class
class WhatsappHome extends StatefulWidget{
  @override
  _WhatsappHomeState createState() => _WhatsappHomeState();
}

class _WhatsappHomeState extends State<WhatsappHome> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon: Icon(Icons.camera_alt),),
              new Tab(text: "CHATS",),
              new Tab(text: "STATUS",),
              new Tab(text: "CALLS",),
            ]),
        actions: <Widget>[
          new Icon(Icons.search),
          new SizedBox.fromSize(
            size: Size(10.0, 0.0),
          ),
          new Icon(Icons.more_vert),
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
          children: <Widget>[
        new CamaraScreen(),
            new ChatScreen(),
            new StatusScreen(),
            new CallsScreen()
      ]),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(Icons.message, color: Colors.white,),
          onPressed: (){}),
    );
  }
}

//Camara Screen
class CamaraScreen extends StatefulWidget {
  @override
  _CamaraScreenState createState() => _CamaraScreenState();
}

class _CamaraScreenState extends State<CamaraScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Camara"),
    );
  }
}

//Chat Screen
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummydata.length,
        itemBuilder: (context,i) => new Column(
          children: <Widget>[
            Divider(height: 10.0,),
            new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.grey,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundImage: new NetworkImage(dummydata[i].avatarUrl),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(dummydata[i].name, style: TextStyle(fontWeight: FontWeight.bold),),
                  new Text(dummydata[i].time),
                ],
              ),
              subtitle: new Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                    dummydata[i].message,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            )
          ],
        )
    );
  }
}

//Status Screen
class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new ListTile(
          leading: new Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: new CircleAvatar(
                  maxRadius: 25.0,
                  backgroundImage: NetworkImage("http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
                ),
              ),
              Positioned(
                //right: 3.0,
                  child: CircleAvatar(
                    radius: 10.0,
                    backgroundColor: Theme.of(context).accentColor,
                    child: Icon(Icons.add, size: 20.0, color: Colors.white,),
                  )
              )
            ],
          ),
          title: Text("My Status", style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Tap to update status update"),
        ),
        new Container(
          color: Color.fromARGB(255, 244, 243, 244),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Recent updates", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 137, 123))
            ),
          ),
        ),
        new Expanded(child: new
        ListView.builder(
            itemCount: dummydata.length,
            itemBuilder: (context,i) => new Column(
              children: <Widget>[
                Divider(height: 10.0,),
                new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundImage: new NetworkImage(dummydata[i].avatarUrl),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(dummydata[i].name, style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    subtitle: new Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        dummydata[i].previous_time,
                      ),
                    )
                )
              ],
            )
        ),
        ),
        new Container(
          color: Color.fromARGB(255, 244, 243, 244),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Viewed updates", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 137, 123))
            ),
          ),
        ),
        new Expanded(child: new
        ListView.builder(
            itemCount: dummydata.length,
            itemBuilder: (context,i) => new Column(
              children: <Widget>[
                Divider(height: 10.0,),
                new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundImage: new NetworkImage(dummydata[i].avatarUrl),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(dummydata[i].name, style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    subtitle: new Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        dummydata[i].previous_time,
                      ),
                    )
                )
              ],
            )
        ),
        ),
      ],
    );
  }
}

//Calls Screen
class CallsScreen extends StatefulWidget {
  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: dummydata.length,
        itemBuilder: (context,i) => new Column(
          children: <Widget>[
            Divider(height: 10.0,),
            new ListTile(
                leading: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundImage: new NetworkImage(dummydata[i].avatarUrl),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(dummydata[i].name, style: TextStyle(fontWeight: FontWeight.bold),),
                    new Icon(Icons.videocam, color: Theme.of(context).primaryColor,),
                  ],
                ),
                subtitle: new Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.call_made, color: Colors.green,),
                      Text(
                        dummydata[i].previous_time,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}












