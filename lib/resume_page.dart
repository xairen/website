import 'package:flutter/material.dart';
import 'navigation_drawer.dart';

class ResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume'),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('EDUCATION',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Rochester Institute of Technology | Rochester, NY\n'
                'MS in Information Technology and Analytics\n'
                'August 2020 - August 2023'),
            SizedBox(height: 4),
            Text('SRM University | Chennai, India\n'
                'B.Tech in Information Technology\n'
                'August 2016 - May 2020'),
            SizedBox(height: 16),
            Text('TECHNICAL SKILLS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Languages: Python, Java, Dart, SAS'),
            Text(
                'AWS: CloudFormation, DynamoDB, Lambda, IAM, S3, SNS/SQS, RDS, VPC'),
            Text('Web Technologies: HTML, CSS, Javascript, PHP, XML, Django'),
            Text('Database: MySQL, PostgreSQL, MongoDB, Neo4J'),
            Text('Tools: Docker, Github, Jenkins, Asana, UIFlow'),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
