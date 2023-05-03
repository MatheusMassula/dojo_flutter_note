# dojo_flutter_note

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## What to expect

1. The app will allow the user make a CRUD in notes with:
- title - String (required)
- description - String (required)
- tag - String (nullable)

2. The app will allow the user to make a CRUD in tags (basically a strings)

## Screens
1. Home screen - List the notes saved on the app
2. Note detail - Display the detail of an exisiting note allowing user to edit a note or allow user insert detail to create a new one
3. Tags screen - Display tags
4. Tag details - Display the detail of an exisiting tag allowing user to edit a tag or insert a new one (Let some functions to be done on DOJO)

## Run on your PC
- open the terminal on project folder
- run the command `flutter pub run build_runner build --delete-conflicting-outputs` to generate the database
- 