import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/sidebarcontroller.dart';
import 'package:flutter_application_1/services/google.dart';
import 'package:flutter_application_1/view/addStudent/addstudent.dart';
import 'package:flutter_application_1/view/loginpage.dart';
import 'package:flutter_application_1/view/todo/todo.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  final SidebarController sidebarController = Get.put(SidebarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            leading: Icon(Icons.account_box_sharp),
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
                        leading: const Icon(
                          Icons.person,
                        ),
                        title: const Text("Add Student "),
                        onTap: () {
                          Get.to(const AddStudent());
                        },
                      ),
                    ),
                  )),
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
                    leading: const Icon(Icons.calendar_today),
                    title: const Text("Attandence"),
                    onTap: () {},
                  ),
                )),
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
                      leading: const Icon(Icons.assignment),
                      title: const Text("Task"),
                      onTap: () {
                        Get.to(TodoPage());
                      },
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
                      leading: const Icon(Icons.assignment_turned_in),
                      title: const Text("Assignments"),
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
                      leading: const Icon(Icons.attach_money),
                      title: const Text(
                        "Fees",
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      endDrawer: GetBuilder<SidebarController>(
        builder: (controller) => Drawer(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            children: [
              const DrawerHeader(
                child: Text("Sidebar"),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Log Out"),
                onTap: () async {
                  await FirebaseServices().signOut();
                  Get.to(LoginPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
