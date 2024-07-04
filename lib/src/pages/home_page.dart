import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/models.dart';
import 'country_page.dart';

class HomePage extends StatelessWidget {
  final List<Continent> continents = [
  Continent('Asia', 700),
  Continent('Europe', 600),
  Continent('North America', 400),
  Continent('South America', 250),
  Continent('Africa', 200),
  Continent('Australia', 150),
  Continent('Antarctica', 100),
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
    Country('Vietnam', ['Viettel', 'Vinamilk', 'Vingroup', 'Petrolimex']),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand App'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 146, 140, 140),
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
                             width: 20,
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 94, 86, 86),
                                Color.fromARGB(255, 0, 0, 0), 
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
                                angle: -0, // Rotate the labels by -0.5 radians (~28.6 degrees)
                                child: Text(
                                  continents[value.toInt()].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 7.5, 
                                    color: Color.fromARGB(218, 0, 0, 0),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    elevation: 8.0, // Increased elevation for a more pronounced shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
                      splashColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), // More pronounced splash color
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0), // Dark charcoal background color
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 107, 106, 106).withOpacity(0.4), // More prominent shadow
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
                          title: Text(
                            countries[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13, // Slightly larger font size for prominence
                              color: Color.fromARGB(255, 187, 180, 180), // White color for better contrast
                              // shadows: [
                              //   Shadow(
                              //     blurRadius: 6.0,
                              //     color: Color.fromARGB(255, 147, 145, 145).withOpacity(0.6), // Darker shadow for text
                              //     offset: Offset(2, 2),
                              //   ),
                              // ],
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 158, 158, 158), // White icon for better contrast
                            size: 20, // Slightly larger icon size for emphasis
                            shadows: [
                              Shadow(
                                blurRadius: 6.0,
                                color: Color.fromARGB(255, 131, 131, 131).withOpacity(0.6),
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
