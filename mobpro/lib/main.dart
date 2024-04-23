import 'package:flutter/material.dart';
import 'package:mobpro/calendar_page.dart';
import 'home_page.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Poppins"
      ),
      home: const DismissKeyboard(
          child: HomePage()
      ),
    );
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}

class EventCardWithImage extends StatelessWidget {
  final Event event;
  final ImageProvider image;
  final VoidCallback onTap;

  EventCardWithImage({required this.event, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(event.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 5),
                Text(event.dateAndTime),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text(event.location),
              ],
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Bagian 1: Banner Wallpaper
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFB70000).withOpacity(0.8), 
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3), 
                        image: DecorationImage(
                          image: AssetImage("assets/images/cat.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Walid, 20',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserat',
                      ),
                    ),
                   
                    Text(
                      'UI/UX Designer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Edit User Profile"),
                            Icon(Icons.edit),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("History Event"),
                            Icon(Icons.history),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late String previousMonth;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    previousMonth = DateFormat('MMMM').format(now);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentMonth = DateFormat('MMMM').format(now);

    if (currentMonth != previousMonth) {
      previousMonth = currentMonth;

      String formattedDate = DateFormat('MMMM y').format(now);
      return Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'History Page',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), 
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFB70000).withOpacity(0.8), 
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                formattedDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Display event cards
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return EventCardHistory(
                    event: events[index],
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'History Page',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), 
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFB70000).withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                DateFormat('MMMM y').format(now),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Display event cards
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return EventCardHistory(
                    event: events[index],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}

class EventCardHistory extends StatelessWidget {
  final Event event;

  EventCardHistory({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(event.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 5),
                Text(event.dateAndTime),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text(event.location),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddressPage()));
        },
      ),
    );
  }
}

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addresses'),
      ),
      body: Center(
        child: Text('This is the Addresses Page'),
      ),
    );
  }
}


class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Page'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(
            event: events[index],
          );
        },
      ),
    );
  }
}

class Event {
  final String name;
  final String dateAndTime;
  final String location;
  final String price;
  final bool isReviewed;

  Event({
    required this.name,
    required this.dateAndTime,
    required this.location,
    required this.price,
    required this.isReviewed,
  });
}

List<Event> events = [
  Event(
    name: 'Webinar flutter',
    dateAndTime: 'April 10, 2024 - 10:00',
    location: 'TULT',
    price: '20.000',
    isReviewed: true,
  ),
  Event(
    name: 'Webinar Scrum Master',
    dateAndTime: 'April 15, 2024 - 14:00',
    location: 'GKU',
    price: '20.000',
    isReviewed: false,
  ),
];

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(event.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 5),
                Text(event.dateAndTime),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text(event.location),
              ],
            ),
          ],
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: event.isReviewed ? Colors.green : Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            event.isReviewed ? 'Reviewed' : 'Pending',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          // Action when tapping on the card
        },
      ),
    );
  }
}


class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Workshop Real 100% sukses 1',
      'imageUrl': null,
      'detail': 'Gabunglah dengan kami dalam sesi interaktif ini untuk mendapatkan wawasan mendalam, strategi praktis, dan kiat-kiat terpercaya yang akan membantu Anda mencapai tujuan Anda dengan sukses yang sesungguhnya. Jangan lewatkan kesempatan ini untuk meningkatkan potensi Anda dan mengubah impian Anda menjadi kenyataan! Daftarkan diri Anda sekarang dan jadilah bagian dari perjalanan menuju kesuksesan sejati.',
      'startDate': DateTime(2024, 1, 1, 10, 0),
      'endDate': DateTime(2024, 12, 31, 18, 0),
      'location': 'TULT',
    },
    {
      'title': 'Webinar Keren Gas Join 2',
      'imageUrl': null,
      'detail': 'Bergabunglah dengan para ahli industri untuk mendapatkan wawasan terbaru dan strategi yang efektif dalam menghadapi tantangan bisnis digital saat ini. Segera daftar dan siapkan diri Anda untuk meraih sukses!',
      'startDate': DateTime(2024, 1, 1, 8, 30),
      'endDate': DateTime(2024, 12, 31, 17, 0),
      'location': 'GKU',
    },
    {
      'title': 'Webinar Keren Gas Join 3',
      'imageUrl': null,
      'detail': 'Bergabunglah dengan para ahli industri untuk mendapatkan wawasan terbaru dan strategi yang efektif dalam menghadapi tantangan bisnis digital saat ini. Segera daftar dan siapkan diri Anda untuk meraih sukses!',
      'startDate': DateTime(2024, 1, 1, 8, 30),
      'endDate': DateTime(2024, 12, 31, 17, 0),
      'location': 'GKU',
    },
    {
      'title': 'Webinar Keren Gas Join 4',
      'imageUrl': null,
      'detail': 'Bergabunglah dengan para ahli industri untuk mendapatkan wawasan terbaru dan strategi yang efektif dalam menghadapi tantangan bisnis digital saat ini. Segera daftar dan siapkan diri Anda untuk meraih sukses!',
      'startDate': DateTime(2024, 1, 1, 8, 30),
      'endDate': DateTime(2024, 12, 31, 17, 0),
      'location': 'GKU',
    },
    {
      'title': 'Webinar Keren Gas Join 5',
      'imageUrl': null,
      'detail': 'Bergabunglah dengan para ahli industri untuk mendapatkan wawasan terbaru dan strategi yang efektif dalam menghadapi tantangan bisnis digital saat ini. Segera daftar dan siapkan diri Anda untuk meraih sukses!',
      'startDate': DateTime(2024, 1, 1, 8, 30),
      'endDate': DateTime(2024, 12, 31, 17, 0),
      'location': 'GKU',
    },
    {
      'title': 'Webinar Keren Gas Join 6',
      'imageUrl': null,
      'detail': 'Bergabunglah dengan para ahli industri untuk mendapatkan wawasan terbaru dan strategi yang efektif dalam menghadapi tantangan bisnis digital saat ini. Segera daftar dan siapkan diri Anda untuk meraih sukses!',
      'startDate': DateTime(2024, 1, 1, 8, 30),
      'endDate': DateTime(2024, 12, 31, 17, 0),
      'location': 'GKU',
    },
    {
      'title': 'Webinar Keren Gas Join 7',
      'imageUrl': null,
      'detail': 'Bergabunglah dengan para ahli industri untuk mendapatkan wawasan terbaru dan strategi yang efektif dalam menghadapi tantangan bisnis digital saat ini. Segera daftar dan siapkan diri Anda untuk meraih sukses!',
      'startDate': DateTime(2024, 1, 1, 8, 30),
      'endDate': DateTime(2024, 12, 31, 17, 0),
      'location': 'GKU',
    },
  ];

  late ScrollController _scrollController;
  bool _isLoading = false;
  int _currentPage = 1;
  int _totalPages = 10;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
  if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
      !_scrollController.position.outOfRange) {
    
    if (!_isLoading && _currentPage < _totalPages) {
      setState(() {
        _isLoading = true;
      });
      
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
          _currentPage++;
          
          items.addAll([
            {
              'title': 'New Workshop Real 100% sukses',
              'imageUrl': null,
              'detail': 'New Workshop detail',
              'startDate': DateTime(2025, 1, 1, 10, 0),
              'endDate': DateTime(2025, 12, 31, 18, 0),
              'location': 'New Location',
            },
            {
              'title': 'New Webinar Keren Gas Join',
              'imageUrl': null,
              'detail': 'New Webinar detail',
              'startDate': DateTime(2025, 1, 1, 8, 30),
              'endDate': DateTime(2025, 12, 31, 17, 0),
              'location': 'New Location',
            },
          ]);
        });
      });
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Uploaded Events'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _calculateListItemCount(),
        itemBuilder: (BuildContext context, int index) {
          if (index == items.length) {
            if (_isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          }
          return _buildListItem(index);
        },
      ),
            floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUploadEvent()),
          );
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
              icon: Icon(Icons.calendar_month),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddressPage()),
                );
              },
              icon: Icon(Icons.map_outlined),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReviewPage()),
                );
              },
              icon: Icon(Icons.star),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildListItem(int index) {
  if (index >= items.length) {
    return Container();
  }

  final item = items[index];

  return Card(
    elevation: 3,
    margin: EdgeInsets.all(8),
    child: ListTile(
      title: Text(
        item['title'],
        style: TextStyle(
          color: Colors.lightBlue,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Text(
            'Start: ${_formatDateTime(item['startDate'])}',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            'End: ${_formatDateTime(item['endDate'])}',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            'Location: ${item['location']}',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(Icons.image),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              _editItem(index, context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              elevation: MaterialStateProperty.all(3),
            ),
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 8),
          TextButton(
            onPressed: () {
              _deleteItem(index);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              elevation: MaterialStateProperty.all(3),
            ),
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(item['title']),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Deskripsi: ${item['detail']}'),
                  SizedBox(height: 8),
                  Text('Start Date: ${_formatDateTime(item['startDate'])}'),
                  SizedBox(height: 4),
                  Text('End Date: ${_formatDateTime(item['endDate'])}'),
                  SizedBox(height: 4),
                  Text('Location: ${item['location']}'),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    ),
  );
}

String _formatDateTime(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
}


  int _calculateListItemCount() {
    return _isLoading ? items.length + 1 : items.length;
  }

    void _editItem(int index, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUploadPage(item: items[index])),
    );
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
}




class AddUploadEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Start Date'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'End Date'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'), // Change from 'Price' to 'Location'
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(3),
                ),
                child: Text('Submit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditUploadPage extends StatelessWidget {
  final Map<String, dynamic> item;

  EditUploadPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Upload Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                initialValue: item['title'],
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                initialValue: item['detail'],
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                initialValue: _formatDateTime(item['startDate']),
                decoration: InputDecoration(labelText: 'Start Date'),
              ),
              TextFormField(
                initialValue: _formatDateTime(item['endDate']),
                decoration: InputDecoration(labelText: 'End Date'),
              ),
              TextFormField(
                initialValue: item['location'], // Change from 'Price' to 'Location'
                decoration: InputDecoration(labelText: 'Location'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  elevation: MaterialStateProperty.all(3),
                ),
                child: Text('Save Changes', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }
}


class EventPage extends StatelessWidget {
  final Event event;

  EventPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              event.name,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Text('Date and Time: ${event.dateAndTime}'),
            SizedBox(height: 10.0),
            Text('Location: ${event.location}'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Registration Success'),
                      content: Text('You have successfully registered for this event.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

