import '../../bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/post.dart';
import 'form_submit_btn.dart';
import 'text_form_field_widget.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePost;
  final Post? post;
  const FormWidget({
    Key? key,
    required this.isUpdatePost,
    this.post,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePost) {
      _nameController.text = widget.post!.name;
      _userIdController.text = widget.post!.userId;
      _dateController.text = widget.post!.date;
      _descriptionController.text = widget.post!.description;
      _imageController.text = widget.post!.image;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidget(
                name: "Name", multiLines: false, controller: _nameController),
            TextFormFieldWidget(
                name: "Trainer", multiLines: false, controller: _userIdController),
            TextFormFieldWidget(
                name: "Date", multiLines: false, controller: _dateController),
            TextFormFieldWidget(
                name: "Image URL", multiLines: false, controller: _imageController),
            TextFormFieldWidget(
                name: "Description", multiLines: true, controller: _descriptionController),
            FormSubmitBtn(
                isUpdatePost: widget.isUpdatePost,
                onPressed: validateFormThenUpdateOrAddPost),
          ]),
    );
  }

  void validateFormThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final post = Post(
          id: widget.isUpdatePost ? widget.post!.id : null,
          name: _nameController.text,
          userId: _userIdController.text,
          date: _dateController.text,
          image: _imageController.text,
          description: _descriptionController.text,
          );

      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }
}
