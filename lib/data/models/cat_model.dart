class Cat {
  final String id;
  final String imageUrl;
  final String breedName;
  final String? description;
  final String? origin;
  final String? temperament;
  final String? lifeSpan;
  final DateTime? likedAt;

  Cat({
    required this.id,
    required this.imageUrl,
    required this.breedName,
    this.description,
    this.origin,
    this.temperament,
    this.lifeSpan,
    this.likedAt,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'],
      imageUrl: json['url'],
      breedName: json['breeds'].isNotEmpty ? json['breeds'][0]['name'] : 'Unknown',
      description: json['breeds'].isNotEmpty ? json['breeds'][0]['description'] : null,
      origin: json['breeds'].isNotEmpty ? json['breeds'][0]['origin'] : null,
      temperament: json['breeds'].isNotEmpty ? json['breeds'][0]['temperament'] : null,
      lifeSpan: json['breeds'].isNotEmpty ? json['breeds'][0]['life_span'] : null,
      likedAt: null,
    );
  }

  Cat copyWith({
    DateTime? likedAt,
  }) {
    return Cat(
      id: id,
      imageUrl: imageUrl,
      breedName: breedName,
      description: description,
      origin: origin,
      temperament: temperament,
      lifeSpan: lifeSpan,
      likedAt: likedAt ?? this.likedAt,
    );
  }
}
