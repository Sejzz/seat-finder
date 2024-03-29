import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seat_finder/pages/provider_and_model/selection.dart';


class ConfirmSelectionPage extends StatefulWidget {
  const ConfirmSelectionPage({super.key});

  @override
  State<ConfirmSelectionPage> createState() => _ConfirmSelectionPageState();
}

class _ConfirmSelectionPageState extends State<ConfirmSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Confirm Selection"),
        backgroundColor: Color.fromARGB(255, 176, 146, 233),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<SelectionButtonProvider>(
          builder: (context, provider, child) {
            return (provider.selectedSeats.isEmpty)
                ? const Center(child: Text("No Tickets Selected"))
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Selected Seats",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Total: ${provider.selectedSeats.length}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: provider.selectedSeats.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Seat No.: ${provider.selectedSeats[index].seatIndex}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Type: ${provider.selectedSeats[index].seatType}",
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
