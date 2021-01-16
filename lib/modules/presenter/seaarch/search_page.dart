import 'package:clean_architecture_flutter/modules/presenter/seaarch/search_bloc.dart';
import 'package:clean_architecture_flutter/modules/presenter/seaarch/states/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search",
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                  final state = bloc.state;
                  if (state is SearchStart) {
                    return Center(
                      child: Text('Digite um texto'),
                    );
                  }
                  if (state is SearchError) {
                    return Center(
                      child: Text('Houve um erro'),
                    );
                  }
                  if (state is SearchError) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final list = (state as SearchSuccess).list;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final item = list[index];
                        return ListTile(
                          title: Text('item.title'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(item.img),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
