import 'package:flutter/material.dart';
class CreatePageWidget extends StatelessWidget {
  final TextEditingController mobileController;
  final TextEditingController fullnameController;
  const CreatePageWidget({required this.fullnameController,required this.mobileController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: TextField(
                controller: fullnameController,
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

          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: TextField(
                controller: mobileController,
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
    );
  }
}
