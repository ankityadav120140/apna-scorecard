import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to start a match by creating a document in Firestore
  Future<void> startMatch(
      String team1Name, String team2Name, int totalOvers) async {
    try {
      // Generate a unique match ID
      String matchId = _firestore.collection('matches').doc().id;

      // Create a match document
      await _firestore.collection('matches').doc(matchId).set({
        'team1Name': team1Name,
        'team2Name': team2Name,
        'totalOvers': totalOvers,
        'currentOver': '0.0', // Starting over (0 overs)
        'matchStatus': 'notStarted', // Match status initially
        'currentStriker': '',
        'currentNonStriker': '',
        'currentBowler': '',
      });

      // Create subcollections for teams (batting, bowling)
      await _createTeamSubcollections(matchId, 'team1');
      await _createTeamSubcollections(matchId, 'team2');

      // Notify listeners that the match has started (optional)
      notifyListeners();
    } catch (e) {
      print('Error starting match: $e');
    }
  }

  // Function to create subcollections for batting and bowling for each team
  Future<void> _createTeamSubcollections(String matchId, String teamId) async {
    try {
      // Create the batting and bowling subcollections for the team
      await _firestore
          .collection('matches')
          .doc(matchId)
          .collection(teamId)
          .doc('batting')
          .set({});
      await _firestore
          .collection('matches')
          .doc(matchId)
          .collection(teamId)
          .doc('bowling')
          .set({});
    } catch (e) {
      print('Error creating team subcollections: $e');
    }
  }
}
