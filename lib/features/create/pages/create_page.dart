import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_request/features/create/data/date_model.dart';
import 'package:http_request/features/create/pages/bloc/create_bloc.dart';
import 'package:http_request/features/create/pages/widgets/create_page_widget.dart';
import 'package:http_request/features/home/pages/bloc/home_bloc.dart';

class AddPage extends StatefulWidget {
  static const String id = 'create_page';

  const AddPage({Key? key}) : super(key: key);

  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  @override
  late CreateBloc createBloc;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('POST'),
      ),
      body: BlocListener<CreateBloc, CreateState>(
        listenWhen: (oldState, newState) => oldState.post != newState.post,
        listener: (context, state) {
          if (state.post != null) {
            context.read<HomeBloc>().add(HomeLoadPostEvent());
            Navigator.of(context).pop();
          }
        },
        child: CreatePageWidget(
          fullnameController: fullnameController,
          mobileController: mobileController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Post post = Post(
              mobile: mobileController.text.toString(),
              fullname: fullnameController.text.toString());
          context.read<CreateBloc>().add(CreatePostEvent(post: post));
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
