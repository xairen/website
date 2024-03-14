import 'package:flutter/material.dart';
import 'navigation_drawer.dart';
import 'widgets/experience_timeline.dart';
import 'widgets/project_card.dart';

class ResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration. Replace with your actual data.
    final List<Map<String, String>> experiences = [
      {
        'title': 'SOFTWARE ENGINEER | Center on Access Technology',
        'period': 'December 2023 - Present',
        'description': 'Led the development of a robust PWA prototype...',
      },
      {
        'title': 'SOFTWARE ENGINEER | Center on Access Technology',
        'period': 'August 2022 - August 2023',
        'description': '.....',
      },
      {
        'title':
            'RESEARCH/TEACHING ASSISTANT | Rochester Institute of Technology',
        'period': 'May 2021 - May 2022',
        'description': '.....',
      },
      {
        'title': 'WEB DEVELOPER | Rochester Institute of Technology',
        'period': 'September 2021 - December 2021',
        'description': '.....',
      }
    ];

    final List<Map<String, String>> projects = [
      {
        'name': 'MACHINE LEARNING-BASED PREDICTION OF NATURAL DISASTERS',
        'period': 'May 2023 - Aug 2023',
        'description': 'Developed a robust machine-learning model...',
      },
      {
        'name': 'MACHINE LEARNING-BASED PREDICTION OF NATURAL DISASTERS',
        'period': 'May 2023 - Aug 2023',
        'description': 'Developed a robust machine-learning model...',
      },
      {
        'name': 'MACHINE LEARNING-BASED PREDICTION OF NATURAL DISASTERS',
        'period': 'May 2023 - Aug 2023',
        'description': 'Developed a robust machine-learning model...',
      }
      // Add more projects as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Resume'),
      ),
      drawer: NavDrawer(), // Assuming you have a navigation drawer setup
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your Education, Technical Skills, etc., sections here
            Text('Experience',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ExperienceTimeline(experiences: experiences),
            Text('Projects',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ...projects
                .map((project) => ProjectCard(project: project))
                .toList(),
          ],
        ),
      ),
    );
  }
}
