import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'SF Pro'),
      home: const ChatHomePage(),
    );
  }
}

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF9DB4C8), Color(0xFFB8A8D8), Color(0xFF1A1A1A)],
            stops: [0.0, 0.3, 0.6],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search, color: Colors.white70, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Search...',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white70),
                  ],
                ),
              ),

              // Header text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Let's Stay\nConnected",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),
              ),

              // Story circles
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    _buildAddStory(),
                    _buildStoryCircle(
                      'Adison',
                      'https://i.pravatar.cc/150?img=1',
                    ),
                    _buildStoryCircle(
                      'Charlie',
                      'https://i.pravatar.cc/150?img=2',
                    ),
                    _buildStoryCircle(
                      'James',
                      'https://i.pravatar.cc/150?img=3',
                    ),
                    _buildStoryCircle(
                      'Kate',
                      'https://i.pravatar.cc/150?img=4',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Chat list
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 20),
                    children: [
                      _buildChatItem(
                        name: 'Adison Lubin',
                        message: 'Do you want to grab coffee this weekend?',
                        time: 'Just Now',
                        avatar: 'https://i.pravatar.cc/150?img=1',
                        isOnline: true,
                      ),
                      _buildChatItem(
                        name: 'James Vetrovs',
                        message: '👍 Let me know if you need anything',
                        time: '3:24 pm',
                        avatar: 'https://i.pravatar.cc/150?img=3',
                        isOnline: true,
                      ),
                      _buildChatItem(
                        name: 'Ashlynn Mango',
                        message: "I'll be a little late, hope that's okay",
                        time: 'Yesterday',
                        avatar: 'https://i.pravatar.cc/150?img=5',
                        isOnline: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddStory() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: const Center(
              child: Icon(Icons.add, color: Colors.white, size: 28),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Add',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCircle(String name, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF9DB4C8), Color(0xFFB8A8D8)],
              ),
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String message,
    required String time,
    required String avatar,
    required bool isOnline,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 28, backgroundImage: NetworkImage(avatar)),
              if (isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
