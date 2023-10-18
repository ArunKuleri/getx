import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.menu),
            title: Text("D A S H B O A R D"),
            expandedHeight: 300,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Add Student"),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text("Attandence"),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text("Task"),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: ListTile(
                      leading: Icon(Icons.assignment_turned_in),
                      title: Text("Assignments"),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text("Fees"),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
