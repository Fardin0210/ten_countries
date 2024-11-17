import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
double changeFontSize = 0;
void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/animations/Animation - 1731497253668.json'),
      ),
      nextScreen: homePage(),
      duration: 3500,
      backgroundColor: Colors.white,
      splashIconSize: 400,
    );
  }
}

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List countries = [
    {
      'CountryName': 'Afghanistan',
      'Description':
          'Afghanistan,[d] officially the Islamic Emirate of Afghanistan,[e] is a landlocked country located at the crossroads of Central Asia and South Asia. It is bordered by Pakistan to the east and south,[f] Iran to the west, Turkmenistan to the northwest, Uzbekistan to the north, Tajikistan to the northeast, and China to the northeast and east.',
      'CountryImage': 'assets/images/afghanistan.png'
    },
    {
      'CountryName': 'Brazil',
      'Description':
          'Brazil,[b] officially the Federative Republic of Brazil,[c] is the largest and easternmost country in South America and Latin America. It is the worlds fifth-largest country by area and the seventh most populous.',
      'CountryImage': 'assets/images/brazil.png'
    },
    {
      'CountryName': 'Canada',
      'Description':
          'Canada is a country in North America. Its ten provinces and three territories extend from the Atlantic Ocean to the Pacific Ocean and northward into the Arctic Ocean, making it the worlds second-largest country by total area, with the worlds longest coastline.',
      'CountryImage': 'assets/images/canada.png'
    },
    {
      'CountryName': 'France',
      'Description':
          'France,[a] officially the French Republic,[b] is a country located primarily in Western Europe. Its overseas regions and territories include French Guiana in South America, Saint Pierre and Miquelon in the North Atlantic, the French West Indies, and many islands in Oceania and the Indian Ocean, giving it one of the largest discontiguous exclusive economic zones in the world.',
      'CountryImage': 'assets/images/france.png'
    },
    {
      'CountryName': 'Germany',
      'Description':
          'Germany,[e] officially the Federal Republic of Germany,[f] is a country in Central Europe. It lies between the Baltic and North Sea to the north and the Alps to the south. Its sixteen constituent states have a total population of over 82 million in an area of 357,596 km2 (138,069 sq mi), making it the most populous member state of the European Union.',
      'CountryImage': 'assets/images/germany.png'
    },
    {
      'CountryName': 'Italy',
      'Description':
          'Italy,[a] officially the Italian Republic,[b] is a country in Southern[12] and Western[13][c] Europe. It consists of a peninsula that extends into the Mediterranean Sea, with the Alps on its northern land border, as well as nearly 800 islands, notably Sicily and Sardinia.',
      'CountryImage': 'assets/images/italy.png'
    },
    {
      'CountryName': 'Russia',
      'Description':
          'Russia,[b] or the Russian Federation,[c] is a country spanning Eastern Europe and North Asia. It is the largest country in the world by area, extending across eleven time zones and sharing land borders with fourteen countries',
      'CountryImage': 'assets/images/russia.png'
    },
    {
      'CountryName': 'Switzerland',
      'Description':
          'Switzerland, officially the Swiss Confederation, is a landlocked country located in west-central Europe.[d][13] It is bordered by Italy to the south, France to the west, Germany to the north, and Austria and Liechtenstein to the east.',
      'CountryImage': 'assets/images/swiss.png'
    },
    {
      'CountryName': 'Turkey',
      'Description':
          'Turkey,[a] officially the Republic of Türkiye,[b] is a country mainly located in Anatolia in West Asia, with a smaller part called East Thrace in Southeast Europe. ',
      'CountryImage': 'assets/images/turkey.png'
    },
    {
      'CountryName': 'USA',
      'Description':
          'The United States of America (USA), commonly known as the United States (U.S.) or America, is a country primarily located in North America. It is a federal union of 50 states and a federal capital district, Washington, D.C.',
      'CountryImage': 'assets/images/usa.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              accountName: Text("Username"),
              accountEmail: Text(
                "username@gmail.com",
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => shareScreen()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Share'),
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    SystemNavigator.pop();
                  },
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text(
                      "Exit",
                    ),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 'Share') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => shareScreen()));
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          var note = countries[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(note['CountryImage'],
                  width: 50, height: 50, fit: BoxFit.cover),
              title: Text(note['CountryName']),
              subtitle: Text(note['Description']),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CountryDetailPage(country: countries[index])));
              },
            ),
          );
        },
      ),
    );
  }
}

class settingsPage extends StatefulWidget {
  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontFamily: 'Source Sans Pro'),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Language changed')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            onTap: () {
              // عمل تغییر حالت تاریک یا روشن
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('The dark mode activated')),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notifications changed')),
              );
            },
          ),
          Column(
            children: [
              Text("ChangeFontSize"),
              SizedBox(height: 10,),
              Slider(value: changeFontSize, min: 0, max: 56, onChanged: (newFontSize) {
                setState(() {
                  changeFontSize = newFontSize;
                });
              }),
              SizedBox(height: 10,),
              Text('${changeFontSize.toStringAsFixed(0)}%'),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Text(
              'About this Application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'این اپلیکیشن برای کمک به کاربران در انجام کارهای مختلف طراحی شده است. تیم توسعه‌دهنده این اپلیکیشن از تخصص‌های مختلف استفاده کرده است تا تجربه کاربری بهتری فراهم کند.',
              style: TextStyle(fontSize: 16, fontFamily: 'Kalameh'),
            ),
            SizedBox(height: 20),
            Text(
              'Flutter development: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Flutter team: ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Social Media Pages:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Instagram'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Instagram link clicked')));
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Twitter'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Twitter link clicked')));
              },
            ),
            SizedBox(height: 20),
            Text(
              'Contact: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: Fardin1010@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone Number: +93729856080',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'ما همیشه آماده دریافت پیشنهادات شما هستیم',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ارتباط با ما'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            // عنوان صفحه ارتباط با ما
            Text(
              'راه‌های ارتباطی:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // ایمیل
            ListTile(
              leading: Icon(Icons.email),
              title: Text('ارسال ایمیل'),
              onTap: () {
                _launchURL('mailto:support@flutterapp.com');
              },
            ),
            SizedBox(height: 20),

            // تماس تلفنی
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('تماس تلفنی'),
              onTap: () {
                _launchURL('tel:+1234567890');
              },
            ),
            SizedBox(height: 20),

            // آدرس وب‌سایت
            ListTile(
              leading: Icon(Icons.web),
              title: Text('بازدید از وب‌سایت'),
              onTap: () {
                _launchURL('https://www.flutterapp.com');
              },
            ),
            SizedBox(height: 20),
            Text(
              'ارسال پیام:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'پیام خود را بنویسید...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('پیام شما ارسال شد')),
                );
              },
              child: Text('ارسال پیام'),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryDetailPage extends StatelessWidget {
  final Map<String, dynamic> country;

  CountryDetailPage({required this.country});

  void launchURL() async {
    const url = 'https://www.wikipedia.org';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country['CountryName']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              country['CountryImage'],
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            // نام کشور
            Text(
              country['CountryName'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              country['Description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  launchURL();
                },
                child: Text(
                  "More details",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class shareScreen extends StatelessWidget {
  final Uri url = Uri.parse(appLink);

  static String get appLink => '';

  void launchURL() async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $appLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            'Share Screen',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Source Sans Pro',
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            launchURL();
          },
          child: Text(
            'Share the app',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 15,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

