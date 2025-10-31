import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountCategoryType {
  final String name;
  final IconData iconData;
  const AccountCategoryType({required this.name, required this.iconData});
}

enum AccountCategoryEnum {
  google(
    AccountCategoryType(name: "Google", iconData: FontAwesomeIcons.google),
  ),
  facebook(
    AccountCategoryType(name: "Facebook", iconData: FontAwesomeIcons.facebook),
  ),
  x(
    AccountCategoryType(name: "X", iconData: FontAwesomeIcons.twitter),
  ),
  github(
    AccountCategoryType(name: "Github", iconData: FontAwesomeIcons.github),
  ),
  instagram(
    AccountCategoryType(
      name: "Instagram",
      iconData: FontAwesomeIcons.instagram,
    ),
  ),
  linkedin(
    AccountCategoryType(name: "Linkedin", iconData: FontAwesomeIcons.linkedin),
  ),
  apple(AccountCategoryType(name: "Apple", iconData: FontAwesomeIcons.apple)),
  microsoft(
    AccountCategoryType(
      name: "Microsoft",
      iconData: FontAwesomeIcons.microsoft,
    ),
  ),
  amazon(
    AccountCategoryType(name: "Amazon", iconData: FontAwesomeIcons.amazon),
  ),
  netflix(
    AccountCategoryType(name: "Netflix", iconData: Icons.settings_remote_sharp),
  ),
  spotify(
    AccountCategoryType(name: "Spotify", iconData: FontAwesomeIcons.spotify),
  ),
  paypal(
    AccountCategoryType(name: "Paypal", iconData: FontAwesomeIcons.paypal),
  ),
  dropbox(
    AccountCategoryType(name: "Dropbox", iconData: FontAwesomeIcons.dropbox),
  ),
  slack(AccountCategoryType(name: "Slack", iconData: FontAwesomeIcons.slack)),
  wordpress(
    AccountCategoryType(
      name: "Wordpress",
      iconData: FontAwesomeIcons.wordpress,
    ),
  ),
  pinterest(
    AccountCategoryType(
      name: "Pinterest",
      iconData: FontAwesomeIcons.pinterest,
    ),
  ),
  tumblr(
    AccountCategoryType(name: "Tumblr", iconData: FontAwesomeIcons.tumblr),
  ),
  reddit(
    AccountCategoryType(name: "Reddit", iconData: FontAwesomeIcons.reddit),
  ),
  youtube(
    AccountCategoryType(name: "Youtube", iconData: FontAwesomeIcons.youtube),
  ),
  twitch(
    AccountCategoryType(name: "Twitch", iconData: FontAwesomeIcons.twitch),
  ),
  discord(
    AccountCategoryType(name: "Discord", iconData: FontAwesomeIcons.discord),
  ),
  chatgpt(
    AccountCategoryType(name: "ChatGPT", iconData: FontAwesomeIcons.robot),
  ),
  airbnb(
    AccountCategoryType(name: "Airbnb", iconData: FontAwesomeIcons.airbnb),
  ),
  uber(AccountCategoryType(name: "Uber", iconData: FontAwesomeIcons.uber)),
  lyft(AccountCategoryType(name: "Lyft", iconData: FontAwesomeIcons.lyft)),
  ebay(AccountCategoryType(name: "Ebay", iconData: FontAwesomeIcons.ebay)),
  etsy(AccountCategoryType(name: "Etsy", iconData: FontAwesomeIcons.etsy)),
  aliexpress(
    AccountCategoryType(name: "Aliexpress", iconData: FontAwesomeIcons.alipay),
  ),
  kukufm(
    AccountCategoryType(name: "Kukufm", iconData: FontAwesomeIcons.headphones),
  ),
  vimeo(AccountCategoryType(name: "Vimeo", iconData: FontAwesomeIcons.vimeo)),
  soundcloud(
    AccountCategoryType(
      name: "Soundcloud",
      iconData: FontAwesomeIcons.soundcloud,
    ),
  ),
  vk(AccountCategoryType(name: "VK", iconData: FontAwesomeIcons.vk)),
  pornhub(
    AccountCategoryType(name: "Pornhub", iconData: Icons.eighteen_up_rating),
  );

  final AccountCategoryType accountCategoryType;
  const AccountCategoryEnum(this.accountCategoryType);
}
