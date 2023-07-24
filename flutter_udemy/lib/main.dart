import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App 10",
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            // backgroundColor: Colors.grey,
            appBar: AppBar(
              title: Text(
                "Form",
                style: TextStyle(color: Colors.white),
              ),
              // leading: Icon(Icons.home),
              backgroundColor: Colors.blueGrey,
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home',),
                Tab(icon: Icon(Icons.search), text: 'Search',),
                Tab(icon: Icon(Icons.settings), text: 'Settings',),

              ]),
            ),
            drawer: _drawerWidget(),
            body: TabBarView(
              children: [
              _bodyCardWidget(),
              HomePage(),
              _bodyCardWidget()

              ]),
        ),
      )
    );
  }
}

class _bodyCardWidget extends StatelessWidget {
  const _bodyCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(28),
      child: Center(
        child: Container(
          height: 200,
          width: 300,
          child: Card(
            color: Colors.grey,
            elevation: 10,
            child:  Column(
              mainAxisSize: MainAxisSize.max,
            ),
          ),
        ),
      ),
    );
  }
}

class _drawerWidget extends StatelessWidget {
  const _drawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Le Thanh Hung'), 
            accountEmail: Text('lthung@gmail.com'),
            currentAccountPicture: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/lg.png'), 
                  fit: BoxFit.fill, 
                ),
              ),
            )
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {HomePage();},
          ),
          ListTile(
            leading: Icon(Icons.settings_input_antenna),
            title: Text('Settings'),
            onTap: () {HomePage();},
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Storage'),
            onTap: () {HomePage();},
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Account'),
            onTap: () {HomePage();},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {HomePage();},
          ),

        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Home'),
    );
  }
}

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your name",
              labelText: "Name",
              icon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value==null || value.isEmpty) {
                return 'Please fill the details';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter password",
              labelText: "Password",
              icon: Icon(Icons.lock),
              
            ),
            validator: (value) {
              if (value==null || value.isEmpty) {
                return 'Please fill the details';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Github",
              labelText: "Github",
              icon: Icon(Icons.link),
            ),
            validator: (value) {
              if (value==null || value.isEmpty) {
                return 'Please fill the details';
              }
              return null;
            },
          ),  
          Container (
          child: ElevatedButton(
            
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Validation')));
              };
            },
            child: Text('Submit'),
          ),
         ),
        ],
      ),
    );
  }
}