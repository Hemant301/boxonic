import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homebloc.fetchFaq();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite2,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FAQ",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: font,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<FaqModal>(
              stream: homebloc.getFaq.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                return Column(
                  children: List.generate(
                      snapshot.data!.faq.length,
                      (index) => Faqbutton(
                            question: snapshot.data!.faq[index].question,
                            answer: snapshot.data!.faq[index].answer,
                          )),
                );
              })
        ],
      ),
    );
  }
}

class Faqbutton extends StatefulWidget {
  Faqbutton({Key? key, this.question, this.answer})
      : super(
          key: key,
        );
  String? question;
  String? answer;

  @override
  State<Faqbutton> createState() => _FaqbuttonState();
}

class _FaqbuttonState extends State<Faqbutton> {
  int expand = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (expand == 1) {
            setState(() {
              expand = 0;
            });
          } else {
            setState(() {
              expand = 1;
            });
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.question}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: expand == 0
                      ? Icon(Icons.arrow_drop_down)
                      : Icon(Icons.arrow_drop_up),
                )
              ],
            ),
            expand == 0
                ? Container()
                : Container(
                    child: Text(
                      '${widget.answer}',
                    ),
                  ),
            Divider(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
