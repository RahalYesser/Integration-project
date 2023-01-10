import 'update_post_btn_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';
import 'delete_post_btn_widget.dart';

class PostDetailWidgetAdmin extends StatelessWidget {
  final Post post;
  const PostDetailWidgetAdmin({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           
            children: [
              Image.network(
                 post.image,
                 //width: 80
              ),
          
              Column(
                children : [
                  Text(
                   post.name,
                    style: const TextStyle(
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(
                    height: 50,
                  ),

                  Text( "By "+ post.userId,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ]
             )
            ],
          ),
          
          const Divider(
            height: 50,
          ),
          Text( "Date : " +
            post.date,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Divider(
            height: 50,
          ),
          Text(
            post.description,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Divider(

            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostBtnWidget(post: post),
              DeletePostBtnWidget(postId: post.id!)
            ],
          )
        ],
      ),
    );
  }
}



