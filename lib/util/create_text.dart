import 'package:flutter/material.dart';

class CreateText extends StatefulWidget {
  Function()? onDraw;
  TextEditingController? questionController;
  Function()? onCancel;
  Function()? onNext;
  final String left;
  final String right;
  CreateText(
      {super.key,
      required this.onDraw,
      required this.questionController,
      required this.onCancel,
      required this.onNext,
      required this.left,
      required this.right});

  @override
  State<CreateText> createState() => _CreateTextState();
}

class _CreateTextState extends State<CreateText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                  onTap: widget.onDraw, child: Icon(Icons.draw)))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text("question"),
              ),
              Container(
                height: 200,
                width: 400,
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: TextField(
                    cursorColor: Theme.of(context).colorScheme.inversePrimary,
                    controller: widget.questionController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: widget.onCancel,
                    child: Text(
                      widget.left,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: widget.onNext,
                    child: Text(
                      widget.right,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
