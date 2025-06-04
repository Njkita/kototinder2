import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/liked_cats_bloc.dart';
import '../../data/models/cat_model.dart';
import 'cat_details_screen.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Cats'),
        actions: [
          _buildFilterDropdown(context),
        ],
      ),
      body: BlocBuilder<LikedCatsBloc, LikedCatsState>(
        builder: (context, state) {
          if (state is LikedCatsUpdated) {
            final cats = state.filteredCats;
            if (cats.isEmpty) {
              return const Center(child: Text('No liked cats yet'));
            }
            return ListView.builder(
              itemCount: cats.length,
              itemBuilder: (context, index) {
                final cat = cats[index];
                return _buildCatCard(context, cat);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildFilterDropdown(BuildContext context) {
    return BlocBuilder<LikedCatsBloc, LikedCatsState>(
      builder: (context, state) {
        if (state is! LikedCatsUpdated || state.cats.isEmpty) {
          return const SizedBox();
        }

        final breeds = state.cats
            .map((cat) => cat.breedName)
            .toSet()
            .toList()
          ..insert(0, 'All breeds');

        return DropdownButton<String>(
          value: state.filterBreed ?? 'All breeds',
          items: breeds.map((String breed) {
            return DropdownMenuItem<String>(
              value: breed,
              child: Text(breed),
            );
          }).toList(),
          onChanged: (value) {
            context.read<LikedCatsBloc>().add(
              FilterLikedCatsEvent(value == 'All breeds' ? null : value),
            );
          },
        );
      },
    );
  }

  Widget _buildCatCard(BuildContext context, Cat cat) {
    return Dismissible(
      key: Key(cat.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        context.read<LikedCatsBloc>().add(RemoveLikedCatEvent(cat.id));
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(cat.imageUrl),
          ),
          title: Text(cat.breedName),
          subtitle: Text(
            'Liked: ${cat.likedAt != null ? cat.likedAt!.toLocal().toString().substring(0, 16) : 'Unknown'}',
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              context.read<LikedCatsBloc>().add(RemoveLikedCatEvent(cat.id));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cat removed from liked')),
              );
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CatDetailsScreen(cat: cat),
              ),
            );
          },
        ),
      ),
    );
  }
}