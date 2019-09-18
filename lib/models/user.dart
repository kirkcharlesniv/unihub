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

final christianLee = User(
    name: 'Christian Lee',
    imageUrl:
        'https://scontent.fmnl17-1.fna.fbcdn.net/v/t31.0-8/23799892_1762397134060409_4255464620772944320_o.jpg?_nc_cat=100&_nc_oc=AQnbrHYOhTJTTxHv-QcP2m20trjjHLSoPWOVCwS2dtjHawljD6Y50UKyzJFWH8bJbBI&_nc_ht=scontent.fmnl17-1.fna&oh=e07edc1063f3c2b73c45943e172d93d4&oe=5E05D714',
    stories: <Story>[Story()]);
final matthew = User(
    name: 'Vugarishk Lagikusha',
    imageUrl:
        'https://scontent.fmnl17-2.fna.fbcdn.net/v/t1.0-9/55576635_643935129386908_1039298436848943104_n.jpg?_nc_cat=111&_nc_oc=AQm9Mfebq7DS11KC2vNhOE8sYz7M_BN2p9xQSpGKnS3w9zGQJQDjA1cqtBLnTTrbAvI&_nc_ht=scontent.fmnl17-2.fna&oh=4650abe2ebcd14a3275fdf9919b832fc&oe=5DFAF29C',
    stories: <Story>[Story()]);
final aefaith = User(
    name: 'AE Faith Heaker',
    imageUrl:
        'https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.0-1/c0.0.600.600a/69266239_739952646418273_8501716341697282048_n.jpg?_nc_cat=101&_nc_oc=AQnC_Nx-6OnSBuAzTfde-RsADDLbjBsD5fn5oXuCZqyH8XviD0WCMw-bvKutDiC16sM&_nc_ht=scontent.fmnl17-1.fna&oh=8e24321731cfd593251872bf52aeb090&oe=5DF54C69',
    stories: <Story>[Story()]);
