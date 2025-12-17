import 'package:flutter/material.dart';

Widget repoCard({
  required String name,
  required String description,
  required String stars,
  required String owner,
  required String image,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff1D2A57),
            ),
          ),
          const SizedBox(height: 6),

          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text('$stars stars'),
                ],
              ),

              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: image.isNotEmpty
                        ? NetworkImage(image)
                        : null,
                    child: image.isNotEmpty
                        ? null
                        : const Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.white,
                          ),
                  ),
                  const SizedBox(width: 6),

                  Text(
                    owner,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
