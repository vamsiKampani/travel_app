import 'package:flutter/material.dart';
import '../models/city.dart';
import '../models/hotel.dart';
import 'hotels_screen.dart';

class CityDetailScreen extends StatelessWidget {
  final City city;

  const CityDetailScreen({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final List<Hotel> hotels = [
      Hotel(
        name: 'The Grand Horizon',
        location: city.name,
        imageUrl: 'https://images.unsplash.com/photo-1576354302919-96748cb8299e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGhvdGVsfGVufDB8fDB8fHww',
      ),
      Hotel(
        name: 'Mountain Escape Hotel',
        location: city.name,
        imageUrl: 'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGhvdGVsfGVufDB8fDB8fHww',
      ),
      Hotel(
        name: 'Sunshine Hotel',
        location: city.name,
        imageUrl: 'https://media.istockphoto.com/id/2158211377/photo/traveler-gen-z-using-a-food-delivery-app-on-a-smartphone.webp?a=1&b=1&s=612x612&w=0&k=20&c=vRF03OLr237XzOLx_KVjTJFyYF1gAdUqhpRoEXyiN9E=',
      ),
      Hotel(
        name: 'LuxeVista Hotel',
        location: city.name,
        imageUrl: 'https://media.istockphoto.com/id/2108539552/photo/half-opened-door-of-hotel-room-with-blurred-luxury-bedroom-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=LQqbvqJDqgNO9xWyOmkSoE4jMgmdVEbVz6_zo2cIjqs=',
      ),
      Hotel(
        name: 'Ocean Breeze Lodge',
        location: city.name,
        imageUrl: 'https://media.istockphoto.com/id/2155061962/photo/close-up-of-black-girl-entering-hotel-room.webp?a=1&b=1&s=612x612&w=0&k=20&c=5cQTVtzk7ASE4IxnkW7a3tYRS_WTfORv0BEx834nYAg=',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(city.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    city.imageUrl,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        city.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            
            Text(
              city.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShadowButton(
                  "Hotel Booking",
                  Icons.hotel,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelsScreen(hotels: hotels),
                      ),
                    );
                  },
                ),
                _buildShadowButton("Travel Booking", Icons.directions_car, () {
                  
                }),
              ],
            ),

            const SizedBox(height: 30),

            
            const Text(
              "Places to Visit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            ...city.placesToVisit.map((place) => Text("• $place")).toList(),

            const SizedBox(height: 20),

            
            const Text(
              "Famous Food Items",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            ...city.famousFoods.map((food) => Text("• $food")).toList(),

            const SizedBox(height: 20),

            
            Text(
              "Average Cost: ₹${city.averageCost}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildShadowButton(String label, IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
