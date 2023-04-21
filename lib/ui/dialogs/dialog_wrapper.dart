import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWrapper extends StatelessWidget {
  const DialogWrapper(
      {Key? key,
      required this.title,
      this.message,
      this.button1 = 'Ok',
      this.button2 = 'Cancel',
      this.child})
      : super(key: key);

  final String title;
  final String? message;
  final String button1;
  final String button2;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              minWidth: 10,
              minHeight: 10,
              maxHeight: MediaQuery.of(context).size.height * 0.6),
          child: Card(
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(title),
                  const SizedBox(
                    height: 10,
                  ),
                  if (message != null) Text(message!),
                  const SizedBox(
                    height: 10,
                  ),
                  if (child != null) child!,
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          child: Text(button1),
                          onPressed: () => Get.back(result: 1),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: ElevatedButton(
                          child: Text(button2),
                          onPressed: () => Get.back(result: 0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
