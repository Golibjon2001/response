import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:http_request/features/create/data/date_model.dart';
import 'package:http_request/features/edite/pages/bloc/edite_bloc.dart';
import 'package:http_request/features/home/pages/bloc/home_bloc.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  Post? post;

  UpdatePage({required this.post, Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController _fullnameTextEditingController =
      TextEditingController();
  final TextEditingController _mobileTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullnameTextEditingController.text = widget.post!.fullname!;
    _mobileTextEditingController.text = widget.post!.mobile!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('PUT'),
      ),
      body: BlocListener<EditeBloc, EditeState>(
        //listenWhen: (oldState, newState) => oldState.isEdit != newState.isEdit,
        listener: (context, state) {
          if (state.isEdit && state.status.isSubmissionSuccess) {
            context.read<HomeBloc>().add(HomeLoadPostEvent());
            Navigator.of(context).pop();
          }
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Title
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    controller: _fullnameTextEditingController,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      labelText: 'fullname',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Body
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextField(
                    controller: _mobileTextEditingController,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      labelText: 'mobile',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Post post = Post(
              id: widget.post!.id,
              mobile: _mobileTextEditingController.text.toString(),
              fullname: _fullnameTextEditingController.text.toString());
          context.read<EditeBloc>().add(EditePostEvent(post: post));
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
