import 'package:flutter/material.dart';
import 'package:unihub/home/avatar_widget.dart';
import 'package:unihub/models/user.dart';

class Stories extends StatelessWidget {
  final _users = <User>[
    User(
        name: 'Christian Lee',
        imageUrl:
            'https://scontent.fmnl17-1.fna.fbcdn.net/v/t31.0-8/23799892_1762397134060409_4255464620772944320_o.jpg?_nc_cat=100&_nc_oc=AQnbrHYOhTJTTxHv-QcP2m20trjjHLSoPWOVCwS2dtjHawljD6Y50UKyzJFWH8bJbBI&_nc_ht=scontent.fmnl17-1.fna&oh=e07edc1063f3c2b73c45943e172d93d4&oe=5E05D714',
        stories: <Story>[Story()]),
    User(
        name: 'Vugarishk Lagikusha',
        imageUrl:
            'https://scontent.fmnl17-2.fna.fbcdn.net/v/t1.0-9/55576635_643935129386908_1039298436848943104_n.jpg?_nc_cat=111&_nc_oc=AQm9Mfebq7DS11KC2vNhOE8sYz7M_BN2p9xQSpGKnS3w9zGQJQDjA1cqtBLnTTrbAvI&_nc_ht=scontent.fmnl17-2.fna&oh=4650abe2ebcd14a3275fdf9919b832fc&oe=5DFAF29C',
        stories: <Story>[Story()]),
    User(
        name: 'AE Faith Heaker',
        imageUrl:
            'https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.0-1/c0.0.600.600a/69266239_739952646418273_8501716341697282048_n.jpg?_nc_cat=101&_nc_oc=AQnC_Nx-6OnSBuAzTfde-RsADDLbjBsD5fn5oXuCZqyH8XviD0WCMw-bvKutDiC16sM&_nc_ht=scontent.fmnl17-1.fna&oh=8e24321731cfd593251872bf52aeb090&oe=5DF54C69',
        stories: <Story>[Story()]),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      color: Theme.of(context).primaryColorDark,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Center(
              child: AvatarWidget(
                user: currentUser,
                isLarge: true,
                isShowingUsernameLabel: true,
                isCurrentUserStory: true,
              ),
            ),
          ),
          VerticalDivider(),
          Flexible(
            flex: 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return Center(
                  child: AvatarWidget(
                    user: _users[index],
                    isLarge: true,
                    isShowingUsernameLabel: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
