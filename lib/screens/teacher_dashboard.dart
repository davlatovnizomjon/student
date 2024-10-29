import 'package:app/services/firesore_service.dart';
import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teacher Dashboard")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _firestoreService.createAssignment(
                'Assignment 1', 'Description', DateTime.now());
          },
          child: Text("Create Assignment"),
        ),
      ),
    );
  }
}
