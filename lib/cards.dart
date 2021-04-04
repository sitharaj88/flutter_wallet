import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinanceCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xfff7f6f7),
        margin: EdgeInsets.only(top: 32),
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xfff7f6f7),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      header(),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Your Cards',
                          style: TextStyle(
                              color: Color(0xff5942d3),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'You have 2 active cards',
                        style: TextStyle(color: Color(0xff5942d3)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      card("\$45,855", "****8563", 0xff3618d0),
                      SizedBox(
                        height: 10,
                      ),
                      card("\$8,588.00", "****7496", 0xff30bc97),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                budgetSavedDetailCard()
              ],
            ),
          ),
        ),
      );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.arrow_back_outlined,
          color: Colors.grey,
          size: 30,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('images/profile.png'),
        ),
      ],
    );
  }

  Widget card(String amount, String cardNumber, int cardColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Color(cardColor),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VISA',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              amount,
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardNumber,
                  style: TextStyle(color: Colors.white70),
                ),
                Container(
                  height: 30,
                  width: 45,
                  child: Stack(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.white70,
                        ),
                      ),
                      Positioned(
                          left: 15,
                          child: Container(
                            width: 30,
                            height: 30,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget budgetSavedDetailCard() {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saving this week',
                  style: TextStyle(
                      color: Color(0xff5942d3), fontWeight: FontWeight.bold),
                ),
                Text(
                  '65%',
                  style: TextStyle(
                      color: Color(0xff5942d3), fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: 0.7,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xff5942d3)),
                  backgroundColor: Color(0xffD6D6D6),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color(0xffeff0f4),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Color(0xff5942d3),
                      child: Icon(
                        Icons.folder,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have spent \$4,927.92\nfund over 15 days',
                        style: TextStyle(color: Color(0xffc0c4cd)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Text(
                          'View all transactions >',
                          style: TextStyle(
                              color: Color(0xff5942d3),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
