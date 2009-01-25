nom
    by Xavier Shay
    for http://ausnom.com

== Description

Command line access to ausnom.com (AU and NZ nutritional data)

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

  git clone git://github.com/xaviershay/nom.git 
  cd nom
  rake gem:install

== TODO

* Push the gem to a server somewhere so you can just install that
* Allow calories to be displayed rather than energy
