import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> profileImages = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/6.png",
    "assets/images/8.png",
  ];
  List<String> posts = [
    "assets/images/post3.png",
    "assets/images/post1.png",
    "assets/images/post2.png",
    "assets/images/post4.png",
    "assets/images/post3.png",
    "assets/images/post3.png",
    "assets/images/post3.png",
    "assets/images/post3.png",
  ];

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: SizedBox(
          height: 32,
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Story section
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: profileImages.length,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 33,
                                  backgroundImage: AssetImage(
                                    'assets/images/Story ring.png',
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    profileImages[index],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Profile Name",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
              Divider(),
              // Posts
              Column(
                children: List.generate(
                  posts.length,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundImage: AssetImage(
                                    'assets/images/Story ring.png',
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 12,
                                  backgroundImage: AssetImage(
                                    profileImages[index],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Profile Name',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height:
                            400, // Increase or decrease this value as desired
                        child: Image.asset(
                          posts[index],
                          fit:
                              BoxFit
                                  .cover, // Ensures it fills the box proportionally
                        ),
                      ),
                      //FOOTER POSTS
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),

                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.label_outline),
                            onPressed: () {},
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.bookmark_border),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: 'Liked by'),
                                  TextSpan(
                                    text: ' Profile Name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: ' and '),
                                  TextSpan(
                                    text: '102 others',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Profile Name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' This is the most amazing picture ever put on Instagram !',
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'View all 12 comments',
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
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
}
