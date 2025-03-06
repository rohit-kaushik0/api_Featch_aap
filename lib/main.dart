import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp setup with basic theme and routing to HomePage
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Fetching App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  Future<List<dynamic>>? posts;
  bool _dataFetched = false; // Indicates if data has been fetched

  @override
  void initState() {
    super.initState();
    // Do not fetch data automatically on startup
  }

  // Method to load posts and set the data fetched state.
  Future<void> _loadPosts() async {
    setState(() {
      _dataFetched = true;
      posts = apiService.fetchPosts();
    });
    await posts;
  }

  // Refresh posts using pull-to-refresh.
  Future<void> _refreshPosts() async {
    setState(() {
      posts = apiService.fetchPosts();
    });
    await posts;
  }

  // Reset to initial state (no data displayed)
  void _resetState() {
    setState(() {
      _dataFetched = false;
      posts = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        backgroundColor: Color.fromARGB(255, 182, 181, 220),
        // Show back button only when data is fetched.
        leading:
            _dataFetched
                ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _resetState,
                )
                : null,
        actions:
            _dataFetched
                ? [
                  // Button to manually refresh data
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: _refreshPosts,
                  ),
                ]
                : null,
      ),
      body:
          !_dataFetched
              ? Center(
                child: ElevatedButton(
                  child: Text("Fetch Data"),
                  onPressed: _loadPosts,
                ),
              )
              : FutureBuilder<List<dynamic>>(
                future: posts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No posts available"));
                  } else {
                    return RefreshIndicator(
                      onRefresh: _refreshPosts,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: ListTile(
                              title: Text(snapshot.data![index]['title']),
                              subtitle: Text(snapshot.data![index]['body']),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
    );
  }
}
