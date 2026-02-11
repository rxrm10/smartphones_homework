import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة المنتجات'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          ProductBox(
            name: 'آيفون',
            description: 'هاتف ذكي أنيق وسريع الأداء',
            price: 1000,
            color: Colors.purple,
          ),
          ProductBox(
            name: 'بيكسل',
            description: 'هاتف مميز بقدرات تصوير عالية',
            price: 800,
            color: Colors.blue,
          ),
          ProductBox(
            name: 'لابتوب',
            description: 'أفضل أداة للدراسة والبرمجة',
            price: 2000,
            color: Colors.green,
          ),
          ProductBox(
            name: 'تابلت',
            description: 'جهاز عملي للاجتماعات والدراسة',
            price: 1500,
            color: Colors.yellow,
          ),
          ProductBox(
            name: 'فلاش ميموري',
            description: 'وسيلة تخزين سهلة ومحمولة',
            price: 100,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final Color color;

  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 120,
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              color: color,
              alignment: Alignment.center,
              child: Text(
                name,
                style: const TextStyle(
                  color: Color.fromARGB(255, 250, 250, 250),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'السعر: $price',
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
