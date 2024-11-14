class MoviesEntity {
  final String movieName;
  final String movieId;
  final String movieRating;
  final String posterImage;

  MoviesEntity(
      this.movieName, this.movieId, this.movieRating, this.posterImage);
}

List<MoviesEntity> getMovies() {
  return [
    MoviesEntity(
      'The Shawshank Redemption',
      '1',
      '9.3',
      'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg',
    ),
    MoviesEntity('Pulp Fiction', '2', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '3', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '4', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '5', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '6', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '7', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '8', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '9', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '10', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '11', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '12', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '13', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg'),
    MoviesEntity('Pulp Fiction', '14', '9.1',
        'https://image.tmdb.org/t/p/w500/qrwI2T844nrBUv3eDwQZRDdgSFs.jpg')
  ];
}
