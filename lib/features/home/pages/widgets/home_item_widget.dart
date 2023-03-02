import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_request/features/create/data/date_model.dart';
import 'package:http_request/features/edite/pages/edite_page.dart';
import 'package:http_request/features/home/pages/bloc/home_bloc.dart';

Widget itemOPost(Post post,BuildContext context) {
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
                  post.fullname!,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  post.mobile!,
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
                            builder: (context) => UpdatePage(post:post,)));
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
                        .add(HomeDelatePostEvent(post: post));
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
}