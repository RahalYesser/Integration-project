import 'package:flutter/material.dart';
import 'package:projectv1/features/posts/presentation/pages/post_detail_page_admin.dart';
import '../../../domain/entities/post.dart';
import '../../pages/post_detail_page.dart';

class PostListWidgetAdmin extends StatefulWidget {
  final List<Post> posts;
  const PostListWidgetAdmin({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  _PostListWidgetState createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidgetAdmin> {
  final _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var posts = widget.posts;
    if (_searchText.isNotEmpty) {
      posts = posts.where((post) => post.name.contains(_searchText)).toList();
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search...",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PostDetailPageAdmin(post: posts[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.network(
                          posts[index].image,
                          width: 80,
                          
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              posts[index].name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text("By "+
                              posts[index].userId,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              posts[index].date,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              posts[index].description,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(thickness: 1),
          ),
        ),
      ],
    );

    
  }
  
}
