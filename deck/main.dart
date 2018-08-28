enum Rank {
  Ace,
  Jack,
  Queen,
  King,
  One,
  Two,
  Three,
  Four,
  Five,
  Six,
  Seven,
  Eight,
  Night,
  Ten
}
enum Suit { Diamond, Heart, Club, Spade }

class Card {
  Suit suit;
  Rank rank;

  Card(this.suit, this.rank);
}

class Deck {
  List<Card> cards;

  Deck() {
    Suit.values.forEach((s) {
      Rank.values.forEach((r) {
        cards.add(new Card(s, r));
      });
    });
  }

  printCards() {}
  shuffle() {}

  deal() {}
  removeCard() {}
}
