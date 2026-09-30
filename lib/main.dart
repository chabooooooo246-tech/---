import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'إخفاء التطبيقات',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const HideAppsPage(),
    );
  }
}

class HideAppsPage extends StatefulWidget {
  const HideAppsPage({super.key});

  @override
  State<HideAppsPage> createState() => _HideAppsPageState();
}

class _HideAppsPageState extends State<HideAppsPage> {
  final List<Map<String, dynamic>> apps = [
    {'name': 'YouTube', 'icon': Icons.play_arrow, 'hidden': false},
    {'name': 'WhatsApp', 'icon': Icons.chat, 'hidden': false},
    {'name': 'Facebook', 'icon': Icons.facebook, 'hidden': false},
    {'name': 'Instagram', 'icon': Icons.camera_alt, 'hidden': false},
  ];

  @override
  Widget build(BuildContext context) {
    final visibleApps =
        apps.where((app) => app['hidden'] == false).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('إخفاء التطبيقات'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.apps,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 12),
            const Text(
              'اختر التطبيقات التي تريد إخفاءها',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  final app = apps[index];

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(app['icon']),
                      ),
                      title: Text(app['name']),
                      subtitle: Text(
                        app['hidden'] ? 'مخفي' : 'ظاهر',
                      ),
                      trailing: Switch(
                        value: app['hidden'],
                        onChanged: (value) {
                          setState(() {
                            app['hidden'] = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            Text(
              'التطبيقات الظاهرة: ${visibleApps.length}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}