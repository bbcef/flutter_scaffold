import 'package:flutter/material.dart';
import 'package:flutter_scaffold/viewModel/count_view_model.dart';
import 'package:provider/provider.dart';


class viewModelPage extends StatelessWidget {
  static const String routeName = '/viewmodel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VM demo'),
        centerTitle: true,
      ),
      floatingActionButton: Consumer<CountViewModel>(
        builder: (context,countVM,child){
          return FloatingActionButton(
            child: child,
            onPressed: (){
              countVM.count += 1;
            },
          );
        },
        child: Icon(Icons.add)
      ),
      body: Center(
        child: Consumer<CountViewModel>(
          builder: (context,countVM,child){
            return Text('当前计数${countVM.count}',style: TextStyle(fontSize: 24));
          }
        )
      )
    );
  }
}
