import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final emails = [
  (
    subject: 'Hello world',
    sender: 'Foo Bar',
    initials: 'FB',
  ),
  (
    subject: 'Delicious ice cream!',
    sender: 'Happy Customer',
    initials: 'HC',
  )
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Email app'),
      ),

      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(emails[index].initials)
                .padding(padding: EdgeInsets.all(16.0))
                .decoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    shape: BoxShape.circle,
                  ),
                ),

              title: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0,
                children: [
                  Text('Unread')
                    .padding(padding: EdgeInsets.all(8.0))
                    .decoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.amber.shade300,
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                    ),

                  Text(emails[index].subject),
                ],
              ),

              trailing: Icon(Icons.more_vert)
                .padding(padding: const EdgeInsets.all(8.0))
                .decoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
            ),
          );
        },
      ),
    );
  }
}
