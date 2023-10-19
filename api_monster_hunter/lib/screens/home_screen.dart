import 'package:flutter/material.dart';
import 'package:api_monster_hunter/providers/mh_provider.dart';
import 'package:api_monster_hunter/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mhProvider = Provider.of<MhProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          )
        ],
        title: const Center(
          child: Text('MONSTER HUNTER'),
        ),
      ),
      body: Column(
        children: [
          CardSwiper(
            data: mhProvider.onDisplayMh,
          ),
          MhSlider(
            data: mhProvider.foughtMh,
          )
        ],
      ),
    );
  }
}
