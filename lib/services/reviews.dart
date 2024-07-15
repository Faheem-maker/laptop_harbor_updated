import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReviewService {

  late FirebaseFirestore db;

  ReviewService() {
    db = FirebaseFirestore.instance;
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> getReviews(int productId) {
    debugPrint(productId.toString());
    return db.collection("reviews").where("product_id", isEqualTo: productId).snapshots();
  }

  void addReview(Map<String, dynamic> review) {
    db.collection("reviews").add(review);
  }
}