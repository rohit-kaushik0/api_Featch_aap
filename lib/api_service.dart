import 'dart:convert';
import 'package:http/http.dart' as http;

// ApiService handles API calls to fetch post data.
class ApiService {
  // API endpoint URL for fetching posts.
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  // Fetch posts from the given API.
  Future<List<dynamic>> fetchPosts() async {
    try {
      // Execute a GET request to the API.
      final response = await http.get(Uri.parse(url));
      // Check if the request was successful.
      if (response.statusCode == 200) {
        // Decode the JSON response and return the list of posts.
        return jsonDecode(response.body);
      } else {
        // Throw an exception if the server did not return a 200 OK response.
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      // Catch and rethrow any errors that occur during the fetch process.
      throw Exception("Error: $e");
    }
  }
}
