import 'package:flutter/material.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';

class CarsBrandsModels {
  final List<Map<String, dynamic>> carColors = [
    {'name': 'Beige', 'color': const Color.fromRGBO(245, 245, 220, 1)},
    {'name': 'Black', 'color': Colors.black},
    {'name': 'Blue', 'color': Colors.blue.shade700},
    {'name': 'Bronze', 'color': const Color.fromRGBO(205, 127, 50, 1)},
    {'name': 'Brown', 'color': Colors.brown},
    {'name': 'Burgundy', 'color': const Color.fromRGBO(128, 0, 32, 1)},
    {'name': 'Dark gray', 'color': Colors.grey.shade600},
    {'name': 'Gold', 'color': const Color.fromRGBO(218, 165, 32, 1)},
    {'name': 'Gray', 'color': Colors.grey},
    {'name': 'Green', 'color': Colors.green.shade800},
    {'name': 'Lightblue', 'color': Colors.lightBlue},
    {'name': 'Orange', 'color': Colors.orange.shade600},
    {'name': 'Pink', 'color': Colors.pink.shade600},
    {'name': 'Purple', 'color': Colors.purple.shade600},
    {'name': 'Red', 'color': Colors.red.shade600},
    {'name': 'Silver', 'color': const Color.fromRGBO(169, 169, 169, 1)},
    {'name': 'White', 'color': Colors.white},
    {'name': 'Yellow', 'color': Colors.yellow.shade600}
  ];

  final List<Map<String, dynamic>> cars = [
    {
      "brand": "Abarth",
      "models": [
        {"title": "500"},
        {"title": "500C"},
        {"title": "595"},
        {"title": "595C"},
        {"title": "695"},
        {"title": "695C"},
        {"title": "Grande Punto"},
        {"title": "Punto Evo"}
      ]
    },
    {
      "brand": "AC",
      "models": [
        {"title": "AC"}
      ]
    },
    {
      "brand": "Acura",
      "models": [
        {"title": "MDX"},
        {"title": "NSX"},
        {"title": "RL"},
        {"title": "RSX"},
        {"title": "TL"},
        {"title": "TSX"}
      ]
    },
    {
      "brand": "Aixam",
      "models": [
        {"title": "City"},
        {"title": "Crossline"},
        {"title": "Roadline"},
        {"title": "Scouty R"}
      ]
    },
    {
      "brand": "Alfa Romeo",
      "models": [
        {"title": "4C"},
        {"title": "8C"},
        {"title": "Alfa 145"},
        {"title": "Alfa 146"},
        {"title": "Alfa 147"},
        {"title": "Alfa 155"},
        {"title": "Alfa 156"},
        {"title": "Alfa 159"},
        {"title": "Alfa 164"},
        {"title": "Alfa 166"},
        {"title": "Alfa 33"},
        {"title": "Alfa 75"},
        {"title": "Alfa 90"},
        {"title": "Alfasud"},
        {"title": "Alfetta"},
        {"title": "Brera"},
        {"title": "Crosswagon"},
        {"title": "Giulia"},
        {"title": "Giulietta"},
        {"title": "GT"},
        {"title": "GTV"},
        {"title": "Junior"},
        {"title": "MiTo"},
        {"title": "Spider"},
        {"title": "Sprint"}
      ]
    },
    {
      "brand": "ALPINA",
      "models": [
        {"title": "B10"},
        {"title": "B12"},
        {"title": "B3"},
        {"title": "B4"},
        {"title": "B5"},
        {"title": "B6"},
        {"title": "B7"},
        {"title": "B8"},
        {"title": "D 10"},
        {"title": "D3"},
        {"title": "D5"},
        {"title": "Roadster S"},
        {"title": "XD3"}
      ]
    },
    {
      "brand": "Artega",
      "models": [
        {"title": "GT"}
      ]
    },
    {
      "brand": "Asia Motors",
      "models": [
        {"title": "Rocsta"}
      ]
    },
    {
      "brand": "Aston Martin",
      "models": [
        {"title": "AR1"},
        {"title": "Cygnet"},
        {"title": "DB"},
        {"title": "DB7"},
        {"title": "DB9"},
        {"title": "DBS"},
        {"title": "Lagonda"},
        {"title": "Rapide"},
        {"title": "V12 Vantage"},
        {"title": "V8 Vantage"},
        {"title": "Vanquish"},
        {"title": "Virage"}
      ]
    },
    {
      "brand": "Audi",
      "models": [
        {"title": "100"},
        {"title": "200"},
        {"title": "80"},
        {"title": "90"},
        {"title": "A1"},
        {"title": "A2"},
        {"title": "A3"},
        {"title": "A4"},
        {"title": "A4 Allroad"},
        {"title": "A5"},
        {"title": "A6"},
        {"title": "A6 Allroad"},
        {"title": "A7"},
        {"title": "A8"},
        {"title": "Cabriolet"},
        {"title": "CoupÃƒÂ©"},
        {"title": "Q3"},
        {"title": "Q5"},
        {"title": "Q7"},
        {"title": "QUATTRO"},
        {"title": "R8"},
        {"title": "RS2"},
        {"title": "RS3"},
        {"title": "RS4"},
        {"title": "RS5"},
        {"title": "RS6"},
        {"title": "RS7"},
        {"title": "RSQ3"},
        {"title": "S1"},
        {"title": "S2"},
        {"title": "S3"},
        {"title": "S4"},
        {"title": "S5"},
        {"title": "S6"},
        {"title": "S7"},
        {"title": "S8"},
        {"title": "SQ5"},
        {
          "title": "TT",
          "types": ["TT", "TT RS", "TTS"]
        },
        {"title": "V8"}
      ]
    },
    {
      "brand": "Austin",
      "models": [
        {"title": "Austin"}
      ]
    },
    {
      "brand": "Austin Healey",
      "models": [
        {"title": "Austin Healey"}
      ]
    },
    {
      "brand": "Bentley",
      "models": [
        {"title": "Arnage"},
        {"title": "Azure"},
        {"title": "Brooklands"},
        {
          "title": "Continental",
          "types": [
            "Continental",
            "Continental Flying Spur",
            "Continental GT",
            "Continental GTC",
            "Continental Supersports"
          ]
        },
        {"title": "Eight"},
        {"title": "Flying Spur"},
        {"title": "Mulsanne"},
        {"title": "Turbo R"},
        {"title": "Turbo RT"},
        {"title": "Turbo S"}
      ]
    },
    {
      "brand": "BMW",
      "models": [
        {
          "title": "Series 1",
          "types": [
            "114",
            "116",
            "118",
            "120",
            "123",
            "125",
            "130",
            "135",
            "1er M CoupÃƒÂ©"
          ]
        },
        {"title": "2002"},
        {
          "title": "Series 2",
          "types": [
            "214 Active Tourer",
            "216",
            "216 Active Tourer",
            "216 Gran Tourer",
            "218",
            "218 Active Tourer",
            "218 Gran Tourer",
            "220",
            "220 Active Tourer",
            "220 Gran Tourer",
            "225",
            "225 Active Tourer",
            "228"
          ]
        },
        {
          "title": "Series 3",
          "types": [
            "315",
            "316",
            "318",
            "318 Gran Turismo",
            "320",
            "320 Gran Turismo",
            "323",
            "324",
            "325",
            "325 Gran Turismo",
            "328",
            "328 Gran Turismo",
            "330",
            "330 Gran Turismo",
            "335",
            "335 Gran Turismo",
            "ActiveHybrid 3"
          ]
        },
        {
          "title": "Series 4",
          "types": [
            "418 Gran CoupÃƒÂ©",
            "420",
            "420 Gran CoupÃƒÂ©",
            "425",
            "428",
            "428 Gran CoupÃƒÂ©",
            "430",
            "430 Gran CoupÃƒÂ©",
            "435",
            "435 Gran CoupÃƒÂ©"
          ]
        },
        {
          "title": "Series 5",
          "types": [
            "518",
            "520",
            "520 Gran Turismo",
            "523",
            "524",
            "525",
            "528",
            "530",
            "530 Gran Turismo",
            "535",
            "535 Gran Turismo",
            "540",
            "545",
            "550",
            "550 Gran Turismo",
            "ActiveHybrid 5"
          ]
        },
        {
          "title": "Series 6",
          "types": [
            "628",
            "630",
            "633",
            "635",
            "640",
            "640 Gran CoupÃƒÂ©",
            "645",
            "650",
            "650 Gran CoupÃƒÂ©"
          ]
        },
        {
          "title": "Series 7",
          "types": [
            "725",
            "728",
            "730",
            "732",
            "735",
            "740",
            "745",
            "750",
            "760",
            "ActiveHybrid 7"
          ]
        },
        {"title": "840"},
        {"title": "850"},
        {"title": "i3"},
        {"title": "i8"},
        {
          "title": "M Models",
          "types": ["M135", "M235", "M3", "M4", "M5", "M550", "M6"]
        },
        {
          "title": "Series X",
          "types": [
            "ActiveHybrid X6",
            "X1",
            "X3",
            "X4",
            "X5",
            "X5 M",
            "X5 M50",
            "X6",
            "X6 M",
            "X6 M50"
          ]
        },
        {
          "title": "Series Z",
          "types": ["Z1", "Z3", "Z3 M", "Z4", "Z4 M", "Z8"]
        }
      ]
    },
    {
      "brand": "Borgward",
      "models": [
        {"title": "Borgward"}
      ]
    },
    {
      "brand": "Brilliance",
      "models": [
        {"title": "BC3"},
        {"title": "BS2"},
        {"title": "BS4"},
        {"title": "BS6"}
      ]
    },
    {
      "brand": "Bugatti",
      "models": [
        {"title": "EB 110"},
        {"title": "Veyron"}
      ]
    },
    {
      "brand": "Buick",
      "models": [
        {"title": "Century"},
        {"title": "Electra"},
        {"title": "Enclave"},
        {"title": "La Crosse"},
        {"title": "Le Sabre"},
        {"title": "Park Avenue"},
        {"title": "Regal"},
        {"title": "Riviera"},
        {"title": "Roadmaster"},
        {"title": "Skylark"}
      ]
    },
    {
      "brand": "Cadillac",
      "models": [
        {"title": "Allante"},
        {"title": "ATS"},
        {"title": "BLS"},
        {"title": "CTS"},
        {"title": "Deville"},
        {"title": "Eldorado"},
        {"title": "Escalade"},
        {"title": "Fleetwood"},
        {"title": "Seville"},
        {"title": "SRX"},
        {"title": "STS"},
        {"title": "XLR"}
      ]
    },
    {
      "brand": "Casalini",
      "models": [
        {"title": "Casalini"}
      ]
    },
    {
      "brand": "Caterham",
      "models": [
        {"title": "Caterham"}
      ]
    },
    {"brand": "Chatenet", "models": "Chatenet"},
    {
      "brand": "Chevrolet",
      "models": [
        {"title": "2500"},
        {"title": "Alero"},
        {"title": "Astro"},
        {"title": "Avalanche"},
        {"title": "Aveo"},
        {"title": "Beretta"},
        {"title": "Blazer"},
        {"title": "C1500"},
        {"title": "Camaro"},
        {"title": "Caprice"},
        {"title": "Captiva"},
        {"title": "Cavalier"},
        {"title": "Chevelle"},
        {"title": "Chevy Van"},
        {"title": "Citation"},
        {"title": "Colorado"},
        {"title": "Corsica"},
        {"title": "Cruze"},
        {"title": "El Camino"},
        {"title": "Epica"},
        {"title": "Evanda"},
        {"title": "Express"},
        {"title": "G"},
        {"title": "HHR"},
        {"title": "Impala"},
        {"title": "K1500"},
        {"title": "K30"},
        {"title": "Kalos"},
        {"title": "Lacetti"},
        {"title": "Lumina"},
        {"title": "Malibu"},
        {"title": "Matiz"},
        {"title": "Nubira"},
        {"title": "Orlando"},
        {"title": "Rezzo"},
        {"title": "S-10"},
        {"title": "Silverado"},
        {"title": "Spark"},
        {"title": "SSR"},
        {"title": "Suburban"},
        {"title": "Tahoe"},
        {"title": "Trailblazer"},
        {"title": "Trans Sport"},
        {"title": "Trax"},
        {"title": "Venture"},
        {"title": "Volt"}
      ]
    },
    {
      "brand": "Chrysler",
      "models": [
        {"title": "300 M"},
        {"title": "300C"},
        {"title": "Aspen"},
        {"title": "Crossfire"},
        {"title": "Daytona"},
        {"title": "ES"},
        {"title": "Grand Voyager"},
        {"title": "GS"},
        {"title": "GTS"},
        {"title": "Imperial"},
        {"title": "Le Baron"},
        {"title": "Neon"},
        {"title": "New Yorker"},
        {"title": "Pacifica"},
        {"title": "PT Cruiser"},
        {"title": "Saratoga"},
        {"title": "Sebring"},
        {"title": "Stratus"},
        {"title": "Valiant"},
        {"title": "Viper"},
        {"title": "Vision"},
        {"title": "Voyager"}
      ]
    },
    {
      "brand": "Citroën",
      "models": [
        {"title": "2 CV"},
        {"title": "AX"},
        {"title": "Berlingo"},
        {"title": "BX"},
        {"title": "C-Crosser"},
        {"title": "C-Elysée"},
        {"title": "C-Zero"},
        {"title": "C1"},
        {"title": "C2"},
        {"title": "C3"},
        {"title": "C3 Picasso"},
        {"title": "C4"},
        {"title": "C4 Aircross"},
        {"title": "C4 Cactus"},
        {"title": "C4 Picasso"},
        {"title": "C5"},
        {"title": "C6"},
        {"title": "C8"},
        {"title": "CX"},
        {"title": "DS"},
        {"title": "DS3"},
        {"title": "DS4"},
        {"title": "DS5"},
        {"title": "Evasion"},
        {"title": "Grand C4 Picasso"},
        {"title": "GSA"},
        {"title": "Jumper"},
        {"title": "Jumpy"},
        {"title": "Nemo"},
        {"title": "SAXO"},
        {"title": "SM"},
        {"title": "Visa"},
        {"title": "Xantia"},
        {"title": "XM"},
        {"title": "Xsara"},
        {"title": "Xsara Picasso"},
        {"title": "ZX"}
      ]
    },
    {"brand": "Cobra", "models": "Cobra"},
    {
      "brand": "Corvette",
      "models": [
        {"title": "C1"},
        {"title": "C2"},
        {"title": "C3"},
        {"title": "C4"},
        {"title": "C5"},
        {"title": "C6"},
        {"title": "C7"},
        {"title": "Z06"},
        {"title": "ZR 1"}
      ]
    },
    {
      "brand": "Dacia",
      "models": [
        {"title": "Dokker"},
        {"title": "Duster"},
        {"title": "Lodgy"},
        {"title": "Logan"},
        {"title": "Logan Pick-Up"},
        {"title": "Pick Up"},
        {"title": "Sandero"}
      ]
    },
    {
      "brand": "Daewoo",
      "models": [
        {"title": "Espero"},
        {"title": "Evanda"},
        {"title": "Kalos"},
        {"title": "Korando"},
        {"title": "Lacetti"},
        {"title": "Lanos"},
        {"title": "Leganza"},
        {"title": "Matiz"},
        {"title": "Musso"},
        {"title": "Nexia"},
        {"title": "Nubira"},
        {"title": "Rezzo"},
        {"title": "Tacuma"}
      ]
    },
    {
      "brand": "Daihatsu",
      "models": [
        {"title": "Applause"},
        {"title": "Charade"},
        {"title": "Charmant"},
        {"title": "Copen"},
        {"title": "Cuore"},
        {"title": "Feroza/Sportrak"},
        {"title": "Freeclimber"},
        {"title": "Gran Move"},
        {"title": "Hijet"},
        {"title": "MATERIA"},
        {"title": "Move"},
        {"title": "Rocky/Fourtrak"},
        {"title": "Sirion"},
        {"title": "Terios"},
        {"title": "TREVIS"},
        {"title": "YRV"}
      ]
    },
    {
      "brand": "DeTomaso",
      "models": [
        {"title": "GuarÃƒ "},
        {"title": "Pantera"}
      ]
    },
    {
      "brand": "Dodge",
      "models": [
        {"title": "Avenger"},
        {"title": "Caliber"},
        {"title": "Challenger"},
        {"title": "Charger"},
        {"title": "Dakota"},
        {"title": "Demon"},
        {"title": "Durango"},
        {"title": "Grand Caravan"},
        {"title": "Hornet"},
        {"title": "Journey"},
        {"title": "Magnum"},
        {"title": "Neon"},
        {"title": "Nitro"},
        {"title": "RAM"},
        {"title": "Stealth"},
        {"title": "Viper"}
      ]
    },
    {
      "brand": "Ferrari",
      "models": [
        {"title": "208"},
        {"title": "246"},
        {"title": "250"},
        {"title": "275"},
        {"title": "288"},
        {"title": "308"},
        {"title": "328"},
        {"title": "330"},
        {"title": "348"},
        {"title": "360"},
        {"title": "365"},
        {"title": "400"},
        {"title": "412"},
        {"title": "456"},
        {"title": "458"},
        {"title": "512"},
        {"title": "550"},
        {"title": "575"},
        {"title": "599 GTB"},
        {"title": "612"},
        {"title": "750"},
        {"title": "California"},
        {"title": "Daytona"},
        {"title": "Dino GT4"},
        {"title": "Enzo Ferrari"},
        {"title": "F12"},
        {"title": "F355"},
        {"title": "F40"},
        {"title": "F430"},
        {"title": "F50"},
        {"title": "FF"},
        {"title": "LaFerrari"},
        {"title": "Mondial"},
        {"title": "Superamerica"},
        {"title": "Testarossa"}
      ]
    },
    {
      "brand": "Fiat",
      "models": [
        {"title": "124"},
        {"title": "126"},
        {"title": "127"},
        {"title": "130"},
        {"title": "131"},
        {"title": "500"},
        {"title": "500C"},
        {"title": "500L"},
        {"title": "500L Living"},
        {"title": "500L Trekking"},
        {"title": "500X"},
        {"title": "Barchetta"},
        {"title": "Brava"},
        {"title": "Bravo"},
        {"title": "Cinquecento"},
        {"title": "Coupe"},
        {"title": "Croma"},
        {"title": "Dino"},
        {"title": "Doblo"},
        {"title": "Ducato"},
        {"title": "Fiorino"},
        {"title": "Freemont"},
        {"title": "Grande Punto"},
        {"title": "Idea"},
        {"title": "Linea"},
        {"title": "Marea"},
        {"title": "Marengo"},
        {"title": "Multipla"},
        {"title": "New Panda"},
        {"title": "Palio"},
        {"title": "Panda"},
        {"title": "Punto"},
        {"title": "Punto Evo"},
        {"title": "Qubo"},
        {"title": "Regata"},
        {"title": "Ritmo"},
        {"title": "Scudo"},
        {"title": "Sedici"},
        {"title": "Seicento"},
        {"title": "Spider Europa"},
        {"title": "Stilo"},
        {"title": "Strada"},
        {"title": "Tempra"},
        {"title": "Tipo"},
        {"title": "Ulysse"},
        {"title": "Uno"},
        {"title": "X 1/9"}
      ]
    },
    {
      "brand": "Fisker",
      "models": [
        {"title": "Karma"}
      ]
    },
    {
      "brand": "Ford",
      "models": [
        {"title": "Aerostar"},
        {"title": "B-Max"},
        {"title": "Bronco"},
        {"title": "C-Max"},
        {"title": "Capri"},
        {"title": "Cougar"},
        {"title": "Courier"},
        {"title": "Crown"},
        {"title": "Econoline"},
        {"title": "Econovan"},
        {"title": "EcoSport"},
        {"title": "Edge"},
        {"title": "Escape"},
        {"title": "Escort"},
        {"title": "Excursion"},
        {"title": "Expedition"},
        {"title": "Explorer"},
        {"title": "Express"},
        {"title": "F 150"},
        {"title": "F 250"},
        {"title": "F 350"},
        {"title": "Fairlane"},
        {"title": "Falcon"},
        {"title": "Fiesta"},
        {"title": "Flex"},
        {"title": "Focus"},
        {"title": "Fusion"},
        {"title": "Galaxy"},
        {"title": "Granada"},
        {"title": "Grand C-Max"},
        {"title": "Grand Tourneo"},
        {"title": "GT"},
        {"title": "Ka"},
        {"title": "Kuga"},
        {"title": "Maverick"},
        {"title": "Mercury"},
        {"title": "Mondeo"},
        {"title": "Mustang"},
        {"title": "Orion"},
        {"title": "Probe"},
        {"title": "Puma"},
        {"title": "Ranger"},
        {"title": "Raptor"},
        {"title": "S-Max"},
        {"title": "Scorpio"},
        {"title": "Sierra"},
        {"title": "Sportka"},
        {"title": "Streetka"},
        {"title": "Taunus"},
        {"title": "Taurus"},
        {"title": "Thunderbird"},
        {"title": "Tourneo"},
        {
          "title": "Transit",
          "types": [
            "Transit",
            "Transit Connect",
            "Transit Courier",
            "Transit Custom"
          ]
        },
        {"title": "Windstar"}
      ]
    },
    {"brand": "GAC Gonow", "models": "GAC Gonow"},
    {"brand": "Gemballa", "models": "Gemballa"},
    {
      "brand": "GMC",
      "models": [
        {"title": "Acadia"},
        {"title": "Envoy"},
        {"title": "Safari"},
        {"title": "Savana"},
        {"title": "Sierra"},
        {"title": "Sonoma"},
        {"title": "Syclone"},
        {"title": "Typhoon"},
        {"title": "Vandura"},
        {"title": "Yukon"}
      ]
    },
    {
      "brand": "Grecav",
      "models": [
        {"title": "Sonique"}
      ]
    },
    {"brand": "Hamann", "models": "Hamann"},
    {"brand": "Holden", "models": "Holden"},
    {
      "brand": "Honda",
      "models": [
        {"title": "Accord"},
        {"title": "Aerodeck"},
        {"title": "Civic"},
        {"title": "Concerto"},
        {"title": "CR-V"},
        {"title": "CR-Z"},
        {"title": "CRX"},
        {"title": "Element"},
        {"title": "Fit"},
        {"title": "FR-V"},
        {"title": "HR-V"},
        {"title": "Insight"},
        {"title": "Integra"},
        {"title": "Jazz"},
        {"title": "Legend"},
        {"title": "Logo"},
        {"title": "NSX"},
        {"title": "Odyssey"},
        {"title": "Prelude"},
        {"title": "S2000"},
        {"title": "Shuttle"},
        {"title": "Stream"}
      ]
    },
    {
      "brand": "Hummer",
      "models": [
        {"title": "H1"},
        {"title": "H2"},
        {"title": "H3"}
      ]
    },
    {
      "brand": "Hyundai",
      "models": [
        {"title": "Accent"},
        {"title": "Atos"},
        {"title": "Azera"},
        {"title": "Coupe"},
        {"title": "Elantra"},
        {"title": "Excel"},
        {"title": "Galloper"},
        {"title": "Genesis"},
        {"title": "Getz"},
        {"title": "Grand Santa Fe"},
        {"title": "Grandeur"},
        {"title": "H 100"},
        {"title": "H 200"},
        {"title": "H-1"},
        {"title": "H-1 Starex"},
        {"title": "i10"},
        {"title": "i20"},
        {"title": "i30"},
        {"title": "i40"},
        {"title": "i50"},
        {"title": "ix20"},
        {"title": "ix35"},
        {"title": "ix55"},
        {"title": "Lantra"},
        {"title": "Matrix"},
        {"title": "Pony"},
        {"title": "S-Coupe"},
        {"title": "Santa Fe"},
        {"title": "Santamo"},
        {"title": "Sonata"},
        {"title": "Terracan"},
        {"title": "Trajet"},
        {"title": "Tucson"},
        {"title": "Veloster"},
        {"title": "Veracruz"},
        {"title": "XG 30"},
        {"title": "XG 350"}
      ]
    },
    {
      "brand": "Infiniti",
      "models": [
        {"title": "EX30"},
        {"title": "EX35"},
        {"title": "EX37"},
        {"title": "FX"},
        {"title": "G35"},
        {"title": "G37"},
        {"title": "M30"},
        {"title": "M35"},
        {"title": "M37"},
        {"title": "Q45"},
        {"title": "Q50"},
        {"title": "Q60"},
        {"title": "Q70"},
        {"title": "QX50"},
        {"title": "QX56"},
        {"title": "QX70"}
      ]
    },
    {
      "brand": "Isuzu",
      "models": [
        {"title": "Campo"},
        {"title": "D-Max"},
        {"title": "Gemini"},
        {"title": "Midi"},
        {"title": "PICK UP"},
        {"title": "Trooper"}
      ]
    },
    {
      "brand": "Iveco",
      "models": [
        {"title": "Massif"}
      ]
    },
    {
      "brand": "Jaguar",
      "models": [
        {"title": "Daimler"},
        {"title": "E-Type"},
        {"title": "F-Type"},
        {"title": "MK II"},
        {"title": "S-Type"},
        {"title": "X-Type"},
        {"title": "XE"},
        {"title": "XF"},
        {"title": "XJ"},
        {"title": "XJ12"},
        {"title": "XJ40"},
        {"title": "XJ6"},
        {"title": "XJ8"},
        {"title": "XJR"},
        {"title": "XJS"},
        {"title": "XJSC"},
        {"title": "XK"},
        {"title": "XKR"}
      ]
    },
    {
      "brand": "Jeep",
      "models": [
        {"title": "Cherokee"},
        {"title": "CJ"},
        {"title": "Comanche"},
        {"title": "Commander"},
        {"title": "Compass"},
        {"title": "Grand Cherokee"},
        {"title": "Patriot"},
        {"title": "Renegade"},
        {"title": "Wagoneer"},
        {"title": "Willys"},
        {"title": "Wrangler"}
      ]
    },
    {
      "brand": "Kia",
      "models": [
        {"title": "Besta"},
        {"title": "Borrego"},
        {"title": "Carens"},
        {"title": "Carnival"},
        {"title": "cee'd"},
        {"title": "cee'd Sportswagon"},
        {"title": "Cerato"},
        {"title": "Clarus"},
        {"title": "Elan"},
        {"title": "Joice"},
        {"title": "K2500"},
        {"title": "K2700"},
        {"title": "Leo"},
        {"title": "Magentis"},
        {"title": "Mentor"},
        {"title": "Mini"},
        {"title": "Opirus"},
        {"title": "Optima"},
        {"title": "Picanto"},
        {"title": "Pregio"},
        {"title": "Pride"},
        {"title": "pro_cee'd"},
        {"title": "Retona"},
        {"title": "Rio"},
        {"title": "Roadster"},
        {"title": "Rocsta"},
        {"title": "Sephia"},
        {"title": "Shuma"},
        {"title": "Sorento"},
        {"title": "Soul"},
        {"title": "Sportage"},
        {"title": "Venga"}
      ]
    },
    {
      "brand": "Koenigsegg",
      "models": [
        {"title": "CCR"}
      ]
    },
    {
      "brand": "KTM",
      "models": [
        {"title": "X-BOW"}
      ]
    },
    {
      "brand": "Lada",
      "models": [
        {"title": "110"},
        {"title": "111"},
        {"title": "112"},
        {"title": "1200"},
        {"title": "2107"},
        {"title": "2110"},
        {"title": "2111"},
        {"title": "2112"},
        {"title": "Aleko"},
        {"title": "Forma"},
        {"title": "Granta"},
        {"title": "Kalina"},
        {"title": "Niva"},
        {"title": "Nova"},
        {"title": "Priora"},
        {"title": "Samara"}
      ]
    },
    {
      "brand": "Lamborghini",
      "models": [
        {"title": "Aventador"},
        {"title": "Countach"},
        {"title": "Diablo"},
        {"title": "Espada"},
        {"title": "Gallardo"},
        {"title": "HuracÃƒÂ¡n"},
        {"title": "Jalpa"},
        {"title": "LM"},
        {"title": "Miura"},
        {"title": "Murciélago"},
        {"title": "Urraco"}
      ]
    },
    {
      "brand": "Lancia",
      "models": [
        {"title": "Beta"},
        {"title": "Dedra"},
        {"title": "Delta"},
        {"title": "Flaminia"},
        {"title": "Flavia"},
        {"title": "Fulvia"},
        {"title": "Gamma"},
        {"title": "Kappa"},
        {"title": "Lybra"},
        {"title": "MUSA"},
        {"title": "Phedra"},
        {"title": "Prisma"},
        {"title": "Stratos"},
        {"title": "Thema"},
        {"title": "Thesis"},
        {"title": "Voyager"},
        {"title": "Ypsilon"},
        {"title": "Zeta"}
      ]
    },
    {
      "brand": "Land Rover",
      "models": [
        {"title": "Defender"},
        {"title": "Discovery"},
        {"title": "Discovery Sport"},
        {"title": "Freelander"},
        {"title": "Range Rover"},
        {"title": "Range Rover Evoque"},
        {"title": "Range Rover Sport"},
        {"title": "Serie I"},
        {"title": "Serie II"},
        {"title": "Serie III"}
      ]
    },
    {
      "brand": "Landwind",
      "models": [
        {"title": "CV-9"},
        {"title": "S"},
        {"title": "SC2"},
        {"title": "SC4"}
      ]
    },
    {
      "brand": "Lexus",
      "models": [
        {"title": "CT 200h"},
        {
          "title": "ES Series",
          "types": ["ES 300", "ES 330", "ES 350"]
        },
        {
          "title": "GS Series",
          "types": ["GS 250", "GS 300", "GS 350", "GS 430", "GS 450", "GS 460"]
        },
        {"title": "GX 470"},
        {
          "title": "IS Series",
          "types": ["IS 200", "IS 220", "IS 250", "IS 300", "IS 350", "IS-F"]
        },
        {
          "title": "LS Series",
          "types": ["LS 400", "LS 430", "LS 460", "LS 600"]
        },
        {
          "title": "LX Series",
          "types": ["LX 470", "LX 570"]
        },
        {
          "title": "NX Series",
          "types": ["NX 200", "NX 300"]
        },
        {"title": "RC F"},
        {
          "title": "RX Series",
          "types": ["RX 300", "RX 330", "RX 350", "RX 400", "RX 450"]
        },
        {"title": "SC 400"},
        {"title": "SC 430"}
      ]
    },
    {
      "brand": "Ligier",
      "models": [
        {"title": "Ambra"},
        {"title": "Be Sun"},
        {"title": "JS 50"},
        {"title": "JS 50 L"},
        {"title": "JS RC"},
        {"title": "Nova"},
        {"title": "Optima"},
        {"title": "X - Too"}
      ]
    },
    {
      "brand": "Lincoln",
      "models": [
        {"title": "Aviator"},
        {"title": "Continental"},
        {"title": "LS"},
        {"title": "Mark"},
        {"title": "Navigator"},
        {"title": "Town Car"}
      ]
    },
    {
      "brand": "Lotus",
      "models": [
        {"title": "340 R"},
        {"title": "Cortina"},
        {"title": "Elan"},
        {"title": "Elise"},
        {"title": "Elite"},
        {"title": "Esprit"},
        {"title": "Europa"},
        {"title": "Evora"},
        {"title": "Excel"},
        {"title": "Exige"},
        {"title": "Super Seven"}
      ]
    },
    {"brand": "Mahindra", "models": "Mahindra"},
    {
      "brand": "Maserati",
      "models": [
        {"title": "222"},
        {"title": "224"},
        {"title": "228"},
        {"title": "3200"},
        {"title": "418"},
        {"title": "420"},
        {"title": "4200"},
        {"title": "422"},
        {"title": "424"},
        {"title": "430"},
        {"title": "Biturbo"},
        {"title": "Ghibli"},
        {"title": "GranCabrio"},
        {"title": "Gransport"},
        {"title": "Granturismo"},
        {"title": "Indy"},
        {"title": "Karif"},
        {"title": "MC12"},
        {"title": "Merak"},
        {"title": "Quattroporte"},
        {"title": "Shamal"},
        {"title": "Spyder"}
      ]
    },
    {
      "brand": "Maybach",
      "models": [
        {"title": "57"},
        {"title": "62"}
      ]
    },
    {
      "brand": "Mazda",
      "models": [
        {"title": "121"},
        {"title": "2"},
        {"title": "3"},
        {"title": "323"},
        {"title": "5"},
        {"title": "6"},
        {"title": "626"},
        {"title": "929"},
        {"title": "B series"},
        {"title": "Bongo"},
        {"title": "BT-50"},
        {"title": "CX-3"},
        {"title": "CX-5"},
        {"title": "CX-7"},
        {"title": "CX-9"},
        {"title": "Demio"},
        {"title": "E series"},
        {"title": "Millenia"},
        {"title": "MPV"},
        {"title": "MX-3"},
        {"title": "MX-5"},
        {"title": "MX-6"},
        {"title": "Premacy"},
        {"title": "Protege"},
        {"title": "RX-6"},
        {"title": "RX-7"},
        {"title": "RX-8"},
        {"title": "Tribute"},
        {"title": "Xedos"}
      ]
    },
    {
      "brand": "McLaren",
      "models": [
        {"title": "650S Coupée"},
        {"title": "650S Spider"},
        {"title": "MP4-12C"}
      ]
    },
    {
      "brand": "Mercedes-Benz",
      "models": [
        {"title": "190"},
        {"title": "200"},
        {"title": "220"},
        {"title": "230"},
        {"title": "240"},
        {"title": "250"},
        {"title": "260"},
        {"title": "270"},
        {"title": "280"},
        {"title": "290"},
        {"title": "300"},
        {"title": "320"},
        {"title": "350"},
        {"title": "380"},
        {"title": "400"},
        {"title": "416"},
        {"title": "420"},
        {"title": "450"},
        {"title": "500"},
        {"title": "560"},
        {"title": "600"},
        {
          "title": "A-Klasse",
          "types": [
            "A 140",
            "A 150",
            "A 160",
            "A 170",
            "A 180",
            "A 190",
            "A 200",
            "A 210",
            "A 220",
            "A 250",
            "A 45 AMG"
          ]
        },
        {"title": "AMG GT"},
        {"title": "AMG GT S"},
        {
          "title": "B-Klasse",
          "types": [
            "B 150",
            "B 160",
            "B 170",
            "B 180",
            "B 200",
            "B 220",
            "B 250",
            "B Electric Drive"
          ]
        },
        {
          "title": "C-Klasse",
          "types": [
            "C 160",
            "C 180",
            "C 200",
            "C 220",
            "C 230",
            "C 240",
            "C 250",
            "C 270",
            "C 280",
            "C 30 AMG",
            "C 300",
            "C 32 AMG",
            "C 320",
            "C 350",
            "C 36 AMG",
            "C 400",
            "C 43 AMG",
            "C 450 AMG",
            "C 55 AMG",
            "C 63 AMG"
          ]
        },
        {
          "title": "CE-Klasse",
          "types": ["CE 200", "CE 220", "CE 230", "CE 280", "CE 300", "CE 320"]
        },
        {"title": "Citan"},
        {
          "title": "CL-Klasse",
          "types": [
            "CL 160",
            "CL 180",
            "CL 200",
            "CL 220",
            "CL 230",
            "CL 320",
            "CL 420",
            "CL 500",
            "CL 55 AMG",
            "CL 600",
            "CL 63 AMG",
            "CL 65 AMG"
          ]
        },
        {
          "title": "CLA-Klasse",
          "types": [
            "CLA 180",
            "CLA 200",
            "CLA 220",
            "CLA 250",
            "CLA 45 AMG",
            "CLA Shooting Brake"
          ]
        },
        {
          "title": "CLC-Klasse",
          "types": [
            "CLC 160",
            "CLC 180",
            "CLC 200",
            "CLC 220",
            "CLC 230",
            "CLC 250",
            "CLC 350"
          ]
        },
        {
          "title": "CLK-Klasse",
          "types": [
            "CLK 200",
            "CLK 220",
            "CLK 230",
            "CLK 240",
            "CLK 270",
            "CLK 280",
            "CLK 320",
            "CLK 350",
            "CLK 430",
            "CLK 500",
            "CLK 55 AMG",
            "CLK 63 AMG"
          ]
        },
        {
          "title": "CLS-Klasse",
          "types": [
            "CLS 220",
            "CLS 250",
            "CLS 280",
            "CLS 300",
            "CLS 320",
            "CLS 350",
            "CLS 400",
            "CLS 500",
            "CLS 55 AMG",
            "CLS 63 AMG",
            "CLS Shooting Brake"
          ]
        },
        {
          "title": "E-Klasse",
          "types": [
            "E 200",
            "E 220",
            "E 230",
            "E 240",
            "E 250",
            "E 260",
            "E 270",
            "E 280",
            "E 290",
            "E 300",
            "E 320",
            "E 350",
            "E 36 AMG",
            "E 400",
            "E 420",
            "E 430",
            "E 50",
            "E 500",
            "E 55 AMG",
            "E 60 AMG",
            "E 63 AMG"
          ]
        },
        {
          "title": "G-Klasse",
          "types": [
            "G 230",
            "G 240",
            "G 250",
            "G 270",
            "G 280",
            "G 290",
            "G 300",
            "G 320",
            "G 350",
            "G 400",
            "G 500",
            "G 55 AMG",
            "G 63 AMG",
            "G 65 AMG"
          ]
        },
        {
          "title": "GL-Klasse",
          "types": [
            "GL 320",
            "GL 350",
            "GL 400",
            "GL 420",
            "GL 450",
            "GL 500",
            "GL 55 AMG",
            "GL 63 AMG"
          ]
        },
        {
          "title": "GLA-Klasse",
          "types": ["GLA 180", "GLA 200", "GLA 220", "GLA 250", "GLA 45 AMG"]
        },
        {"title": "GLE 450 AMG"},
        {
          "title": "GLK-Klasse",
          "types": [
            "GLK 200",
            "GLK 220",
            "GLK 250",
            "GLK 280",
            "GLK 300",
            "GLK 320",
            "GLK 350"
          ]
        },
        {"title": "MB 100"},
        {
          "title": "ML-Klasse",
          "types": [
            "ML 230",
            "ML 250",
            "ML 270",
            "ML 280",
            "ML 300",
            "ML 320",
            "ML 350",
            "ML 400",
            "ML 420",
            "ML 430",
            "ML 450",
            "ML 500",
            "ML 55 AMG",
            "ML 63 AMG"
          ]
        },
        {
          "title": "R-Klasse",
          "types": ["R 280", "R 300", "R 320", "R 350", "R 500", "R 63 AMG"]
        },
        {
          "title": "S-Klasse",
          "types": [
            "S 250",
            "S 260",
            "S 280",
            "S 300",
            "S 320",
            "S 350",
            "S 400",
            "S 420",
            "S 430",
            "S 450",
            "S 500",
            "S 55",
            "S 550",
            "S 600",
            "S 63 AMG",
            "S 65 AMG"
          ]
        },
        {
          "title": "SL-Klasse",
          "types": [
            "SL 280",
            "SL 300",
            "SL 320",
            "SL 350",
            "SL 380",
            "SL 400",
            "SL 420",
            "SL 450",
            "SL 500",
            "SL 55 AMG",
            "SL 560",
            "SL 60 AMG",
            "SL 600",
            "SL 63 AMG",
            "SL 65 AMG",
            "SL 70 AMG",
            "SL 73 AMG"
          ]
        },
        {
          "title": "SLK-Klasse",
          "types": [
            "SLK 200",
            "SLK 230",
            "SLK 250",
            "SLK 280",
            "SLK 300",
            "SLK 32 AMG",
            "SLK 320",
            "SLK 350",
            "SLK 55 AMG"
          ]
        },
        {"title": "SLR"},
        {"title": "SLS AMG"},
        {"title": "Sprinter"},
        {
          "title": "V-Klasse",
          "types": ["V 200", "V 220", "V 230", "V 250", "V 280"]
        },
        {"title": "Vaneo"},
        {"title": "Vario"},
        {"title": "Viano"},
        {"title": "Vito"}
      ]
    },
    {
      "brand": "MG",
      "models": [
        {"title": "MGA"},
        {"title": "MGB"},
        {"title": "MGF"},
        {"title": "Midget"},
        {"title": "Montego"},
        {"title": "TD"},
        {"title": "TF"},
        {"title": "ZR"},
        {"title": "ZS"},
        {"title": "ZT"}
      ]
    },
    {
      "brand": "Microcar",
      "models": [
        {"title": "DUÃƒË†"},
        {"title": "Flex"},
        {"title": "M.Go"},
        {"title": "M-8"},
        {"title": "MC1"},
        {"title": "MC2"}
      ]
    },
    {
      "brand": "MINI",
      "models": [
        {
          "title": "Cabrio Series",
          "types": [
            "Cooper Cabrio",
            "Cooper D Cabrio",
            "Cooper S Cabrio",
            "Cooper SD Cabrio",
            "John Cooper Works Cabrio",
            "One Cabrio"
          ]
        },
        {
          "title": "Clubman Series",
          "types": [
            "Cooper Clubman",
            "Cooper D Clubman",
            "Cooper S Clubman",
            "Cooper SD Clubman",
            "John Cooper Works Clubman",
            "One Clubman",
            "One D Clubman"
          ]
        },
        {"title": "Clubvan"},
        {
          "title": "Countryman Series",
          "types": [
            "Cooper Countryman",
            "Cooper D Countryman",
            "Cooper S Countryman",
            "Cooper SD Countryman",
            "John Cooper Works Countryman",
            "One Countryman",
            "One D Countryman"
          ]
        },
        {
          "title": "Coupe Series",
          "types": [
            "Cooper CoupÃƒÂ©",
            "Cooper S CoupÃƒÂ©",
            "Cooper SD CoupÃƒÂ©",
            "John Cooper Works CoupÃƒÂ©"
          ]
        },
        {
          "title": "MINI",
          "types": [
            "1000",
            "1300",
            "Cooper",
            "Cooper D",
            "Cooper S",
            "Cooper SD",
            "John Cooper Works",
            "ONE",
            "One D"
          ]
        },
        {
          "title": "Paceman Series",
          "types": [
            "Cooper D Paceman",
            "Cooper Paceman",
            "Cooper S Paceman",
            "Cooper SD Paceman",
            "John Cooper Works Paceman"
          ]
        },
        {
          "title": "Roadster Series",
          "types": [
            "Cooper Roadster",
            "Cooper S Roadster",
            "Cooper SD Roadster",
            "John Cooper Works Roadster"
          ]
        }
      ]
    },
    {
      "brand": "Mitsubishi",
      "models": [
        {"title": "3000 GT"},
        {"title": "ASX"},
        {"title": "Canter"},
        {"title": "Carisma"},
        {"title": "Colt"},
        {"title": "Cordia"},
        {"title": "Cosmos"},
        {"title": "Diamante"},
        {"title": "Eclipse"},
        {"title": "Galant"},
        {"title": "Galloper"},
        {"title": "Grandis"},
        {"title": "Electric Vehicle (i-MiEV)"},
        {"title": "L200"},
        {"title": "L300"},
        {"title": "L400"},
        {"title": "Lancer"},
        {"title": "Mirage"},
        {"title": "Montero"},
        {"title": "Outlander"},
        {"title": "Pajero"},
        {"title": "Pajero Pinin"},
        {"title": "Pick-up"},
        {"title": "Plug-in Hybrid Outlander"},
        {"title": "Santamo"},
        {"title": "Sapporo"},
        {"title": "Sigma"},
        {"title": "Space Gear"},
        {"title": "Space Runner"},
        {"title": "Space Star"},
        {"title": "Space Wagon"},
        {"title": "Starion"},
        {"title": "Tredia"}
      ]
    },
    {
      "brand": "Morgan",
      "models": [
        {"title": "4/4"},
        {"title": "Aero 8"},
        {"title": "Plus 4"},
        {"title": "Plus 8"},
        {"title": "Roadster"}
      ]
    },
    {
      "brand": "Nissan",
      "models": [
        {"title": "100 NX"},
        {"title": "200 SX"},
        {"title": "240 SX"},
        {"title": "280 ZX"},
        {"title": "300 ZX"},
        {"title": "350Z"},
        {"title": "370Z"},
        {"title": "Almera"},
        {"title": "Almera Tino"},
        {"title": "Altima"},
        {"title": "Armada"},
        {"title": "Bluebird"},
        {"title": "Cabstar"},
        {"title": "Cargo"},
        {"title": "Cherry"},
        {"title": "Cube"},
        {"title": "e-NV200"},
        {"title": "Evalia"},
        {"title": "Frontier"},
        {"title": "GT-R"},
        {"title": "Interstar"},
        {"title": "Juke"},
        {"title": "King Cab"},
        {"title": "Kubistar"},
        {"title": "Laurel"},
        {"title": "Leaf"},
        {"title": "March"},
        {"title": "Maxima"},
        {"title": "Micra"},
        {"title": "Murano"},
        {"title": "Navara"},
        {"title": "Note"},
        {"title": "NP 300"},
        {"title": "NV200"},
        {"title": "NV400"},
        {"title": "Pathfinder"},
        {"title": "Patrol"},
        {"title": "PickUp"},
        {"title": "Pixo"},
        {"title": "Prairie"},
        {"title": "Primastar"},
        {"title": "Primera"},
        {"title": "Pulsar"},
        {"title": "Qashqai"},
        {"title": "Qashqai+2"},
        {"title": "Quest"},
        {"title": "Sentra"},
        {"title": "Serena"},
        {"title": "Silvia"},
        {"title": "Skyline"},
        {"title": "Sunny"},
        {"title": "Terrano"},
        {"title": "Tiida"},
        {"title": "Titan"},
        {"title": "Trade"},
        {"title": "Urvan"},
        {"title": "Vanette"},
        {"title": "X-Trail"}
      ]
    },
    {"brand": "NSU", "models": "NSU"},
    {
      "brand": "Oldsmobile",
      "models": [
        {"title": "Bravada"},
        {"title": "Custom Cruiser"},
        {"title": "Cutlass"},
        {"title": "Delta 88"},
        {"title": "Silhouette"},
        {"title": "Supreme"},
        {"title": "Toronado"}
      ]
    },
    {
      "brand": "Opel",
      "models": [
        {"title": "Adam"},
        {"title": "Agila"},
        {"title": "Ampera"},
        {"title": "Antara"},
        {"title": "Arena"},
        {"title": "Ascona"},
        {"title": "Astra"},
        {"title": "Calibra"},
        {"title": "Campo"},
        {"title": "Cascada"},
        {"title": "Cavalier"},
        {"title": "Combo"},
        {"title": "Commodore"},
        {"title": "Corsa"},
        {"title": "Diplomat"},
        {"title": "Frontera"},
        {"title": "GT"},
        {"title": "Insignia"},
        {"title": "Insignia CT"},
        {"title": "Kadett"},
        {"title": "Karl"},
        {"title": "Manta"},
        {"title": "Meriva"},
        {"title": "Mokka"},
        {"title": "Monterey"},
        {"title": "Monza"},
        {"title": "Movano"},
        {"title": "Nova"},
        {"title": "Omega"},
        {"title": "Pick Up Sportscap"},
        {"title": "Rekord"},
        {"title": "Senator"},
        {"title": "Signum"},
        {"title": "Sintra"},
        {"title": "Speedster"},
        {"title": "Tigra"},
        {"title": "Vectra"},
        {"title": "Vivaro"},
        {"title": "Zafira"},
        {"title": "Zafira Tourer"}
      ]
    },
    {"brand": "Pagani", "models": "Pagani"},
    {
      "brand": "Peugeot",
      "models": [
        {"title": "1007"},
        {"title": "104"},
        {"title": "106"},
        {"title": "107"},
        {"title": "108"},
        {"title": "2008"},
        {"title": "204"},
        {"title": "205"},
        {"title": "206"},
        {"title": "207"},
        {"title": "208"},
        {"title": "3008"},
        {"title": "301"},
        {"title": "304"},
        {"title": "305"},
        {"title": "306"},
        {"title": "307"},
        {"title": "308"},
        {"title": "309"},
        {"title": "4007"},
        {"title": "4008"},
        {"title": "404"},
        {"title": "405"},
        {"title": "406"},
        {"title": "407"},
        {"title": "5008"},
        {"title": "504"},
        {"title": "505"},
        {"title": "508"},
        {"title": "604"},
        {"title": "605"},
        {"title": "607"},
        {"title": "806"},
        {"title": "807"},
        {"title": "Bipper"},
        {"title": "Bipper Tepee"},
        {"title": "Boxer"},
        {"title": "Expert"},
        {"title": "Expert Tepee"},
        {"title": "iOn"},
        {"title": "J5"},
        {"title": "Partner"},
        {"title": "Partner Tepee"},
        {"title": "RCZ"},
        {"title": "TePee"}
      ]
    },
    {
      "brand": "Piaggio",
      "models": [
        {"title": "APE"},
        {"title": "APE TM"},
        {"title": "Porter"}
      ]
    },
    {
      "brand": "Plymouth",
      "models": [
        {"title": "Prowler"}
      ]
    },
    {
      "brand": "Pontiac",
      "models": [
        {"title": "6000"},
        {"title": "Bonneville"},
        {"title": "Fiero"},
        {"title": "Firebird"},
        {"title": "G6"},
        {"title": "Grand-Am"},
        {"title": "Grand-Prix"},
        {"title": "GTO"},
        {"title": "Montana"},
        {"title": "Solstice"},
        {"title": "Sunbird"},
        {"title": "Sunfire"},
        {"title": "Targa"},
        {"title": "Trans Am"},
        {"title": "Trans Sport"},
        {"title": "Vibe"}
      ]
    },
    {
      "brand": "Porsche",
      "models": [
        {"title": "356"},
        {
          "title": "911",
          "types": ["911", "930", "964", "991", "993", "996", "997"]
        },
        {"title": "912"},
        {"title": "914"},
        {"title": "918"},
        {"title": "924"},
        {"title": "928"},
        {"title": "944"},
        {"title": "959"},
        {"title": "962"},
        {"title": "968"},
        {"title": "Boxster"},
        {"title": "Carrera GT"},
        {"title": "Cayenne"},
        {"title": "Cayman"},
        {"title": "Macan"},
        {"title": "Panamera"}
      ]
    },
    {
      "brand": "Proton",
      "models": [
        {"title": "300 Serie"},
        {"title": "400 Serie"}
      ]
    },
    {
      "brand": "Renault",
      "models": [
        {"title": "Alpine A110"},
        {"title": "Alpine A310"},
        {"title": "Alpine V6"},
        {"title": "Avantime"},
        {"title": "Captur"},
        {"title": "Clio"},
        {"title": "Coupe"},
        {"title": "Espace"},
        {"title": "Express"},
        {"title": "Fluence"},
        {"title": "Fuego"},
        {"title": "Grand Espace"},
        {"title": "Grand Modus"},
        {"title": "Grand Scenic"},
        {"title": "Kadjar"},
        {"title": "Kangoo"},
        {"title": "Koleos"},
        {"title": "Laguna"},
        {"title": "Latitude"},
        {"title": "Mascott"},
        {"title": "Master"},
        {"title": "Megane"},
        {"title": "Modus"},
        {"title": "P 1400"},
        {"title": "R 11"},
        {"title": "R 14"},
        {"title": "R 18"},
        {"title": "R 19"},
        {"title": "R 20"},
        {"title": "R 21"},
        {"title": "R 25"},
        {"title": "R 30"},
        {"title": "R 4"},
        {"title": "R 5"},
        {"title": "R 6"},
        {"title": "R 9"},
        {"title": "Rapid"},
        {"title": "Safrane"},
        {"title": "Scenic"},
        {"title": "Spider"},
        {"title": "Trafic"},
        {"title": "Twingo"},
        {"title": "Twizy"},
        {"title": "Vel Satis"},
        {"title": "Wind"},
        {"title": "ZOE"}
      ]
    },
    {
      "brand": "Rolls-Royce",
      "models": [
        {"title": "Corniche"},
        {"title": "Flying Spur"},
        {"title": "Ghost"},
        {"title": "Park Ward"},
        {"title": "Phantom"},
        {"title": "Silver Cloud"},
        {"title": "Silver Dawn"},
        {"title": "Silver Seraph"},
        {"title": "Silver Shadow"},
        {"title": "Silver Spirit"},
        {"title": "Silver Spur"},
        {"title": "Wraith"}
      ]
    },
    {
      "brand": "Rover",
      "models": [
        {"title": "100"},
        {"title": "111"},
        {"title": "114"},
        {"title": "115"},
        {"title": "200"},
        {"title": "213"},
        {"title": "214"},
        {"title": "216"},
        {"title": "218"},
        {"title": "220"},
        {"title": "25"},
        {"title": "400"},
        {"title": "414"},
        {"title": "416"},
        {"title": "418"},
        {"title": "420"},
        {"title": "45"},
        {"title": "600"},
        {"title": "618"},
        {"title": "620"},
        {"title": "623"},
        {"title": "75"},
        {"title": "800"},
        {"title": "820"},
        {"title": "825"},
        {"title": "827"},
        {"title": "City Rover"},
        {"title": "Metro"},
        {"title": "Montego"},
        {"title": "SD"},
        {"title": "Streetwise"}
      ]
    },
    {"brand": "Ruf", "models": "Ruf"},
    {
      "brand": "Saab",
      "models": [
        {"title": "9-3"},
        {"title": "9-4X"},
        {"title": "9-5"},
        {"title": "9-7X"},
        {"title": "90"},
        {"title": "900"},
        {"title": "9000"},
        {"title": "96"},
        {"title": "99"}
      ]
    },
    {"brand": "Santana", "models": "Santana"},
    {
      "brand": "Seat",
      "models": [
        {"title": "Alhambra"},
        {"title": "Altea"},
        {"title": "Arosa"},
        {"title": "Cordoba"},
        {"title": "Exeo"},
        {"title": "Ibiza"},
        {"title": "Inca"},
        {"title": "Leon"},
        {"title": "Malaga"},
        {"title": "Marbella"},
        {"title": "Mii"},
        {"title": "Terra"},
        {"title": "Toledo"}
      ]
    },
    {
      "brand": "Skoda",
      "models": [
        {"title": "105"},
        {"title": "120"},
        {"title": "130"},
        {"title": "135"},
        {"title": "Citigo"},
        {"title": "Fabia"},
        {"title": "Favorit"},
        {"title": "Felicia"},
        {"title": "Forman"},
        {"title": "Octavia"},
        {"title": "Pick-up"},
        {"title": "Praktik"},
        {"title": "Rapid"},
        {"title": "Roomster"},
        {"title": "Superb"},
        {"title": "Yeti"}
      ]
    },
    {
      "brand": "Smart",
      "models": [
        {"title": "Crossblade"},
        {"title": "ForFour"},
        {"title": "ForTwo"},
        {"title": "Roadster"}
      ]
    },
    {"brand": "speedART", "models": "speedART"},
    {
      "brand": "Spyker",
      "models": [
        {"title": "C8"},
        {"title": "C8 AILERON"},
        {"title": "C8 DOUBLE 12 S"},
        {"title": "C8 LAVIOLETTE SWB"},
        {"title": "C8 SPYDER SWB"}
      ]
    },
    {
      "brand": "Ssangyong",
      "models": [
        {"title": "Actyon"},
        {"title": "Family"},
        {"title": "Korando"},
        {"title": "Kyron"},
        {"title": "MUSSO"},
        {"title": "REXTON"},
        {"title": "Rodius"},
        {"title": "Tivoli"}
      ]
    },
    {
      "brand": "Subaru",
      "models": [
        {"title": "B9 Tribeca"},
        {"title": "Baja"},
        {"title": "BRZ"},
        {"title": "Forester"},
        {"title": "Impreza"},
        {"title": "Justy"},
        {"title": "Legacy"},
        {"title": "Libero"},
        {"title": "OUTBACK"},
        {"title": "SVX"},
        {"title": "Trezia"},
        {"title": "Tribeca"},
        {"title": "Vivio"},
        {"title": "XT"},
        {"title": "XV"}
      ]
    },
    {
      "brand": "Suzuki",
      "models": [
        {"title": "Alto"},
        {"title": "Baleno"},
        {"title": "Cappuccino"},
        {"title": "Carry"},
        {"title": "Celerio"},
        {"title": "Grand Vitara"},
        {"title": "Ignis"},
        {"title": "Jimny"},
        {"title": "Kizashi"},
        {"title": "Liana"},
        {"title": "LJ"},
        {"title": "SJ Samurai"},
        {"title": "Splash"},
        {"title": "Super-Carry"},
        {"title": "Swift"},
        {"title": "SX4"},
        {"title": "SX4 S-Cross"},
        {"title": "Vitara"},
        {"title": "Wagon R+"},
        {"title": "X-90"}
      ]
    },
    {
      "brand": "Talbot",
      "models": [
        {"title": "Horizon"},
        {"title": "Samba"}
      ]
    },
    {
      "brand": "Tata",
      "models": [
        {"title": "Indica"},
        {"title": "Indigo"},
        {"title": "Nano"},
        {"title": "Safari"},
        {"title": "Sumo"},
        {"title": "Telcoline"},
        {"title": "Telcosport"},
        {"title": "Xenon"}
      ]
    },
    {"brand": "TECHART", "models": "TECHART"},
    {
      "brand": "Tesla",
      "models": [
        {"title": "Model 3"},
        {"title": "Model S"},
        {"title": "Model X"},
        {"title": "Roadster"}
      ]
    },
    {
      "brand": "Toyota",
      "models": [
        {"title": "4-Runner"},
        {"title": "Auris"},
        {"title": "Auris Touring Sports"},
        {"title": "Avalon"},
        {"title": "Avensis"},
        {"title": "Avensis Verso"},
        {"title": "Aygo"},
        {"title": "Camry"},
        {"title": "Carina"},
        {"title": "Celica"},
        {"title": "Corolla"},
        {"title": "Corolla Verso"},
        {"title": "Cressida"},
        {"title": "Crown"},
        {"title": "Dyna"},
        {"title": "FCV"},
        {"title": "FJ"},
        {"title": "GT86"},
        {"title": "Hiace"},
        {"title": "Highlander"},
        {"title": "Hilux"},
        {"title": "IQ"},
        {"title": "Land Cruiser"},
        {"title": "Lite-Ace"},
        {"title": "MR 2"},
        {"title": "Paseo"},
        {"title": "Picnic"},
        {"title": "Previa"},
        {"title": "Prius"},
        {"title": "Prius+"},
        {"title": "Proace"},
        {"title": "RAV 4"},
        {"title": "Sequoia"},
        {"title": "Sienna"},
        {"title": "Starlet"},
        {"title": "Supra"},
        {"title": "Tacoma"},
        {"title": "Tercel"},
        {"title": "Tundra"},
        {"title": "Quest"},
        {"title": "Urban Cruiser"},
        {"title": "Verso"},
        {"title": "Verso-S"},
        {"title": "Yaris"}
      ]
    },
    {
      "brand": "Trabant",
      "models": [
        {"title": "601"}
      ]
    },
    {
      "brand": "Triumph",
      "models": [
        {"title": "Dolomite"},
        {"title": "Moss"},
        {"title": "Spitfire"},
        {"title": "TR3"},
        {"title": "TR4"},
        {"title": "TR5"},
        {"title": "TR6"},
        {"title": "TR7"},
        {"title": "TR8"}
      ]
    },
    {
      "brand": "TVR",
      "models": [
        {"title": "Chimaera"},
        {"title": "Griffith"},
        {"title": "Tuscan"}
      ]
    },
    {
      "brand": "Volkswagen",
      "models": [
        {"title": "181"},
        {"title": "Amarok"},
        {"title": "Beetle"},
        {"title": "Bora"},
        {"title": "Buggy"},
        {"title": "Caddy"},
        {"title": "CC"},
        {"title": "Corrado"},
        {"title": "Crafter"},
        {"title": "Eos"},
        {"title": "Fox"},
        {
          "title": "Golf",
          "types": ["Golf", "Golf Plus", "Golf Sportsvan"]
        },
        {"title": "Iltis"},
        {"title": "Jetta"},
        {"title": "Karmann Ghia"},
        {"title": "Käfer"},
        {"title": "LT"},
        {"title": "Lupo"},
        {"title": "New Beetle"},
        {
          "title": "Passat",
          "types": ["Passat", "Passat CC"]
        },
        {"title": "Phaeton"},
        {"title": "Polo"},
        {"title": "Routan"},
        {"title": "Santana"},
        {"title": "Scirocco"},
        {"title": "Sharan"},
        {"title": "T1"},
        {"title": "T2"},
        {
          "title": "T3",
          "types": ["T3 Caravelle", "T3 Multivan", "T3 other", "T3 Kombi"]
        },
        {
          "title": "T4",
          "types": [
            "T4 California",
            "T4 Caravelle",
            "T4 Multivan",
            "T4 other",
            "T4 Kombi"
          ]
        },
        {
          "title": "T5",
          "types": [
            "T5 California",
            "T5 Caravelle",
            "T5 Multivan",
            "T5 Shuttle",
            "T5 other",
            "T5 Kombi"
          ]
        },
        {
          "title": "T6",
          "types": [
            "T6 California",
            "T6 Caravelle",
            "T6 Kombi",
            "T6 Multivan",
            "T6 other"
          ]
        },
        {"title": "Taro"},
        {"title": "Tiguan"},
        {"title": "Touareg"},
        {"title": "Touran"},
        {"title": "up!"},
        {"title": "Vento"},
        {"title": "XL1"}
      ]
    },
    {
      "brand": "Volvo",
      "models": [
        {"title": "240"},
        {"title": "244"},
        {"title": "245"},
        {"title": "262"},
        {"title": "264"},
        {"title": "340"},
        {"title": "360"},
        {"title": "440"},
        {"title": "460"},
        {"title": "480"},
        {"title": "740"},
        {"title": "744"},
        {"title": "745"},
        {"title": "760"},
        {"title": "780"},
        {"title": "850"},
        {"title": "855"},
        {"title": "940"},
        {"title": "944"},
        {"title": "945"},
        {"title": "960"},
        {"title": "965"},
        {"title": "Amazon"},
        {"title": "C30"},
        {"title": "C70"},
        {"title": "Polar"},
        {"title": "S40"},
        {"title": "S60"},
        {"title": "S70"},
        {"title": "S80"},
        {"title": "S90"},
        {"title": "V40"},
        {"title": "V40 CC"},
        {"title": "V50"},
        {"title": "V60"},
        {"title": "V70"},
        {"title": "V90"},
        {"title": "XC 60"},
        {"title": "XC 70"},
        {"title": "XC 90"}
      ]
    },
    {
      "brand": "Wartburg",
      "models": [
        {"title": "311"},
        {"title": "353"}
      ]
    },
    {"brand": "Westfield", "models": "Westfield"},
    {
      "brand": "Wiesmann",
      "models": [
        {"title": "MF 25"},
        {"title": "MF 28"},
        {"title": "MF 3"},
        {"title": "MF 30"},
        {"title": "MF 35"},
        {"title": "MF 4"},
        {"title": "MF 5"}
      ]
    }
  ];
}
