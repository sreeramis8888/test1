import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/models.dart';
import 'country_page.dart';

class HomePage extends StatelessWidget {
  final List<Continent> continents = [
    Continent('Asia', 500),
    Continent('Europe', 450),
    Continent('North America', 400),
    Continent('South America', 350),
    Continent('Africa', 300),
    Continent('Australia', 250),
    Continent('Antarctica', 200),
  ];

   final List<Country> countries = [
  Country('Argentina', ['YPF', 'Banco Galicia', 'Telecom Argentina', 'Grupo Clarín']),
  Country('Australia', ['BHP', 'Commonwealth Bank', 'Woolworths', 'Telstra']),
  Country('Brazil', ['Petrobras', 'Vale', 'Itaú Unibanco', 'Ambev']),
  Country('Canada', ['Shopify', 'Royal Bank of Canada', 'Scotiabank', 'Lululemon']),
  Country('China', ['Huawei', 'ICBC', 'Tencent', 'China Construction Bank']),
  Country('France', ['LVMH', 'L\'Oreal', 'Renault', 'Total']),
  Country('Germany', ['Volkswagen', 'Siemens', 'BMW', 'Adidas']),
  Country('India', ['Tata', 'Reliance', 'Infosys', 'Wipro']),
  Country('Indonesia', ['Bank Mandiri', 'Telkom Indonesia', 'Gudang Garam', 'Indofood']),
  Country('Italy', ['Fiat', 'Ferrari', 'Enel', 'Gucci']),
  Country('Japan', ['Toyota', 'Sony', 'Honda', 'Panasonic']),
  Country('Malaysia', ['Petronas', 'Maybank', 'CIMB', 'Sime Darby']),
  Country('Mexico', ['Pemex', 'América Móvil', 'Grupo Bimbo', 'Cemex']),
  Country('Netherlands', ['Shell', 'Unilever', 'Philips', 'Heineken']),
  Country('Nigeria', ['Dangote Group', 'MTN Nigeria', 'Zenith Bank', 'Guaranty Trust Bank']),
  Country('Philippines', ['PLDT', 'San Miguel Corporation', 'Ayala Corporation', 'Jollibee']),
  Country('Russia', ['Gazprom', 'Lukoil', 'Sberbank', 'Rosneft']),
  Country('Saudi Arabia', ['Saudi Aramco', 'SABIC', 'Al Rajhi Bank', 'Saudi Telecom Company']),
  Country('Singapore', ['DBS Bank', 'OCBC Bank', 'SingTel', 'CapitaLand']),
  Country('South Africa', ['Sasol', 'Naspers', 'MTN', 'Shoprite']),
  Country('South Korea', ['Samsung', 'Hyundai', 'LG', 'SK Hynix']),
  Country('Spain', ['Inditex (Zara)', 'Santander', 'BBVA', 'Iberdrola']),
  Country('Sweden', ['IKEA', 'H&M', 'Volvo', 'Ericsson']),
  Country('Switzerland', ['Nestlé', 'Roche', 'Novartis', 'UBS']),
  Country('Thailand', ['PTT', 'Thai Airways', 'CP Group', 'Bangkok Bank']),
  Country('Turkey', ['Turkish Airlines', 'Beko', 'Turkcell', 'Arçelik']),
  Country('United Kingdom', ['BP', 'HSBC', 'Unilever', 'Vodafone']),
  Country('USA', ['Apple', 'Microsoft', 'Google', 'Amazon']),
  Country('Vietnam', ['Viettel', 'Vinamilk', 'Vingroup', 'Petrolimex'])
];

  
    // Add more countries here...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand App'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 109, 87, 87),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 300,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BarChart(
                  BarChartData(
                    barGroups: continents.map((continent) {
                      return BarChartGroupData(
                        x: continents.indexOf(continent),
                        barRods: [
                          BarChartRodData(
                             toY: continent.brandCount.toDouble(),
                             width: 16,
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 81, 9, 9),
                                Color.fromARGB(255, 139, 56, 10),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                    titlesData: FlTitlesData(
                      leftTitles: const AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: true, reservedSize: 40),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Transform.rotate(
                                angle: -0.5, // Rotate the labels by -0.5 radians (~28.6 degrees)
                                child: Text(
                                  continents[value.toInt()].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12, // Reduced font size
                                    color: Color.fromARGB(255, 139, 56, 10),
                                  ),
                                ),
                              ),
                            );
                          },
                          reservedSize: 60, // Increased reserved size to accommodate rotation
                        ),
                      ),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    gridData: FlGridData(
                      show: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // List of countries
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return Card(
                  //   margin:
                  //       EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  //   elevation: 4.0,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15)),
                  //   child: ListTile(
                  //     contentPadding:
                  //         EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  //     title: Text(
                  //       countries[index].name,
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16,
                  //         color: const Color.fromARGB(255, 139, 56, 10),
                  //       ),
                  //     ),
                  //     trailing: Icon(Icons.arrow_forward_ios,
                  //         color: const Color.fromARGB(255, 0, 0, 0)),
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) =>
                  //               CountryPage(country: countries[index]),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // );

                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountryPage(country: countries[index]),
                          ),
                        );
                      },
                      splashColor: Colors.blueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade300,
                              Colors.red.shade400,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          title: Text(
                            countries[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 4.0,
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );


                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
