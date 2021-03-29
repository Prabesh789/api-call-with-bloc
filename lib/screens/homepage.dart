import 'package:apicallwithbloc/cubit/news_cubit.dart';
import 'package:apicallwithbloc/dependency_injection.dart';
import 'package:apicallwithbloc/global/theme/theme.dart';
import 'package:apicallwithbloc/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      cubit: inject<NewsCubit>(),
      listener: (context, state) {
        if (state is NewsLoadedState) {}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.appBarColor,
            title: Text('API Fetch bloc'),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("Raised Button"),
                onPressed: () {
                 
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
