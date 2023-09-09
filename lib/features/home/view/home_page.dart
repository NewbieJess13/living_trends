import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:living_trends/core/constants/text_constants.dart';
import 'package:living_trends/core/widgets/primary_textfield.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextConst.currentLocation,
                    style: TextStyle(fontSize: 10, color: Colors.black87),
                  ),
                  Text.rich(
                    TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                        Ionicons.location,
                        size: 14,
                        color: Colors.red,
                      )),
                      TextSpan(
                        text: 'Lipa City, Batangas',
                      ),
                    ]),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ]),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton.filled(
                    style:
                        IconButton.styleFrom(backgroundColor: Colors.white30),
                    onPressed: () {},
                    icon: const Icon(Ionicons.notifications_outline)),
              )
            ],
            floating: false,
            centerTitle: false,
            pinned: true,
            expandedHeight: 130,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 110, 15, 0),
                child: _searchWithFilterButton(),
              ),
            ),
          ),
          _propertiesAroundYou(context),
          _featuredProperties()
        ],
      ),
    );
  }

  Widget _searchWithFilterButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(child: PrimaryTextField(hintText: TextConst.searchText)),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.white30),
            onPressed: () {},
            icon: const Icon(
              Ionicons.options_outline,
            ))
      ],
    );
  }

  Widget _propertiesAroundYou(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Properties near you',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Spacer(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'See more',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Color(0xFFBF742E)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * .30,
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(top: 0),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const Align(
                        alignment: Alignment.center, child: PropertyCard1());
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _featuredProperties() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Featured properties',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Spacer(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'See more',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Color(0xFFBF742E)),
                    ),
                  ),
                )
              ],
            ),
            ListView.builder(
                itemCount: 3,
                padding: EdgeInsets.fromLTRB(0, 05, 0, 10),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PropertyCard2();
                  // return Text('HEHEH');
                })
          ],
        ),
      ),
    );
  }
}

class PropertyCard1 extends StatelessWidget {
  const PropertyCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 170,
      margin: EdgeInsets.only(right: 18),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.1),
                blurRadius: 3,
                spreadRadius: .5,
                offset: Offset(3, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              'https://www.thespruce.com/thmb/2_Q52GK3rayV1wnqm6vyBvgI3Ew=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/put-together-a-perfect-guest-room-1976987-hero-223e3e8f697e4b13b62ad4fe898d492d.jpg',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '3 Storey Apartment',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Text.rich(
            TextSpan(
                text: '₱12,000.00',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFBF742E)),
                children: [
                  TextSpan(
                      text: '/month',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500))
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          const Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  child: Icon(
                Ionicons.location,
                size: 10,
                color: Colors.grey,
              )),
              TextSpan(
                text: ' Marauoy, Lipa City, Batangas',
              ),
            ]),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          ),
          // SizedBox(
          //   height: 3,
          // ),
          Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  child: Image.asset(
                'assets/icons/ruler.png',
                width: 10,
                height: 10,
              )),
              TextSpan(
                text: ' 130 sqft',
              ),
            ]),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          ),
          // SizedBox(
          //   height: 3,
          // ),
          const Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  child: Icon(
                Ionicons.bed,
                size: 10,
                color: Colors.grey,
              )),
              TextSpan(
                text: ' 3 Bedrooms',
              ),
            ]),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class PropertyCard2 extends StatelessWidget {
  const PropertyCard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.1),
                blurRadius: 3,
                spreadRadius: .5,
                offset: Offset(3, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              'https://www.thespruce.com/thmb/2_Q52GK3rayV1wnqm6vyBvgI3Ew=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/put-together-a-perfect-guest-room-1976987-hero-223e3e8f697e4b13b62ad4fe898d492d.jpg',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                '3 Storey Apartment',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text.rich(
                TextSpan(
                    text: '₱12,000.00',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFBF742E)),
                    children: [
                      TextSpan(
                          text: '/month',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500))
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  child: Icon(
                Ionicons.location,
                size: 10,
                color: Colors.grey,
              )),
              TextSpan(
                text: ' Marauoy, Lipa City, Batangas',
              ),
            ]),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          ),
          // SizedBox(
          //   height: 3,
          // ),
          Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  child: Image.asset(
                'assets/icons/ruler.png',
                width: 10,
                height: 10,
              )),
              TextSpan(
                text: ' 130 sqft',
              ),
            ]),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          ),
          // SizedBox(
          //   height: 3,
          // ),
          const Text.rich(
            TextSpan(children: [
              WidgetSpan(
                  child: Icon(
                Ionicons.bed,
                size: 10,
                color: Colors.grey,
              )),
              TextSpan(
                text: ' 3 Bedrooms',
              ),
            ]),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
