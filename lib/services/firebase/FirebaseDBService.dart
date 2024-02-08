import 'package:cloud_firestore/cloud_firestore.dart';

const String mainDoc = 'BMICalculator';
abstract class FirebaseDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath;
  final String mainPath;

  FirebaseDB(this.mainPath,this.collectionPath);

  CollectionReference get collection => _firestore.collection(mainPath).doc('BMICalculator').collection(collectionPath);

  Future<DocumentReference> add(Map<String, dynamic> data) async {
    return await collection.add(data);
  }

  Future<void> update(String documentId, Map<String, dynamic> data) async {
    await collection.doc(documentId).update(data);
  }


  Future<QuerySnapshot> checkIfDocExist( String key,var data,) async {
    return await collection.where(key, isEqualTo: data).limit(1).get();
  }



  Future<void> delete(String documentId) async {
    await collection.doc(documentId).delete();
  }

  Stream<List<Map<String, dynamic>>> get documents {
    return collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
        .toList());
  }
}


class FirebaseDBService extends FirebaseDB{
  FirebaseDBService(super.mainPath, super.collectionPath);
}
