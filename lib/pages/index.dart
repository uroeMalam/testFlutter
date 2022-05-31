// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_flutter/model/model_gampong.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Expanded(
              child: SizedBox(
                height: 130,
                child: FutureBuilder<ModelGampong>(
                    future: ModelGampong.allData(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          print('Waiting...');
                          return const Center(
                              child: Text("Sedang Mengambil Data"));
                        default:
                          if (snapshot.hasError) {
                            print("Error, Data not Found :" +
                                snapshot.hasError.toString());
                            return const Center(
                                child: Text("Error, Data not Found"));
                          } else {
                            print("Data Founded");
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.data!.length,
                                itemBuilder: (ctx, index) {
                                  return SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Text(snapshot
                                        .data!.data![index].gampong
                                        .toString()),
                                  );
                                });
                          }
                      }
                    }),
              ),
            ),
            Expanded(
              child: FutureBuilder<ModelGampong>(
                  future: ModelGampong.allData(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        print('Waiting...');
                        return const Center(
                            child: Text("Sedang Mengambil Data"));
                      default:
                        if (snapshot.hasError) {
                          print("Error, Data not Found :" +
                              snapshot.hasError.toString());
                          return const Center(
                              child: Text("Error, Data not Found"));
                        } else {
                          print("Data Founded");
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: (ctx, index) {
                                return Text(snapshot.data!.data![index].gampong
                                    .toString());
                              });
                        }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
