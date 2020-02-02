import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/AvilableProduct.dart';
import 'AvilableProduct.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

void main() => runApp(MaterialApp(
    home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /*drawer: Drawer(
            child: ListView(
                children: <Widget>[
                    DrawerHeader(
                        decoration: BoxDecoration(
                            //image: DecorationImage(
                                //image: NetworkImage('https://www.infokatowice.pl/wp-content/uploads/2015/06/DSC_0076-e1437289760965.jpg'),
                                //fit: BoxFit.fill,
                            //),
                          color: Colors.brown,
                        ),
                        padding: new EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: Container(
                          child: Row(

                          ),
                        ),
                    ),
                    ListTile(
                      title: Text('Dania'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dishes()),
                        );
                      },
                    ),

                ],
            ),
        ),*/
        appBar: AppBar(

            title: Text('Ślązaczka',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.grey[100],
            ),
        ),
          centerTitle: true,
          backgroundColor: Colors.brown,
          actions: <Widget>[
            FlatButton(
              color: Colors.brown,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Row(
                children: <Widget>[
                  Text('Zaloguj się ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                //image: NetworkImage('https://i.pinimg.com/originals/3c/4a/b8/3c4ab88106f5eb26d192f7e2f2bc1507.jpg'),
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: ListView(

                children: <Widget>[
                  Container(
                    color: Color.fromRGBO(0, 0, 0, 190),
                      height: 200,
                   ),
                  Container(
                      color: Color.fromRGBO(0, 0, 0, 190),
                      height: 150,
                      child: Center(
                          child: Container(

                            child: Column(
                              children: <Widget>[
                                Text('Śląskie jedzenie',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 50.0,

                                  ),
                                ),
                                Text('Najlepsze jedzenie w województwie',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 1,
                                    color: Color.fromRGBO(255, 255, 204, 1),
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                    ),
                    Container(
                        color: Color.fromRGBO(0, 0, 0, 190),
                        height: 160,
                    ),
                  Container(
                    color: Color.fromRGBO(0, 0, 0, 190),
                    height: 100,
                    child: Center(
                      child: Container(
                        child: Icon(Icons.arrow_downward, size: 40, color: Colors.white,),
                      )
                    ),
                  ),
                    Container(
                        height: 800,
                        color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(
                            height: 20,
                          ),
                          Text('Ogłoszenia restauracyjne',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.calendar_today),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('Poniedziałek - Piątek'),
                                      Text('14.30 - 16.00'),
                                      Text('Do zestawu z kluskami dodajemy ciasto dnia'),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.calendar_today,color: Colors.green,),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('Sobota - Niedziela',
                                        style: TextStyle(

                                        ),
                                      ),
                                      Text('12.00 - 16.00'),
                                      Text('Do zamówień powyżej 60zł dodajemy porcję '),
                                      Text('klusek za free'),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.calendar_today, color: Colors.redAccent,),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('Co jeszcze?'),
                                      Text('Dowozimy posiłki.'),
                                      Text('     Oferujemy również catering na imprezy     '),
                                      Text('okolicznościowe'),
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                ],
            ),
        ),
    );
  }
}
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  List<Map> data;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  void initState() {
    getUserData();

    super.initState();
  }

  void showError() {
    AlertDialog dialog = new AlertDialog(
      title: Text('Błąd'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Nie prawidłowy email lub hasło'),
          //Text(data[0]['password']),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'),
        ),
      ],
    );

    showDialog(context: context, child: dialog);
  }

  void getUserData() async {
    //var tmp = await get('http://25.63.58.83:3000/api/v1/users');
    var tmp = await get('http://192.168.43.120:3000/api/v1/users');
    data = readJsonString(tmp.body);
  }


  List<Map> readJsonString(String json) {
      String tmp = "";
      String tmpJson = json.substring(1);

      List<Map> result = new List<Map>();
      for(int i=0;i<tmpJson.length-1;i++) {
        if(tmpJson[i] == '}' && (tmpJson[i+1] == ','||tmpJson[i+1]==']')) {
          tmp+='}';
          result.add(jsonDecode(tmp));
          tmp = "";
          i++;
        }
        else {
          tmp += tmpJson[i];
        }
      }
      return result;
    }

    bool checkUser(String name, String password) {
      for(int i=0;i<data.length;i++) {
        //emailController.text = data[i]['email'];
        if(data[i]['email'] == name.trim()) {
          if(data[i]['password'] == password) {
            return true;
          }
        }
      }
      return false;
    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            leading: RaisedButton(
              color: Colors.brown,
              textColor: Colors.grey[100],
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            title: Text('Ślązaczka',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.grey[100],
              ),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown,
          ),
          body:  ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: SizedBox(
                      height: 200,
                      child: Image(image: AssetImage('assets/logo.webp')),
                        //image: NetworkImage("https://apollo-ireland.akamaized.net/v1/files/yi5dh0vn328b-PL/image;s=644x461"),

                    ),
                  ),

                  Container(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text("Logowanie",
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            onSubmitted: (s) {
                              if(checkUser(emailController.text, passwordController.text)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Bracket()),
                                );
                              }
                              else {
                                showError();
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Hasło',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                              width: 140,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  child: Text('Zaloguj się',
                                    style: TextStyle(
                                      color: Colors.grey[100],
                                    ),
                                  ),
                                  onPressed: () {
                                    if(checkUser(emailController.text, passwordController.text)) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Bracket()),
                                      );
                                    }
                                    else {
                                      //showError();
                                    }
                                  },
                                  color: Colors.brown,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 60,
                              width: 140,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: RaisedButton(
                                  child: Text('Zarejestruj się',
                                    style: TextStyle(
                                      color: Colors.grey[100],
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Register()),
                                    );
                                  },
                                  color: Colors.brown,
                                ),
                              ),
                            ),


                          ],

                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),

        );
    }
}
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var data;
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  void postRegister() async {

    //String url = 'http://25.63.58.83:3000/api/v1/';
    String url = 'http://192.168.43.120:3000/api/v1/';
    Map<String, String> headers = {"Content-type": "application/json"};
    //String json = '{"email": "${email.text}", "first_name": "${firstName.text}", "last_name": "${lastName.text}", "password": "${password.text}", "role": "user';
    String json = '{ "id": 1050, "first_name": "${firstName.text}", "last_name": "${lastName.text}",  "email": "${email.text}","created_at": "2020-01-12T15:18:31.296Z","updated_at": "2020-01-12T15:18:31.296Z","password": "${password.text}","avatar_file_name": null,"avatar_content_type": null,"avatar_file_size": null,"avatar_updated_at": null,"role": "user"}';
    Response response = await post(url, headers: headers, body: json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          color: Colors.brown,
          textColor: Colors.grey[100],
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text('Ślązaczka',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.grey[100],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text('Imię: '),
                    ),
                    Expanded(
                      flex: 7,
                      child: TextField(
                        controller: firstName,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text('Nazwisko: '),
                    ),
                    Expanded(
                      flex: 7,
                      child: TextField(
                        controller: lastName,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text('Email: '),
                    ),
                    Expanded(
                      flex: 7,
                      child: TextField(
                        controller: email,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text('Hasło: '),
                    ),
                    Expanded(
                      flex: 7,
                      child: TextField(
                        obscureText: true,
                        controller: password,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    postRegister();
                    Navigator.pop(context);
                  },
                  textColor: Colors.grey[100],
                  color: Colors.brown,
                  child: Text('Zarejestruj się'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





class Bracket extends StatefulWidget {
  @override
  _BracketState createState() => _BracketState();
}

class _BracketState extends State<Bracket> {

  var data;
  List<AvilableProduct> bracket = [];
  List<AvilableProduct> products = [
    /*AvilableProduct(
      name: 'Kluski śląskie',
      description: '',
      price: 20
    ),
    AvilableProduct(
        name: 'Wodzionka',
        description: 'Najlepsza ze wszystkich śląskich zup',
        price: 15
    ),*/
  ];

  List<Text> resultString = new List<Text>();
  List<String> names = new List<String>();
  List<double> unitPrice= new List<double>();
  List<int> amount = new List<int>();


  double price = 0;
  @override
  void initState() {
    getFoodData();

    super.initState();
  }


  void getFoodData() async {
    //data = await get('http://25.63.58.83:3000/api/v1/foods');
    data = await get('http://192.168.43.120:3000/api/v1/foods');
    assignProducts(readJsonString(data.body));
  }


  List<String> readJsonString(String json) {
    String tmp = "";
    String tmpJson = json.substring(1);

    List<String> result = new List<String>();
    for(int i=0;i<tmpJson.length-1;i++) {
      if(tmpJson[i] == '}' && (tmpJson[i+1] == ','||tmpJson[i+1]==']')) {
        tmp+='}';
        result.add(tmp);
        tmp = "";
        i++;
      }
      else {
        tmp += tmpJson[i];
      }
    }
    return result;
  }
  void assignProducts(List<String> maps) {
    Map tmp;
     setState(() {
       for(int i=0;i<maps.length;i++) {
         tmp = jsonDecode(maps.elementAt(i));
         products.add(new AvilableProduct(name: tmp['name'], description: tmp['description'], price: tmp['price']));
       }
   });

  }

  void updateBracket() {
    price = 0;
    double tmp = 0;
    for(int i=0;i<bracket.length;i++) {
      tmp += bracket.elementAt(i).price;
    }
    setState(() {
      price = tmp;
    });
  }

  List<Text> cumulateBracketSums() {

    for(int i=0;i<bracket.length;i++){
      if(names.contains(bracket.elementAt(i).name)) {
        amount[names.indexOf(bracket.elementAt(i).name)] += 1;
      }
      else {

        names.add(bracket.elementAt(i).name);
        unitPrice.add(bracket.elementAt(i).price);
        amount.add(1);
      }
    }
    for(int i=0;i<names.length;i++) {
      double tmp = amount[i] * unitPrice[i];
      resultString.add(Text(amount[i].toString() + "x " + names[i] + ", " + tmp.toString() +" zł"));
    }
    return resultString;
  }

  void postOrder() async {

    String url = 'http://192.168.43.120:3000/api/v3/';
    Map<String, String> headers = {"Content-type": "application/json"};
    //String json = '{"email": "${email.text}", "first_name": "${firstName.text}", "last_name": "${lastName.text}", "password": "${password.text}", "role": "user';
    /*String json = '[';
    for(int i=0;i<bracket.length;i++) {
      json += '{"name": "${names.elementAt(i)}", "quantity": "${amount.elementAt(i)}"';
    }
    json += ']';*/
    String json = '{"first_name": "Sebastian","last_name": "Soja","email": "seba5152@wp.pl","created_at": "2020-01-12T15:18:31.296Z","updated_at": "2020-01-12T15:18:31.296Z","password": "janpawel2","avatar_file_name": null,"avatar_content_type": null,"avatar_file_size": null,"avatar_updated_at": null, "role": "admin"}';

    Response response = await post(url, headers: headers, body: json);
  }

  void showBuyMenu() {
    AlertDialog dialog = new AlertDialog(
      title: Text('Potwierdź zakup'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: cumulateBracketSums().toList(),
      ),
      actions: <Widget>[
        ButtonBar(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                postOrder();
                Navigator.pop(context);
              },
              child: Text('Potiwerdź'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Anuluj'),
            ),
          ],
          alignment: MainAxisAlignment.center,
        ),
      ],
    );

    showDialog(context: context, child: dialog);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          color: Colors.brown,

          textColor: Colors.grey[100],
          child: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text('Ślązaczka',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.grey[100],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              ExpansionTile(
                backgroundColor: Colors.amberAccent,
                title: Text('Koszyk '),
                subtitle: Text('$price zł'),
                children: bracket.map((bracketItem) => Card(
                  color: Colors.amber,
                  child: ListTile(
                    title: Text('${bracketItem.name}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        int i = bracket.indexOf(bracketItem);
                        bracket.removeAt(i);
                        updateBracket();
                      },
                    ),
                  ),
                )).toList(),

              ),
              Column(
                children: products.map((product) => Card(
                  child: ListTile(
                    title: Text('${product.name}'),
                    subtitle: Text('${product.description}'),
                    trailing: Text('${product.price} zł'),
                    onTap: () {
                      bracket.add(new AvilableProduct(
                        name: product.name,
                        description: product.description,
                        price: product.price
                      ));
                      updateBracket();
                    },
                  ),
                )).toList(),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showBuyMenu();
        },
        label: Text('Złóż zamówienie'),
        icon: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.amber,
      ),
    );
  }
}



