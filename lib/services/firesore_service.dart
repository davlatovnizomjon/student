import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createAssignment(
      String title, String description, DateTime dueDate) async {
    final assignmentId = _firestore.collection('assignments').doc().id;
    await _firestore.collection('assignments').doc(assignmentId).set({
      'id': assignmentId,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'status': 'pending',
    });
  }

  Stream<QuerySnapshot> getAssignments() {
    return _firestore.collection('assignments').snapshots();
  }
}
