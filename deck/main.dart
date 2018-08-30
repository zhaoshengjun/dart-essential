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

  Card({this.suit, this.rank});

  toString() {
    return "$suit - $rank";
  }
}

class Deck {
  List<Card> cards = [];

  Deck() {
    Suit.values.forEach((s) {
      Rank.values.forEach((r) {
        cards.add(new Card(suit: s, rank: r));
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

  deal(int size) {
    var hand = cards.sublist(0, size);
    cards.removeRange(0, size);
    return hand;
  }

  removeCard(Rank rank, Suit suit) {
    cards.removeWhere((card) => card.suit == suit && card.rank == rank);
  }
}

void main() {
  var deck = new Deck();
  print(deck.cards.length);
  var hand = deck.deal(5);
  print(deck.cards.length);
  print(hand.toString());
}
