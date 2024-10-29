import 'package:app/services/firesore_service.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Dashboard")),
      body: StreamBuilder(
        stream: _firestoreService.getAssignments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final assignments = snapshot.data?.docs;
          return ListView.builder(
            itemCount: assignments?.length,
            itemBuilder: (context, index) {
              final assignment = assignments?[index];
              return ListTile(
                title: Text(assignment?['title']),
                subtitle: Text(assignment?['description']),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Handle assignment submission
                  },
                  child: Text("Submit"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
