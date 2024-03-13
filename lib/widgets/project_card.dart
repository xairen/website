import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Map<String, String> project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(project['period']!,
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 10),
            Text(project['description']!, style: TextStyle(fontSize: 14)),
            // You can add more details like technologies used, links, etc.
          ],
        ),
      ),
    );
  }
}
