nom
    by Xavier Shay
    for http://ausnom.com 

== Description

Command line access to ausnom.com (AU and NZ nutritional data)
Of course, ausnom.com doesn't exist yet. You'll have to find it
at github and run it at ausnom.localhost. Yeah, good luck with that.
Send me an email, I will help.

  ~ $ nom Tofu
  1: Ice Confection, Tofu-Based, Vanilla Flavour
  2: Tofu (Soy Bean Curd), Burger Pattie, As Purchased
  3: Tofu (Soy Bean Curd), Firm, As Purchased
  4: Tofu (Soy Bean Curd), Silken Or Soft, As Purchased
  5: Tofu (Soy Bean Curd), Smoked, As Purchased
  ~ $ nom Tofu 5
  Tofu (Soy Bean Curd), Smoked, As Purchased
  Energy     751.0KJ
  Protein    17.3G
  ~ $ nom Tofu 3
  Tofu (Soy Bean Curd), Firm, As Purchased
  Energy     530.0KJ
  Protein    12.0G

== Install

  gem install nom
