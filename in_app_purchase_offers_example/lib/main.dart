import 'package:flutter/material.dart';
import 'package:in_app_purchase_offers/in_app_purchase_offers.dart';
import 'package:in_app_purchase_offers_example/store/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final store = Store();

  MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        store: store,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Store store;

  const MyHomePage({
    super.key,
    required this.title,
    required this.store,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            StreamBuilder(stream: widget.store.products,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Loading...');
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.data?.isEmpty == true) {
                  return const Text('No products found');
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var product in snapshot.requireData)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Product: ${product.title}'),
                          const SizedBox(height: 18),
                          Builder(
                            builder: (context) {
                              debugPrint(product.introductoryOffer?.forDisplay(context));
                              return Text('Intro Offer: ${product.introductoryOffer?.forDisplay(context)}', maxLines: 3);
                            }
                          ),
                          const SizedBox(height: 12),
                          for (final offer in product.promotionalOffers) ...[
                            Text(offer.id?.toString() ?? 'No ID', style: DefaultTextStyle.of(context).style.copyWith(fontWeight: FontWeight.bold)),
                            Builder(
                              builder: (context) {
                                debugPrint(offer.forDisplay(context));
                                return Text('Promo Offer: ${offer.forDisplay(context)}', maxLines: 3);
                              }
                            ),
                            const SizedBox(height: 12),
                          ],
                          const SizedBox(height: 24),
                        ],
                      )
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () async {
                try {
                  await widget.store.queryProducts();
                } catch (e) {
                  debugPrint('Error: $e');
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e'))
                    );
                  }
                }
              },
              child: const Text('Query Products')
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () async {
                try {
                  await widget.store.restorePurchases();
                } catch (e) {
                  debugPrint('Error: $e');
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e'))
                    );
                  }
                }
              },
              child: const Text('Restore Purchases')
            ),
          ],
        ),
      ),
    );
  }
}
