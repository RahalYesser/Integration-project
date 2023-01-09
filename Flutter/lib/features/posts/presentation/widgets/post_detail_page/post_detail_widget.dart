import 'package:flutter/material.dart';
import '../../../../auth/data/models/courses_model.dart';
import '../../../domain/entities/post.dart';
import '/core/firebase/firebase_service.dart';
import '/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';

class PostDetailWidget extends StatelessWidget {
  final Post post;
  const PostDetailWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;
    CoursesModel courses = CoursesModel(course: []);

   

  

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            post.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 50,
          ),
          Image.network(
            post.image,
            // width: 80
          ),
          Divider(
            height: 50,
          ),
          Text("Description :  "+
            post.description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Divider(
            height: 50,
          ),
          Text("By : "+
            post.userId,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Divider(
            height: 50,
          ),
          Text("Date : "+
            post.date,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Divider(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              

              db.collection('courses').doc(user!.uid).update({
                "course": FieldValue.arrayUnion([post.name])
              });

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Successfully Enrolled in this Course')));
              GoRouter.of(context).goNamed("profile");
            },
            child: Text("Enroll In This Course"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          )
        ],
      ),
    );
  }

}
