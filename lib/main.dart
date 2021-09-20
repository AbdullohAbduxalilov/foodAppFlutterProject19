import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// password 12345
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your user name",
                        labelText: "username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return "enter more than 4 symbols";
                        }
                      },
                      onSaved: (e) {
                        setState(() {
                          username = e;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        labelText: "password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return "enter more than 4 symbols";
                        }
                      },
                      onSaved: (e) {
                        setState(() {
                          password = e;
                        });
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (password == "12345") {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  // String? username;
  // HomePage(this.username);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> bottomBar = [
    BottomHomePage(),
    SavedPage(index: 1,typeOfFood: "pizza",priceList: "45",cardList: [],),
    ProfilePage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bottomBar[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (e) {
          setState(() {
            currentIndex = e;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bookmark_solid),
            label: "Saved",
            activeIcon: Icon(
              CupertinoIcons.bookmark_solid,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
            activeIcon: Icon(
              Icons.person,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ellipsis), label: "More"),
        ],
      ),
    );
  }
}

class BottomHomePage extends StatefulWidget {
  const BottomHomePage({Key? key}) : super(key: key);

  @override
  _BottomHomePageState createState() => _BottomHomePageState();
}

class _BottomHomePageState extends State<BottomHomePage> {
  List<String> typeOfFood = [
    "Chicken ",
    "shashlik",
    "Osh",
    "Norin",
    "Somsa",
    "Baliq",
    "Qozon kabob"
  ];

  List<String> priceList = [
    "15",
    "23",
    "44",
    "33",
    "24",
    "54",
    "12",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: "Search for food",
                labelText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade300,
              ),
              validator: (value) {
                if (value!.length < 4) {
                  return "enter more than 4 symbols";
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Text(
              "Let's order ",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Your Favourite food ",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 9,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        onPressed: () {},
                        child: Text(
                          "$index",
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: typeOfFood.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  index, typeOfFood[index], priceList[index])));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${priceList[index]}",
                                style: TextStyle(
                                  fontSize: 50.0,
                                ),
                              ),
                              Text(
                                "${typeOfFood[index]}",
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SavedPage extends StatefulWidget {
  int? index;
  String? priceList;
  String? typeOfFood;
  List<List<String>>? cardList;

  SavedPage({this.index, this.priceList, this.typeOfFood, this.cardList});

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<List<String>> cardsList2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Page"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: widget.cardList!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text("${widget.cardList![index][0]}"),
                  title:  Text("${widget.cardList![index][0]}"),
                  trailing: Text("${widget.cardList![index][0]}"),
                ),
              );
            }),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> titleList = [
    "username",
    "my payment Card",
    "my password",
    "my history",
    "others",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile Page"),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "img",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Row(
                    children: [
                      Text("${titleList[index]}"),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: Center(
        child: Text(
          "Download the latest version of our app",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  int? index;
  String? typeOfFood;
  String? priceList;

  DetailPage(this.index, this.typeOfFood, this.priceList);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<List<String>> cardList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "\$${widget.priceList}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {

                      cardList.add([
                        widget.index.toString(),
                        widget.priceList.toString(),
                        widget.typeOfFood.toString()
                      ]);
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SavedPage(
                            index: widget.index,
                            priceList: widget.priceList,
                            typeOfFood: widget.typeOfFood,
                            cardList: cardList),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Container(
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: Text(
                  "${widget.typeOfFood}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50.0,
              ),
              Text(
                "Ingridients",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 9,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                          onPressed: () {},
                          child: Text(
                            "$index",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50.0,
              ),
              Text(
                "Details",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50.0,
              ),
              Text(
                """
This is the most delicious food
in the world. The Chefs of
it's builders are very famous throughoutthe world. We will
garante for our quality.                 
                """,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BuyPage(
                          widget.index,
                          widget.priceList,
                          widget.typeOfFood,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      "Want to buy!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyPage extends StatefulWidget {
  int? index;
  String? priceList;
  String? typeOFfood;

  BuyPage(this.index, this.priceList, this.typeOFfood);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  int dona = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Price:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                    Text(
                      "\$${dona * int.parse(widget.priceList.toString())}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                      onPressed: () {
                        setState(() {
                          dona = dona - 1;
                        });
                      },
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "$dona",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                      onPressed: () {
                        setState(() {
                          dona = dona + 1;
                        });
                      },
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CardPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      "choose Payment method",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<String> cardName = [
    "Visa",
    "Master Cars",
    "Humo",
    "Uzcard",
    "Web Money",
    "Qiwi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment method"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 500.0,
                child: ListView.builder(
                    itemCount: cardName.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text("$index"),
                          ),
                          title: Text("${cardName[index]}"),
                        ),
                      );
                    }),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Thank for ordering",
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                          content: Container(
                            height: 50.0,
                            child: Column(
                              children: [
                                Text(
                                  "Kep turing",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Text(
                    "Order",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class Saved{
  String? index;
  String? price;
  String? typeOfFood;

  Saved(this.index,this.price,this.typeOfFood);
}