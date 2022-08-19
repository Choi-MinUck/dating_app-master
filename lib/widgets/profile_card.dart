import 'package:dating_app/model/card.dart';
import 'package:flutter/material.dart';

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
