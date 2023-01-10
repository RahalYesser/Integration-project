import 'package:flutter/material.dart';
import 'package:projectv1/features/posts/presentation/widgets/post_detail_page/post_detail_widget_admin.dart';

import '../../domain/entities/post.dart';
import '../widgets/post_detail_page/post_detail_widget_admin.dart';

class PostDetailPageAdmin extends StatelessWidget {
  final Post post;
  const PostDetailPageAdmin({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text("Course Detail"),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PostDetailWidgetAdmin(post: post),
      ),
    );
  }
}
