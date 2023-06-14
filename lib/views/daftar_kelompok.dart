import 'package:flutter/material.dart';

class InfoKelompok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Daftar Kelompok'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => CustomGridItemWidget(
                index: index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGridItemWidget extends StatelessWidget {
  const CustomGridItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            "https://picsum.photos/id/${2 + index}/500/500",
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.bottomLeft,
              color: Colors.black.withOpacity(0.4),
              child: Text(
                'Kelompok ${index + 1}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
