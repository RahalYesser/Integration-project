import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../../../posts/presentation/bloc/posts/posts_bloc.dart';
import '../../../posts/presentation/pages/posts_page_admin.dart';
import '../../../../injection_container.dart' as di;
import '../../../../core/app_theme.dart';


class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  
 @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
          BlocProvider(
            create: (_) => di.sl<AddDeleteUpdatePostBloc>()
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: PostsPageAdmin()));
  }
  }





