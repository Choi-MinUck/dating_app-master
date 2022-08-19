import 'package:dating_app/model/profile.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580,
      width: 340,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                profile.imageAsset,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              width: 340,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        fontSize: 21,
                      ),
                    ),
                    Text(
                      profile.distance,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardDeckButton4 extends StatelessWidget {
  CardDeckButton4({Key? key, required this.card}) : super(key: key);
  final MyCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SizedBox(
            width: 150,
            height: 224,
            child: Stack(
              children: [
                Image.asset('assets/images/${card.cardName}.png'),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    '${card.cardCount} 장',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    card.cardContent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 150 / 100,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget CardDeckButton3(int cardCount, String cardContent, String cardName) {
  String cardPath = 'assets/images/${cardName}.png';

  return Stack(
    children: [
      SizedBox(
        width: 150,
        height: 224,
        child: Stack(
          children: [
            Ink.image(
                image: AssetImage(cardPath),
                child: InkWell(
                  onTap: () {},
                ),
                fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '${cardCount} 장',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                cardContent,
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 150 / 100,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
