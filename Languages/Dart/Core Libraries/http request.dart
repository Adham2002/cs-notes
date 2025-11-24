import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async{
  final request = 'https://dart.dev/f/packages/http.json';
  final url = Uri.parse(request);                                          // Parse the entire URI, including the scheme
  final url2 = Uri.https('dart.dev', '/f/packages/http.json');             // Specifically create a URI with the https scheme

  
  String device = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit';
  String application = '537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36';
  final header = {                                                        // headers need to be stores as a Map<String><String>
    'User-Agent': '${device}/${application}',
    'Content-Type':'application/json'
  };

  final body = await http.read(url);                                       // http.read gets the response body data from the request
  final response = await http.get(url, headers: header);                   // http.get gets the response body and metadata like .statusCode, .headers, .contentLength
  if (response.statusCode == 200){
    print('${response.statusCode} \n${response.body}');
  }

  // Creating Clients
  // this will keep a persistent connection to the server as long as the client is running
  final client = http.Client();
  try {
    final httpPackageInfo = await client.read(url2);
    print(httpPackageInfo);
  } finally {
    client.close();
  }

  // Decoding Retrieved Data
  final responseJSON = json.decode(body) as Map<String, dynamic>;
  print(responseJSON);
}
