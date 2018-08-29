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

  toString() {
    return "$suit - $rank";
  }
}

class Deck {
  List<Card> cards = [];

  Deck() {
    Suit.values.forEach((s) {
      Rank.values.forEach((r) {
        cards.add(new Card(s, r));
      });
    });
  }

  toString() {
    return cards.toString();
  }

  printCards() {}
  shuffle() {
    cards.shuffle();
  }

  cardsWithSuit(Suit suit) {
    return cards.where((card) => card.suit == suit);
  }

  deal() {}
  removeCard() {}
}

void main() {
  var deck = new Deck();
  deck.shuffle();
  print(deck.cardsWithSuit(Suit.Diamond));
}
