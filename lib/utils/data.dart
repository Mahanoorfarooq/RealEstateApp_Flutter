import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var profile = "assets/images/avatar1.jpg";

List Homes = [
  {
    "image": "assets/images/home1.jpg",
    "name": "Single Villa",
    "price": "45,000,000 PKR",
    "location": "DHA Phase 5, Lahore",
    "description":
        "A luxurious 5-bedroom villa in the heart of DHA, with modern amenities.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/home2.jpg",
    "name": "Orchard Residence",
    "price": "35,000,000 PKR",
    "location": "Gulberg 3, Lahore",
    "description":
        "A beautiful 3-bedroom house in the peaceful and secure community of Bahria Orchard",
    "is_favorited": false,
  },
  {
    "image": "assets/images/home3.jpg",
    "name": "7 Marla Furnished House",
    "price": "40,000,000PKR",
    "location": "Master City, Gujranwala",
    "description":
        "A beautiful 7 Marla House totally funrished with modern interior and exterior.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house8.jpg",
    "name": "Model Town Bungalow",
    "price": "50,000,000",
    "location": "Model Town Gujranwala",
    "description":
        "A classic 6-bedroom bungalow with a large lawn, located in the prestigious Model Town area",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house1.jpg",
    "name": "Luxury Villa in DHA Lahore",
    "price": "120k PKR",
    "location": "Gujranwala",
    "description":
        "A classic 6-bedroom bungalow with a large lawn, located in the prestigious Model Town area",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house2.jpg",
    "name": "Elegant House in Bahria Town",
    "price": "45,000,000 PKR",
    "location": "Lahore",
    "description":
        "A luxurious 5-bedroom ELegant house with modern architecture, spacious rooms, a private garden, and a swimming pool. Ideal for families seeking comfort and style.",
    "is_favorited": false,
  },
];

List Homes2 = [
  {
    "image": "assets/images/house3.jpg",
    "name": "Modern House",
    "price": "280k PKR",
    "location": "Gulshan-e-Iqbal",
    "description":
        "A luxurious 5-bedroom Modern House with modern architecture, spacious rooms, a private garden, and a swimming pool. Ideal for families seeking comfort and style.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house4.jpg",
    "name": "Convertible Studio",
    "price": "150k PKR",
    "location": "F-10, Islamabad",
    "description":
        "A luxurious Convertible Studio with modern architecture, spacious rooms, a private garden, and a swimming pool. Ideal for families seeking comfort and style.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house5.jpg",
    "name": "Charming House in Model Town Lahore",
    "price": "175k PKR",
    "location": "Model Town, Lahore",
    "description":
        "A luxurious 5-bedroom House with modern architecture, spacious rooms, a private garden, and a swimming pool. Ideal for families seeking comfort and style.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house7.jpg",
    "name": "Spacious House in Bahria Town Lahore",
    "price": "120k PKR",
    "location": "DHA Phase 8, Karachi",
    "description":
        "A luxurious 6-bedroom house with high-end finishes, a swimming pool, and a large terrace. Ideal for those seeking premium living.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house8.jpg",
    "name": "Beautiful House in Gulberg Lahore",
    "price": "45,000,000 PKR",
    "location": "Gulberg, Lahore",
    "description":
        "A beautiful 4-bedroom house with elegant interiors, a private garden, and a spacious living area. Located in a prime area.",
    "is_favorited": false,
  },
];

//Flats list
List flats = [
  {
    "image": "assets/images/flat5.jpg",
    "name": "Convertible Studio",
    "price": "150k PKR",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image": "assets/images/flat3.jpg",
    "name": "Twin Castle",
    "price": "175k PKR",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image": "assets/images/flat4.jpg",
    "name": "Twin Villa",
    "price": "120k PKR",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
];

List flats2 = [
  {
    "image": "assets/images/flat3.jpg",
    "name": "Twin Castle",
    "price": "175k PKR",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image": "assets/images/flat2.jpg",
    "name": "Convertible Studio",
    "price": "150k PKR",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image": "assets/images/flat1.jpg",
    "name": "Single Villa",
    "price": "280k PKR",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image": "assets/images/flat3.jpg",
    "name": "Twin Castle",
    "price": "175k PKR",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
  {
    "image": "assets/images/flat4.jpg",
    "name": "Twin Villa",
    "price": "120k PKR",
    "location": "Phnom Penh, Cambodia",
    "is_favorited": false,
  },
];

//Apartments list
List apartment = [
  {
    "image": "assets/images/apartment1.jpg",
    "name": "Modern Apartment in Gulberg Lahore",
    "price": "280k PKR",
    "location": "Gulberg, Lahore",
    "description":
        "A contemporary 3-bedroom apartment with a stunning city view, open-plan living area, and access to a gym and swimming pool. Conveniently located near shopping centers and restaurants.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/apartment2.jpg",
    "name": "Stylish Apartment in Clifton Karachi",
    "price": "150k PKR",
    "location": " Clifton, Karachi",
    "description":
        "A chic 2-bedroom apartment featuring modern interiors, a fully equipped kitchen, and a spacious balcony. Located in a prime area with easy access to the beach and entertainment venues.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/apartment3.jpg",
    "name": "Luxury Apartment in F-11 Islamabad",
    "price": "175k PKR",
    "location": " F-11, Islamabad",
    "description":
        "A chic 2-bedroom apartment featuring modern interiors, a fully equipped kitchen, and a spacious balcony. Located in a prime area with easy access to the beach and entertainment venues.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/apartment4.jpg",
    "name": "Elegant Apartment in DHA Phase 5 Lahore",
    "price": "120k PKR",
    "location": "Lashore",
    "is_favorited": false,
  },
];

List apartment2 = [
  {
    "image": "assets/images/apartment5.jpg",
    "name": "Single Apartment",
    "price": "280k PKR",
    "location": "Gujranwala",
    "description":
        " A contemporary 2-bedroom apartment with sleek interiors, a modern kitchen, and a large balcony. Located in a serene environment with all amenities nearby",
    "is_favorited": false,
  },
  {
    "image": "assets/images/apartment6.jpg",
    "name": "Spacious Appartment",
    "price": "150k PKR",
    "location": "Islamabad",
    "description":
        " A contemporary 2-bedroom apartment with sleek interiors, a modern kitchen, and a large balcony. Located in a serene environment with all amenities nearby",
    "is_favorited": false,
  },
  {
    "image": "assets/images/apartment7.jpg",
    "name": "Apartment Mixir",
    "price": "175k PKR",
    "location": "Murree",
    "description":
        " A contemporary 2-bedroom apartment with sleek interiors, a modern kitchen, and a large balcony. Located in a serene environment with all amenities nearby",
    "is_favorited": false,
  },
  {
    "image": "assets/images/apartment8.jpg",
    "name": "Twin Villa Apartment",
    "price": "120k PKR",
    "location": "Phnom Penh, Cambodia",
    "description":
        " A contemporary 2-bedroom apartment with sleek interiors, a modern kitchen, and a large balcony. Located in a serene environment with all amenities nearby",
    "is_favorited": false,
  },
];
// Buildings list

List building = [
  {
    "image": "assets/images/building.png",
    "name": "Villa Building",
    "price": "280k PKR",
    "location": "Clifton, Karachi",
    "description":
        "A stunning high-rise offering luxury apartments and commercial spaces with panoramic views of the Arabian Sea. Equipped with modern amenities and top-notch security.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/building1.jpg",
    "name": "Bahria Icon",
    "price": "150k PKR",
    "location": "F-8, Islamabad",
    "description":
        "A mixed-use complex featuring a shopping mall, residential apartments, and corporate offices. Known for its modern architecture and prime location.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/building2.jpg",
    "name": "Castle",
    "price": "175k PKR",
    "location": "Gujranwala",
    "description":
        "The tallest building in Pakistan, offering premium office spaces and luxury apartments. It includes a shopping mall, a food court, and recreational facilities",
    "is_favorited": false,
  },
  {
    "image": "assets/images/building3.jpg",
    "name": "Ocean Building",
    "price": "120k PKR",
    "location": "Gulber, Lahore",
    "description":
        "A modern commercial building featuring premium retail outlets, office spaces, and dining options. A hub for business and leisure in Lahore.",
    "is_favorited": false,
  },
];

List building2 = [
  {
    "image": "assets/images/building4.jpg",
    "name": "Power Building",
    "price": "280k PKR",
    "location": "Blue Area, Islamabad",
    "description":
        "A modern office building housing the headquarters of Ufone. Known for its contemporary architecture and prime location in the business district.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/building5.jpg",
    "name": "Emerald Bay",
    "price": "150k PKR",
    "location": "DHA Phase 8",
    "description":
        "A luxurious residential and commercial complex offering high-end apartments, office spaces, and recreational facilities. Known for its scenic views and premium amenities.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/building6.jpg",
    "name": "MCB Tower",
    "price": "175k PKR",
    "location": "Gulberg, Lahore",
    "description":
        "A mixed-use building featuring a shopping mall, office spaces, and luxury apartments. Known for its central location and modern amenities.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/building6.jpg",
    "name": "Building",
    "price": "200k PKR",
    "location": "Gujrat",
    "description":
        "A premier mixed-use development featuring a shopping mall, office spaces, and luxury apartments. Known for its high-end amenities and stunning views.",
    "is_favorited": false,
  },
];

List populars = [
  {
    "image": "assets/images/apartment1.jpg",
    "name": "Modern Apartment in Gulberg Lahore",
    "price": "280k PKR",
    "location": "Gulberg, Lahore",
    "description":
        "A contemporary 3-bedroom apartment with a stunning city view, open-plan living area, and access to a gym and swimming pool. Conveniently located near shopping centers and restaurants.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/apartment7.jpg",
    "name": "Apartment Mixir",
    "price": "175k PKR",
    "location": "Murree",
    "description":
        " A contemporary 2-bedroom apartment with sleek interiors, a modern kitchen, and a large balcony. Located in a serene environment with all amenities nearby",
    "is_favorited": false,
  },
  {
    "image": "assets/images/flat5.jpg",
    "name": "Flat",
    "price": "120k PKR",
    "location": "Gujranwala",
    "description":
        "A modern residential complex offering spacious flats with contemporary designs and amenities such as a swimming pool, gym, and landscaped gardens.",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house8.jpg",
    "name": "Royal Residency",
    "price": "120k PKR",
    "location": "Phnom Penh, Cambodia",
    "description":
        " Luxurious waterfront flats offering stunning views of the Arabian Sea. Equipped with world-class facilities, including a private beach, spa, and jogging track",
    "is_favorited": false,
  },
];

List recommended = [
  {
    "image": "assets/images/house2.jpg",
    "name": "Garden House",
    "price": "180k PKR",
    "location": "Clifton, Karachi",
    "is_favorited": false,
  },
  {
    "image": "assets/images/livingroom.jpg",
    "name": "Twin Castle",
    "price": "175k PKR",
    "location": "Bahria Town, Lahore",
    "is_favorited": false,
  },
  {
    "image": "assets/images/house8.jpg",
    "name": "King Villa",
    "price": "180k PKR",
    "location": "Scheme 33, Karachi",
    "is_favorited": false,
  },
];

List recents = [
  {
    "image": "assets/images/apartment5.jpg",
    "name": "Double Villa",
    "price": "180k PKR",
    "location": "Rawalpindi",
    "is_favorited": false,
  },
  {
    "image": "assets/images/building6.jpg",
    "name": "Studio",
    "price": "150k PKR",
    "location": "F-11, Islamabd",
    "is_favorited": false,
  },
  {
    "image": "assets/images/flat4.jpg",
    "name": "Palm Residency",
    "price": "180k PKR",
    "location": "Scheme 45, Karachi",
    "is_favorited": false,
  },
];

List categories = [
  {"name": "All", "icon": FontAwesomeIcons.boxes},
  {"name": "House", "icon": FontAwesomeIcons.home},
  {"name": "Apartment", "icon": FontAwesomeIcons.university},
  {"name": "Building", "icon": FontAwesomeIcons.storeAlt},
  {"name": "Flat", "icon": FontAwesomeIcons.building},
];

var brokers = [
  {
    "image": "assets/images/avatar1.jpg",
    "name": "Mahnoor",
    "type": "Agent",
    "description": "Hello, How are You?",
    "rate": 4,
  },
  {
    "image": "assets/images/avatar2.png",
    "name": "Saria",
    "type": "Broker",
    "description": "How can I Help you?",
    "rate": 2,
  },
  {
    "image": "assets/images/avatar3.png",
    "name": "Saba",
    "type": "Agent",
    "description": "Check this Property!",
    "rate": 4,
  },
  {
    "image": "assets/images/avatar4.jpg",
    "name": "Ayesha",
    "type": "Broker",
    "description": "Let's plan a meetup.",
    "rate": 3,
  },
];

List companies = [
  {
    "image": "assets/images/GFS.png",
    "name": "GFS Builders",
    "location": "Gujranwala",
    "type": "Broker",
    "is_favorited": false,
    "icon": Icons.domain_rounded
  },
  {
    "image": "assets/images/zameen.png",
    "name": "Zameen",
    "location": "Lahore",
    "type": "Broker",
    "is_favorited": false,
    "icon": Icons.house_siding_rounded
  },
  {
    "image": "assets/images/agency21.png",
    "name": "Agency 21",
    "location": "Lahore",
    "type": "Broker",
    "is_favorited": false,
    "icon": Icons.home_work_rounded
  },
  {
    "image": "assets/images/H&A.png",
    "name": "H&A Builder",
    "location": "Islamabad",
    "type": "Broker",
    "is_favorited": false,
    "icon": Icons.location_city_rounded
  },
];
