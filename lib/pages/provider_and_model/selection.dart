import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:seat_finder/pages/provider_and_model/seat.dart';

class SelectionButtonProvider with ChangeNotifier {
  List<Seat> _selectedSeats = [];

  List<Seat> get selectedSeats => _selectedSeats;

  void addSeat(Seat seat) {
    _selectedSeats.add(seat);
    log("${seat.seatIndex} added");
    notifyListeners();
  }

  void removeSeat(Seat seat) {
    _selectedSeats.remove(seat);
    log("${seat.seatIndex} removed");
    notifyListeners();
  }

  bool isSeatSelected(Seat seat) {
    return _selectedSeats.contains(seat);
  }
}
