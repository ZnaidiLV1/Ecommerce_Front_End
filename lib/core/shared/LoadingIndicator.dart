import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendproject/controller/LoadingController.dart'; // Adjust the import according to your file structure

class LoadingIndicator extends StatefulWidget {
  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingController, LoadingState>(
      builder: (context, state) {
        if (state is LoadingInProgress) {
          return Container(
            color: Colors.black54,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
