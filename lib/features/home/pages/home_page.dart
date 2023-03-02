import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_request/features/create/pages/create_page.dart';
import 'package:http_request/features/home/pages/bloc/home_bloc.dart';
import 'package:formz/formz.dart';
import 'package:http_request/features/home/pages/widgets/home_item_widget.dart';

class HomPage extends StatefulWidget {
  static const String id = "Hompage";

  HomPage({Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("GET"),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeBloc, HomeLoadState>(
        listenWhen: (oldState, newState) =>
            oldState.isDelete != newState.isDelete,
        listener: (context, state) {
          if (state.isDelete && state.status!.isSubmissionSuccess) {
            context.read<HomeBloc>().add(HomeLoadPostEvent());
          }
        },
        builder: (context, state) {
          if (state.status!.isPure) {
            context.read<HomeBloc>().add(HomeLoadPostEvent());
          } else if (state.status!.isSubmissionInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status!.isSubmissionSuccess) {
            return ListView.builder(
                itemCount: state.post!.length,
                itemBuilder: (context, index) {
                  return itemOPost(state.post![index], context);
                });
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPage()));
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
