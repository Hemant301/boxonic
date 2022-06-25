import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite2,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "About Us",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'BOXONIQ: LET’S BEGIN TO CONTINUE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'While your babies deserve the best care in the world, what would be more interesting and relaxing to choose products that are as concerned about your baby the way you are? Natural, safe and effective, Boxoniq’s exclusive range of baby care products has everything you need for the nourishment of your child ranging from Baby Diapers, Baby Powder, Baby Lotion, Baby Wash to Baby Shampoo, Baby Diaper Rash Cream, Baby Massage Oil, Baby Hair Oil and much more. ',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Whether it’s tear-free baths or gentle massage, our products are well-suited and effective for all skin types to offer safe & natural baby care products for your rising concerns. To make parenthood more enjoyable and care-free, our products come in different combo packs that are customised keeping in mind your needs and requirements. So, you don’t have to search for other alternative options. As rightly said, parenthood is the best feeling that changes everything. It takes you through a roller coaster ride filled with emotions and sentiments. When this ride gets a little rough, Boxoniq’s baby essentials and combo set are here to bring you comfort.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Through our all-in-one e-commerce platform, you can find a plethora of options to choose from that are delivered at your doorstep. So, what are you waiting for? Fill up your carts to order the most desired products you wish to greet your child with. And what’s more exciting than to enjoy some remarkable discounts and offers to add some cherry on the top of it! ',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Our Expertise ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Center(
                child: LottieBuilder.asset(
                  'assets/deliver.json',
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'So, it’s always a great idea to give your baby some extra care, because of the adverse environmental conditions. Your key to an ideal future is to choose safe, natural and nourishing ingredients that are healthy for both mom and the baby.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Our expertise lies in procuring products from leading brands through extensive market research and analysis to ensure proper nourishment of your child with utmost care and prudence. Our dedicated team of experts are trained to provide the best suitable products combined with reliability and authenticity. We are passionate about technology and innovation and are constantly on our journey to ensure a seamless and unified user experience for our customers. ',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  'How does Boxoniq work?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Center(
                child: LottieBuilder.asset(
                  'assets/bounce.json',
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Today, the new generation of parents faces new challenges: more demanding jobs, less time available, increased prices, etc. Boxoniq is a one-stop-destination that allows you to create your own customised range of essential products on a monthly basis or subscription. The subscription allows users to receive the necessary products for each stage of the baby on a monthly basis so you no longer have to worry about your newborn. ',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'How to subscribe to Boxoniq: Our registration process is quite simple and easy. FOLLOW these steps and you are one step closer to gaining long-term benefits for you and your baby.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  '● Search enter www.boxoniq.com on google or open URL or download our app in your android/ios mobile.'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  '● Create your login id or sign in to the platform to register yourself'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  '● Create your bundle (divided by categories) according to your needs'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  '● Finally, place the order through different payment modes and enjoy a hassle-free delivery'),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Our Mission',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Center(
                child: LottieBuilder.asset(
                  'assets/mission.json',
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Our mission is to help parents save time and money. Inspired by our friends, parents, we want more and more families to dedicate themselves to enjoying themselves. We trust that we provide a true experience, a personalized service designed with love. Regarding our value proposition, we offer premium quality products at excellent prices. At the same time, we offer promotions and discounts so that users can obtain benefits.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Our Vision',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Center(
                child: LottieBuilder.asset(
                  'assets/vision.json',
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Boxoniq is built in the category that is considered unusual. We take pride in being India’s first ever platform to introduce the concept of subscription based model that works in accordance to your baby’s requirement and is extremely beneficial for the parents. Our platform will enable parents to leave their requirements to us and make their moments worth cherishing. ',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'We envision building an ecosystem to become the key market player and cater to this everevolving competition. Competence, commitment and passion is what keeps us going and we are here to provide solutions that drive results. ',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
