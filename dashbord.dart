import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final employees = [
    {'name': 'sudheer', 'role': 'Inside Sales'},
    {'name': 'er', 'role': 'Inside Sales'},
    {'name': 'rayudu', 'role': 'Inside Sales'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Icon(Icons.home, size: 80)),
            ListTile(title: Text("Dashboard"), leading: Icon(Icons.dashboard)),
            ListTile(title: Text("Employees"), leading: Icon(Icons.people)),
            ListTile(title: Text("Sales"), leading: Icon(Icons.sell)),
            ListTile(title: Text("Customers"), leading: Icon(Icons.group)),
            ListTile(title: Text("Attendance"), leading: Icon(Icons.schedule)),
            ListTile(title: Text("Settings"), leading: Icon(Icons.settings)),
            ListTile(title: Text("Sign Out"), leading: Icon(Icons.logout)),
          ],
        ),
      ),
      appBar: AppBar(title: Text("Welcome Admin, Have a nice day")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                statCard("Total Employees", "23", Icons.people),
                statCard("Today Customers", "216", Icons.person_outline),
                statCard("Interested", "117", Icons.favorite_border),
                statCard("Add Employee", "+", Icons.add),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            SizedBox(height: 20),
            ToggleButtons(
              isSelected: [true, false],
              onPressed: (i) {},
              children: [Text("Inside"), Text("Outside")],
            ),
            ...employees.map((emp) => employeeCard(emp)).toList(),
            Spacer(),
            CalendarWidget(),
          ],
        ),
      ),
    );
  }

  Widget statCard(String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(icon),
            Text(value, style: TextStyle(fontSize: 20)),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget employeeCard(Map<String, String> emp) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text("Name: ${emp['name']}"),
        subtitle: Text("Role: ${emp['role']}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: () {}),
            IconButton(icon: Icon(Icons.delete), onPressed: () {}),
            IconButton(icon: Icon(Icons.star_border), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Calendar goes here (can use TableCalendar package)");
  }
}
