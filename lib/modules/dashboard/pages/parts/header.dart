import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/extensions/x_extensions.dart';

import '../../../../configs/x_configs.dart';
import '../../../register/x_registers.dart';
import '../../x_dashboards.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: kAppPrimary,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                // child: Image.network(
                //   'https://i.pravatar.cc/200',
                //   width: 64.0,
                //   height: 64.0,
                //   fit: BoxFit.cover,
                // ),
                child: CachedNetworkImage(
                  width: 64.0,
                  height: 64.0,
                  fit: BoxFit.cover,
                  imageUrl: "http://i.pravatar.cc/200",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: context.deviceWidth - 208.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo,',
                      style: TextStyle(
                        color: kBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FutureBuilder<AuthorizationModel>(
                        future: AuthorizationService.getAuthData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!.user.name,
                              style: TextStyle(
                                color: kBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Container(
                  width: 40.0,
                  height: 40.0,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Image.asset('lib/assets/images/notification.png'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
          SearchInput(
            controller: searchController,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}