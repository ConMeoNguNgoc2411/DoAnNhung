import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green[700],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  'Đom Đóm Team',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Các mục trong menu
            buildMenuItem(
              context,
              text: "Thông tin nhóm",
              icon: Icons.people,
              page: const GroupInfoScreen(),
            ),
            buildMenuItem(
              context,
              text: "Thông tin phần mềm",
              icon: Icons.info_outline,
              page: SoftwareInfoScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      BuildContext context, {
        required String text,
        required IconData icon,
        required Widget page,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        tileColor: Colors.green[500],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}

class GroupInfoScreen extends StatelessWidget {
  const GroupInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'THÀNH VIÊN ĐOM ĐÓM',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: const [
            BuildListTitle(
              title: "Nguyễn Thanh Phú",
              imageUrl: 'assets/images/anime1.jpg',
              phoneNumber: "0123456789",
              email: "phu@example.com",
              address: "Hồ Chí Minh, Việt Nam",
            ),
            BuildListTitle(
              title: "Nguyễn Thanh Tùng",
              imageUrl: 'assets/images/anime2.jpg',
              phoneNumber: "0123456789",
              email: "tung@example.com",
              address: "Hà Nội, Việt Nam",
            ),
            BuildListTitle(
              title: "Nguyễn Tuấn Huy",
              imageUrl: 'assets/images/anime3.jpg',
              phoneNumber: "0123456789",
              email: "huy@example.com",
              address: "Đà Nẵng, Việt Nam",
            ),
            BuildListTitle(
              title: "Vương Quang Đông",
              imageUrl: 'assets/images/anime4.jpg',
              phoneNumber: "0123456789",
              email: "dong@example.com",
              address: "Cần Thơ, Việt Nam",
            ),
            BuildListTitle(
              title: "Tống Hữu Thắng",
              imageUrl: 'assets/images/anime5.jpg',
              phoneNumber: "0123456789",
              email: "thang@example.com",
              address: "Huế, Việt Nam",
            ),
            BuildListTitle(
              title: "Nguyễn Minh Trí",
              imageUrl: 'assets/images/anime6.jpg',
              phoneNumber: "0123456789",
              email: "tri@example.com",
              address: "Nha Trang, Việt Nam",
            ),
          ],
        ),
      ),
    );
  }
}


class BuildListTitle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String phoneNumber;
  final String email;
  final String address;

  const BuildListTitle({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.cyan[100],
          backgroundImage: AssetImage(imageUrl),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(
                name: title,
                imageUrl: imageUrl,
                phoneNumber: phoneNumber,
                email: email,
                address: address,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String phoneNumber;
  final String email;
  final String address;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(height: 20),
            Text('Name: $name', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Phone: $phoneNumber', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Email: $email', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Address: $address', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}


class SoftwareInfoScreen extends StatelessWidget {
  const SoftwareInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin phần mềm'),
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: Text(
          'Đây là thông tin phần mềm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
