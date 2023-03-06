import 'package:useradgents_burger/domain/entities/burger.dart';
import 'package:useradgents_burger/domain/entities/order.dart';

const responseGetBurgersJson = """
[
    {
        "ref": "1",
        "title": "The Big Burger",
        "description": "Un classique mais tellement bon.",
        "thumbnail": "https://uad.io/bigburger/images/1.png",
        "price": 92820
    },
    {
        "ref": "2",
        "title": "The Big Cheese Burger",
        "description": "Avec du fromage 🧀 c'est toujours meilleur.",
        "thumbnail": "https://uad.io/bigburger/images/2.png",
        "price": 12830
    }
]
""";

const burgerJson = """
{
    "ref": "1",
    "title": "The Big Burger",
    "description": "Un classique mais tellement bon.",
    "thumbnail": "https://uad.io/bigburger/images/1.png",
    "price": 92820
}
""";

const Burger burger1 = Burger(
  ref: "1",
  title: "The Big Burger",
  description: "Un classique mais tellement bon.",
  thumbnail: "https://uad.io/bigburger/images/1.png",
  price: 92820,
);

const List<Burger> burgers = [
  Burger(
    ref: "1",
    title: "The Big Burger",
    description: "Un classique mais tellement bon.",
    thumbnail: "https://uad.io/bigburger/images/1.png",
    price: 92820,
  ),
  Burger(
    ref: "2",
    title: "The Big Cheese Burger",
    description: "Avec du fromage 🧀 c'est toujours meilleur.",
    thumbnail: "https://uad.io/bigburger/images/2.png",
    price: 12830,
  ),
];


const Order order1 = Order(
  burger: burger1,
  quantity: 2,
);

const Order order2 = Order(
  burger: burger1,
  quantity: 4,
);