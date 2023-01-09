
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectv1/features/pages/presentation/pages/profile_page.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../bloc/posts/posts_bloc.dart';
import '../widgets/posts_page/message_display_widget.dart';
import '../widgets/posts_page/post_list_widget.dart';
import '/injection_container.dart' as di;
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
          
        ],
        child: Scaffold(
          appBar: _buildAppbar(),
          body: _buildBody(),
          bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_rounded),
            label: 'Logout',
          ),
        ],
        currentIndex: 0,
        onTap: (int index) {
          if (index == 1) {
            // Navigate to the Courses screen
            GoRouter.of(context).goNamed("profile");
          }
          if (index == 2) {
            // Handle logout here
            BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
          }
        },
      ),
        ));
  }
  

  AppBar _buildAppbar() => AppBar(title: Text('Courses'));

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
                child: PostListWidget(posts: state.posts));
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

  
}
