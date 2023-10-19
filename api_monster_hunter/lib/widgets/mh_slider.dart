import 'package:flutter/material.dart';

import '../models/data.dart';

class MhSlider extends StatelessWidget {
  final List<Ailment> data;
  final String? id;
  const MhSlider({super.key, required this.data, this.id});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Moustros',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (_, int index) => _MhPoster(data: data[index]),
            ),
          )
        ],
      ),
    );
  }
}

class _MhPoster extends StatelessWidget {
  final Ailment data;
  const _MhPoster({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: data),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: AssetImage('assets/${data.id}.jpg'),
                width: 130,
                height: 165,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            data.name.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
