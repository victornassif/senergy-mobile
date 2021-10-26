import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  Function syncFun;
  CustomAppBar(this.syncFun);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://media-exp1.licdn.com/dms/image/C4D03AQF_Cc4Xmy4iHA/profile-displayphoto-shrink_200_200/0/1626626632257?e=1640822400&v=beta&t=Q3d9lnHwNBkRpiIvCtvo0nmrU5oHzWTsJhbbGxNYsYQ'),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.sync),
          iconSize: 28.0,
          onPressed: syncFun,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
