import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class Policies extends StatelessWidget {
  const Policies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: lightWhite2,
        title: Text(
          "Policies",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Privacybtns(
            onTap: () {
              Navigator.pushNamed(context, '/pdf', arguments: {
                'url':
                    'https://cms.cybertizeweb.com/boxoniq-crm/staticpages/privacy.pdf',
                'title': 'Privacy Policy'
              });
            },
            title: 'Privacy Policy',
          ),
          Privacybtns(
            onTap: () {
              Navigator.pushNamed(context, '/pdf', arguments: {
                'url':
                    'https://cms.cybertizeweb.com/boxoniq-crm/staticpages/refund-cancel.pdf',
                'title': 'Refund & cancellation'
              });
            },
            title: 'Refund & cancellation',
          ),
          Privacybtns(
            onTap: () {
              Navigator.pushNamed(context, '/pdf', arguments: {
                'url':
                    'https://cms.cybertizeweb.com/boxoniq-crm/staticpages/shipping.pdf',
                'title': 'Shipping Policy'
              });
            },
            title: 'Shipping Policy',
          ),
          Privacybtns(
            onTap: () {
              Navigator.pushNamed(context, '/pdf', arguments: {
                'url':
                    'https://cms.cybertizeweb.com/boxoniq-crm/staticpages/terms.pdf',
                'title': 'Terms & Conditions'
              });
            },
            title: 'Terms & Conditions',
          ),
        ],
      ),
    );
  }
}

class Privacybtns extends StatelessWidget {
  Privacybtns({Key? key, this.title, this.onTap}) : super(key: key);
  String? title;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
