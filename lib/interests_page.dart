// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:flutter/material.dart';
import 'navigation_drawer.dart'; // Ensure this path is correct for your project structure

class InterestsPage extends StatelessWidget {
  final List<Map<String, dynamic>> games = [
    {
      'name': 'Helldivers 2',
      'hoursPlayed': '50',
      'imagePath': 'assets/helldivers2.jpeg',
    },
    {
      'name': 'The Finals',
      'hoursPlayed': '25',
      'imagePath': 'assets/finals.jpg',
    },
    {
      'name': 'Baldurs Gate 3',
      'hoursPlayed': '25',
      'imagePath': 'assets/bg.jpeg',
    },
    {
      'name': 'Rocket League',
      'hoursPlayed': '25',
      'imagePath': 'assets/rl.jpg',
    },
    {
      'name': 'Helldivers 2',
      'hoursPlayed': '50',
      'imagePath': 'assets/helldivers2.jpeg',
    },
    {
      'name': 'The Finals',
      'hoursPlayed': '25',
      'imagePath': 'assets/finals.jpg',
    },
    {
      'name': 'Baldurs Gate 3',
      'hoursPlayed': '25',
      'imagePath': 'assets/bg.jpeg',
    },
    {
      'name': 'Rocket League',
      'hoursPlayed': '25',
      'imagePath': 'assets/rl.jpg',
    },
    // Add more games as needed
  ];

  final List<Map<String, dynamic>> animes = [
    {
      'title': 'Full Metal Alchemist : Brotherhood',
      'rating': 5, // Assuming a 5-star rating system
    },
    {
      'title': 'One Piece',
      'rating': 5,
    },
    {
      'title': 'Oregairu',
      'rating': 4.75,
    },
    // Add more animes as needed
  ];

  final Map<String, dynamic> fplTeamData = {
    "id": 4504170,
    "player_first_name": "Abhinav",
    "player_last_name": "Srinivasan",
    "summary_overall_points": 1546,
    "summary_overall_rank": 2863496,
  };

  Widget buildAnimeList(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: animes.length,
      itemBuilder: (context, index) {
        final anime = animes[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child:
                Text(anime['title'][0], style: TextStyle(color: Colors.white)),
          ),
          title: Text(anime['title'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (starIndex) {
              return Icon(
                starIndex < anime['rating'] ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 20,
              );
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interests'),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Games section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Games I\'m Playing',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 269,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            game['imagePath'],
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game['name'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.timer, size: 14),
                                    SizedBox(width: 4),
                                    Text(
                                      '${game['hoursPlayed']} hours',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Anime list section
              SizedBox(height: 20),
              Text('Top Anime List',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              buildAnimeList(context),

              // FPL Team Info section
              SizedBox(
                height: 20,
                width: 50,
              ),
              Text('My FPL Team Info',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person, size: 50),
                        title: Text(
                            "${fplTeamData['player_first_name']} ${fplTeamData['player_last_name']}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text("Fantasy Premier League"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.leaderboard),
                        title: Text("Overall Points"),
                        trailing:
                            Text("${fplTeamData['summary_overall_points']}"),
                      ),
                      ListTile(
                        leading: Icon(Icons.assessment),
                        title: Text("Overall Rank"),
                        trailing:
                            Text("#${fplTeamData['summary_overall_rank']}"),
                      ),
                      // Add more details as desired...
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
