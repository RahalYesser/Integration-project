import 'dart:convert';

import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}

const BASE_URL = "http://10.0.2.2:8081/TRAINING-SERVICE/api/training/";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;
  

  PostRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "all"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();

      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "name": postModel.name,
      "userId": postModel.userId,
      "image": postModel.image,
      "date": postModel.date,
      "description": postModel.description,
    };

    final response =
        await client.post(Uri.parse(BASE_URL + "create"), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      print(response.statusCode);
      
       throw ServerException();
      
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.delete(
      Uri.parse(BASE_URL + "delete/${postId.toString()}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {
      "id": postId,
      "name": postModel.name,
      "userId": postModel.userId,
      "image": postModel.image,
      "date": postModel.date,
      "description": postModel.description,
    };

    final response = await client.patch(
      Uri.parse(BASE_URL + "update"),

      body: body,
       
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      print(response.statusCode);
      throw ServerException();
    }
  }
}
