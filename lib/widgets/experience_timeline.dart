import 'package:flutter/material.dart';

class ExperienceTimeline extends StatelessWidget {
  final List<Map<String, String>> experiences;

  ExperienceTimeline({required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(experiences.length, (index) {
        final experience = experiences[index];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.blue,
                  ),
                  if (index <
                      experiences.length - 1) // Don't draw line after last item
                    Container(
                      height: 50, // Adjust based on your spacing
                      width: 1.5,
                      color: Colors.grey,
                    ),
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(experience['title']!,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(experience['period']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    SizedBox(height: 5),
                    Text(experience['description']!,
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
