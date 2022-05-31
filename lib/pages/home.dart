import 'package:flutter/material.dart';
import 'package:test_flutter/model/model_test.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: FutureBuilder<ModelTest>(
        future: ModelTest.allData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: Text("Sedang Mengambil Data"));

            default:
              if (snapshot.hasError) {
                return const Center(child: Text("Error, Data not Found"));
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: Text(
                              snapshot.data!.data![index].gampong.toString()),
                          subtitle: Text(snapshot.data!.data![index].idGampong
                              .toString()));
                    });
              }
          }
        },
      ),
    );
  }
}
