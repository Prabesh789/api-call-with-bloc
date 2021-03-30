import 'package:apicallwithbloc/cubit/news_cubit.dart';
import 'package:apicallwithbloc/dependency_injection.dart';
import 'package:apicallwithbloc/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  // ScrollController scrollController = ScrollController();

  Future<void> _refreshNews() async {
    inject<NewsCubit>().fetchNews();
  }

  @override
  void initState() {
    inject<NewsCubit>().fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
              semanticLabel: 'Upload Book',
            ),
            onPressed: _refreshNews,
          ),
        ],
        backgroundColor: AppColors.appBarColor,
      ),
      body: BlocConsumer(
        cubit: inject<NewsCubit>(),
        listener: (context, state) {
          if (state is NewsErrorState) {
            Fluttertoast.showToast(
              msg: state.erroeMessage,
              backgroundColor: Colors.white,
              textColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          if (state is NewsLoadingState || state is NewsInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsErrorState) {
            return Center(
              child: Text('Failed to load ..!'),
            );
          } else if (state is NewsLoadedState) {
            return
                // SmartRefresher(
                // enablePullUp: true,
                // enablePullDown: true,
                // scrollController: scrollController,
                // onRefresh: () {},
                // controller: _refreshController,
                // child:
                SingleChildScrollView(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.newsModel.facts.length,
                itemBuilder: (context, item) {
                  final data = state.newsModel.facts[item];
                  //return Text("${data.title}");
                  return Container(
                    margin: EdgeInsets.all(14),
                    child: Column(
                      children: <Widget>[
                        Image.network("${data.image_url}"),
                        Text(
                          "${data.title}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${data.description}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ); //);
          } else {
            return Center(
              child: Text("Somtthing Went Wrong"),
            );
          }
        },
      ),
    );
  }
}
