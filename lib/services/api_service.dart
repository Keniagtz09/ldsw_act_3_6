import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  // URL pública de prueba para catálogo de películas
  final String _url = 'https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies.json';

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        
        // Tomamos una muestra de películas que contengan título
        return data.take(20).map((jsonItem) {
          return Movie(
            title: jsonItem['title'] ?? 'Sin título',
            posterPath: 'https://picsum.photos/300/450?random=${jsonItem['title'].hashCode}',
          );
        }).toList();
      } else {
        return _getFallbackMovies();
      }
    } catch (e) {
      // Si la red falla, cargamos catálogo local de demostración
      return _getFallbackMovies();
    }
  }

  // Lista local de demostración para garantizarte ver el catálogo en pantalla
  List<Movie> _getFallbackMovies() {
    return [
      Movie(title: 'Parasite', posterPath: 'https://picsum.photos/300/450?random=1'),
      Movie(title: 'Decision to Leave', posterPath: 'https://picsum.photos/300/450?random=2'),
      Movie(title: 'Oldboy', posterPath: 'https://picsum.photos/300/450?random=3'),
      Movie(title: 'Memories of Murder', posterPath: 'https://picsum.photos/300/450?random=4'),
      Movie(title: 'Drive My Car', posterPath: 'https://picsum.photos/300/450?random=5'),
      Movie(title: 'Burning', posterPath: 'https://picsum.photos/300/450?random=6'),
    ];
  }
}