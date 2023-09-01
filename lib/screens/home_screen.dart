import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = Post.posts;

  @override
  Widget build(BuildContext context) {
    Post? post = ModalRoute.of(context)!.settings.arguments as Post?;
    if (post != null) posts.insert(0, post);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
              },
              style: TextButton.styleFrom(
                fixedSize: const Size(100, 50),
              ),
              child: Text(
                'For You',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                fixedSize: const Size(100, 50),
              ),
              child: Text(
                'Following',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: posts.map((post) {
                return CustomVideoPlayer(post: post);
              }).toList(),
            ),
          ),
        ],
      ),
    );

  }
}







