import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_request/features/create/data/date_model.dart';
import 'package:http_request/features/create/pages/create_page.dart';
import 'package:http_request/features/edite/pages/edite_page.dart';
import 'package:http_request/features/home/pages/bloc/home_bloc.dart';
import 'package:formz/formz.dart';

class HomPage extends StatefulWidget {
  static const String id = "Hompage";

  HomPage({ Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Colors.grey,
      appBar: AppBar(
        backgroundColor:Colors.grey,
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
                  //return itemOPost(state.post![index]);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.post![index].fullname!,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  state.post![index].mobile!,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UpdatePage(post:state.post![index])));
                                  },
                                  child: const Icon(
                                    Icons.create,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<HomeBloc>(context)
                                        .add(HomeDelatePostEvent(post:state.post![index]));
                                  },
                                  child: const Icon(
                                    Icons.delete_rounded,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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

  // Widget itemOPost(Post post) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       height: 75,
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.black),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   post.fullname!,
  //                   style: const TextStyle(fontSize: 15),
  //                 ),
  //                 const SizedBox(
  //                   height: 12,
  //                 ),
  //                 Text(
  //                   post.mobile!,
  //                   style: const TextStyle(fontSize: 15),
  //                 ),
  //               ],
  //             ),
  //             Column(
  //               children: [
  //                 InkWell(
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => UpdatePage(post:post,)));
  //                   },
  //                   child: const Icon(
  //                     Icons.create,
  //                     color: Colors.blue,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 5,
  //                 ),
  //                 InkWell(
  //                   onTap: () {
  //                     BlocProvider.of<HomeBloc>(context)
  //                         .add(HomeDelatePostEvent(post: post));
  //                   },
  //                   child: const Icon(
  //                     Icons.delete_rounded,
  //                     color: Colors.red,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
