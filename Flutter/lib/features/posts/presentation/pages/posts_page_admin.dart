import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv1/features/pages/presentation/pages/profile_page.dart';
import 'package:projectv1/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../bloc/posts/posts_bloc.dart';
import '../widgets/posts_page/message_display_widget.dart';
import '../widgets/posts_page/post_list_widget_admin.dart';
import '/injection_container.dart' as di;
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';

import 'post_add_update_page.dart';

class PostsPageAdmin extends StatelessWidget {
  const PostsPageAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(context),
        body: _buildBody(),
        floatingActionButton: _buildFloatingBtn(context));
  }

  AppBar _buildAppbar(context) => AppBar(
        centerTitle: true,
        title: Text("Admin"),
        leading: IconButton(
          icon: Icon(Icons.person_rounded),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              
              GoRouter.of(context).goNamed("login");
              

            },
            icon: Icon(Icons.logout),
          ),
        ],
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: PostListWidgetAdmin(posts: state.posts));
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PostAddUpdatePage(
                      isUpdatePost: false,
                    )));
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}
