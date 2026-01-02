import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String? name;
  final String? description;
  final String? stars;
  final String? owner;
  final String? image;

  const Details({
    super.key,
    this.name,
    this.description,
    this.stars,
    this.owner,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name ?? 'Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Hero(
              tag: image ?? '',
              child: CircleAvatar(
                radius: 50,
                backgroundImage: image != null && image!.isNotEmpty
                    ? NetworkImage(image!)
                    : null,
                child: image == null || image!.isEmpty
                    ? const Icon(Icons.person, size: 50, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text('$stars stars', style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 4),
                Text(owner ?? '', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
