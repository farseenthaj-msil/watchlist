import 'package:flutter/material.dart';
import 'package:watchlist/widget/bloc_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, 
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Text('Contact 1', style: TextStyle(fontSize: 15, color: Colors.purple),),
                Text('Contact 2', style: TextStyle(fontSize: 15, color: Colors.purple),),
                Text('Contact 3', style: TextStyle(fontSize: 15, color: Colors.purple),),
              ]),
            title: const Text('Contacts', style: TextStyle(fontSize: 40),),
            centerTitle: true,),
          body: const TabBarView(
            
            children: [
              BlocBody(),
              BlocBody(),
              BlocBody(),
            ])
            )
    );
  }
}