import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/sidebarcontroller.dart';
import 'package:flutter_application_1/controller/toggle_controller.dart';
import 'package:flutter_application_1/services/google.dart';
import 'package:flutter_application_1/view/addStudent/addstudent.dart';
import 'package:flutter_application_1/view/todo/todo.dart';
import 'package:flutter_application_1/view/tutors/tutors.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final SidebarController sidebarController = Get.put(SidebarController());
  final controller = Get.put(DarkModeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Obx(
              () => IconButton(
                onPressed: () {
                  Get.changeThemeMode(controller.changeTheme());
                },
                icon: Icon(
                  controller.themeMode.value == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              ),
            ),
            title: const Text("D A S H B O A R D"),
            expandedHeight: 100,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    child: SizedBox(
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
                    child: SizedBox(
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
                  child: SizedBox(
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
                  child: SizedBox(
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
                  child: SizedBox(
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: ListTile(
                      leading: const Icon(Icons.chat_bubble_outline_rounded),
                      title: const Text(
                        "Chat with Your Tutor",
                      ),
                      onTap: () {
                        Get.to(() => const tutors());
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                '${FirebaseAuth.instance.currentUser!.displayName}',
                style: const TextStyle(color: Colors.black),
              ), // Replace w, // Replace with user's name
              accountEmail: Text(
                '${FirebaseAuth.instance.currentUser!.email}',
                style: const TextStyle(color: Colors.black),
              ), // Replace with user's email
              currentAccountPicture: CircleAvatar(
                // Replace with user's profile picture
                backgroundImage:
                    NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await FirebaseServices().signOut();
              },
            ),
            // Add more drawer items as needed
          ],
        ),
      ),
    );
  }
}
