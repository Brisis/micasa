import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';

class PrivacyTermsAndConditionsPage extends StatelessWidget {
  const PrivacyTermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const TcsTopSection(),
          verticalSpace(height: 15),
          const TcsDetailSection(),
        ],
      ),
    );
  }
}

class TcsTopSection extends StatelessWidget {
  const TcsTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: kChipColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: kWhiteColor,
                      size: 20,
                    ),
                  ),
                ),
                horizontalSpace(),
                const Text(
                  "Privacy, T&Cs",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kSubHeaderTextSize,
                    fontWeight: FontWeight.bold,
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

class TcsDetailSection extends StatelessWidget {
  const TcsDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Disclaimer: This example policy outlines how our clients' websites collect data as standard. The wording provided is set to be a very generic statement and will need to be tailored to fit your particular use of your website. Cleverbox take no legal responsibility for the content of this document being fully compliant. Should you wish to use any part of it, you should confirm with your own Data Protection Officer that it accurately explains your personal data processing activities and includes all the necessary information you are legally required to disclose.",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: kBlackFaded,
            ),
          ),
          verticalSpace(height: 15),
          const Text(
            "Privacy Policy",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kSubHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "This website is operated by [school/Trust name] and whose registered address is [school/Trust address] (“We”) are committed to protecting and preserving the privacy of our visitors when visiting our site or communicating electronically with us.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "This policy sets out how we process any personal data we collect from you or that you provide to us through our website. We confirm that we will keep your information secure and that we will comply fully with all applicable UK Data Protection legislation and regulations. Please read the following carefully to understand what happens to personal data that you choose to provide to us, or that we collect from you when you visit this site. By visiting [URL of school/Trust website] (our website) you are accepting and consenting to the practices described in this policy.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 15),
          const Text(
            "Types of information we may collect from you",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "We may collect, store and use the following kinds of personal information about individuals who visit and use our website:",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 15),
          const Text(
            "Information you supply to us:",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "You may supply us with information about you by filling in forms on our website. This includes information you provide when you submit a contact/enquiry form [list any other active forms on your website (ie. Request a Prospectus Form, Application Form, Report and Absence Form, etc.]. The information you give us may include your name, address, e-mail address and phone number, [list any other types of information you collect via other active forms on your website (ie. child’s name, child’s date of birth, etc.)].",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 15),
          const Text(
            "Information our website automatically collects about you.",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Each of your visits to our website we may automatically collect information including the following:",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            " - technical information, including a truncated and anonymised version of your Internet protocol (IP) address, browser type and version, operating system and platform;",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kNormalTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            " - information about your visit, including what pages you visit, how long you are on the site, how you got to the site (including date and time); page response times, length of visit, what you click on, documents downloaded and download errors.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kNormalTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 15),
          const Text(
            "Cookies",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Our website uses cookies to distinguish you from other users of our website. This helps us to provide you with a good experience when you browse our website and also allows us to improve our site.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 15),
          const Text(
            "How we may use the information we collect",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "We use the information in the following ways:",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Information you supply to us. ",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            " - to provide you with information and/or services that you request from us;",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kNormalTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Information we automatically collect about you.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            " - to administer our site including troubleshooting and statistical purposes;",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kNormalTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            " - to improve our site to ensure that content is presented in the most effective manner for you and for your computer;",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kNormalTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            " - security and debugging as part of our efforts to keep our site safe and secure.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kNormalTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "This information is collected anonymously and is not linked to information that identifies you as an individual. We use Google Analytics to track this information. Find out how Google uses your data at https://support.google.com/analytics/answer/6004245. ",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 30),
          const Text(
            "Disclosure of your information",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Any information you provide to us will either be emailed directly to us or may be stored on a secure server located near Dublin within the Republic of Ireland. We use a trusted third party website and hosting provider (Cleverbox) to facilitate the running and management of this website. Cleverbox meet high data protection and security standards and are bound by contract to keep any information they process on our behalf confidential. Any data that may be collected through this website that Cleverbox process, is kept secure and only processed in the manner we instruct them to. Cleverbox cannot access, provide, rectify or delete any data that they store on our behalf without permission.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "We do not rent, sell or share personal information about you with other people or non-affiliated companies.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "We will use all reasonable efforts to ensure that your personal data is not disclosed to regional/national institutions and authorities, unless required by law or other regulations.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Unfortunately, the transmission of information via the internet is not completely secure. Although we will do our best to protect your personal data, we cannot guarantee the security of your data transmitted to our site; any transmission is at your own risk. Once we have received your information, we will use strict procedures and security features to try to prevent unauthorised access.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 30),
          const Text(
            "Third party links",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Our site may, from time to time, contain links to and from the third party websites. If you follow a link to any of these websites, please note that these websites have their own privacy policies and that we do not accept any responsibility or liability for these policies. Please check these policies before you submit any personal data to these websites.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 30),
          const Text(
            "Your rights - access to your personal data",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "You have the right to ensure that your personal data is being processed lawfully (“Subject Access Right”). Your subject access right can be exercised in accordance with data protection laws and regulations. Any subject access request must be made in writing to [insert school/Trust Data Controller contact details]. We will provide your personal data to you within the statutory time frames. To enable us to trace any of your personal data that we may be holding, we may need to request further information from you. If you have a complaint about how we have used your information, you have the right to complain to the Information Commissioner’s Office (ICO).",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 30),
          const Text(
            "Changes to our privacy policy",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Any changes we may make to our privacy policy in the future will be posted on this page and, where appropriate, notified to you by e-mail. Please check back frequently to see any updates or changes to our privacy policy.",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(height: 30),
          const Text(
            "Contact",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          verticalSpace(),
          const Text(
            "Questions, comments and requests regarding this privacy policy are welcomed and should be addressed to [name and address or e-mail address].",
            style: TextStyle(
              color: kBlackFaded,
              fontSize: kMediumTextSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
