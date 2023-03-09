import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group34firbase/controller/data/app_cubit.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                cubit.Image("cam");
              },
              child: Text("SelectPic"),
            ),
          ),
        );
      },
    );
  }
}
