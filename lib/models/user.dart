import 'package:flutter/material.dart';

const currentUser = User(
    name: 'Kirk Niverba',
    imageUrl:
        'https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.0-9/22815282_1179801335486549_5046548424585309223_n.jpg?_nc_cat=104&_nc_oc=AQns9JPQ55H3HU3aqdcJInrkk9fH8ndClr_fEWAXfvffC7EN4_r9cg2iDKv1jMvm2N0&_nc_ht=scontent.fmnl17-1.fna&oh=97795461f74aaf6534ef0b99cdce4656&oe=5E0388E5');

class User {
  final String name;

  final String imageUrl;
  final List<Story> stories;

  const User({
    @required this.name,
    this.imageUrl,
    this.stories = const <Story>[],
  });
}

class Story {
  const Story();
}
