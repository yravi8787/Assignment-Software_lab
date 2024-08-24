import 'package:flutter/material.dart';

class SignupBusinessHours extends StatefulWidget {
  Map<String, List<String>> selectedTimeSlots;
  VoidCallback handleRegister;
  final VoidCallback previousStep;

  SignupBusinessHours({
    super.key,
    required this.selectedTimeSlots,
    required this.handleRegister,
    required this.previousStep,
  });

  @override
  State<SignupBusinessHours> createState() => _SignupBusinessHoursState();
}

class _SignupBusinessHoursState extends State<SignupBusinessHours> {
  // Map to store selected time slots for each day

  // List to track selected days
  List<bool> _selectedDays = List.generate(7, (_) => false);

  // Days of the week (shortened)
  final List<String> _daysOfWeek = [
    'mon',
    'tue',
    'wed',
    'thu',
    'fri',
    'sat',
    'sun'
  ];

  // Time slots available for selection
  final List<String> _timeSlots = [
    "8:00am - 10:00am",
    "10:00am - 1:00pm",
    "1:00pm - 4:00pm",
    "4:00pm - 7:00pm",
    "7:00pm - 10:00pm",
  ];

  // Function to toggle day selection
  void _toggleDaySelection(int index) {
    setState(() {
      _selectedDays[index] = !_selectedDays[index];
    });
  }

  // Function to toggle time slot selection for a specific day
  void _toggleTimeSlotSelection(String day, String timeSlot) {
    setState(() {
      if (widget.selectedTimeSlots[day]!.contains(timeSlot)) {
        widget.selectedTimeSlots[day]!.remove(timeSlot);
      } else {
        widget.selectedTimeSlots[day]!.add(timeSlot);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup 4 of 4'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business Hours',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              children: _daysOfWeek
                  .map((day) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(day),
                      ))
                  .toList(),
              isSelected: _selectedDays,
              onPressed: _toggleDaySelection,
              borderRadius: BorderRadius.circular(8),
              selectedColor: Colors.white,
              fillColor: Colors.orangeAccent,
              color: Colors.black54,
            ),
            const SizedBox(height: 20),
            // Time Slots Section
            Expanded(
              child: ListView.builder(
                itemCount: _daysOfWeek.length,
                itemBuilder: (context, index) {
                  String dayShort = _daysOfWeek[index].toLowerCase();
                  return _selectedDays[index]
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "Select time slots for ${_daysOfWeek[index]}:",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Wrap(
                              spacing: 10.0,
                              children: _timeSlots.map((timeSlot) {
                                bool isSelected = widget
                                    .selectedTimeSlots[dayShort]!
                                    .contains(timeSlot);
                                return ChoiceChip(
                                  label: Text(timeSlot),
                                  selected: isSelected,
                                  onSelected: (_) {
                                    _toggleTimeSlotSelection(
                                        dayShort, timeSlot);
                                  },
                                  selectedColor: Colors.orangeAccent,
                                  backgroundColor: Colors.grey.shade200,
                                );
                              }).toList(),
                            ),
                          ],
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
            const SizedBox(height: 20),
            // Signup Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  widget.handleRegister();
                },
                child: const Text(
                  'Signup',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                widget.previousStep();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
