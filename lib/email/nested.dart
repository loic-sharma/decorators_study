import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Email app'),
        ),
        body: const EmailPage(),
      ),
    ),
  );
}

class Email {
  Email({required this.subject, required this.sender});

  final String sender;
  final String subject;
}

final emails = [
  Email(
    sender: 'FN',
    subject: 'Need flour?',
  ),
  Email(
    sender: 'HC',
    subject: 'Thank you for the coffee!',
  ),
];


class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: emails.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(emails[index].sender)
              ),
            ),

            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8.0,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade300,
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Unread'),
                  ),
                ),

                Text(emails[index].subject),
              ],
            ),

            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
