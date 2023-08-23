import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:living_trends/core/widgets/primary_textfield.dart';

class ItemsListingPage extends ConsumerWidget {
  const ItemsListingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text('LivinTrends'),
            floating: true,
            expandedHeight: 150,
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 120, 10, 0),
              child: PrimaryTextField(hintText: 'Search'),
            ),
          ),
          SliverList.separated(
              itemCount: 20,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return PropertyCard();
              })
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://www.thespruce.com/thmb/2_Q52GK3rayV1wnqm6vyBvgI3Ew=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/put-together-a-perfect-guest-room-1976987-hero-223e3e8f697e4b13b62ad4fe898d492d.jpg',
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '3 Storey Apartment',
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
