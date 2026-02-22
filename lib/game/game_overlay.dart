import 'package:flutter/material.dart';




//JUST ADDING FANCY OVERLAY DESIGN
import 'package:flutter/material.dart';

class StartOverlay extends StatelessWidget {
  final VoidCallback onStart;

  const StartOverlay({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Slight dim background
        Container(
          color: Colors.black.withOpacity(0.4),
        ),

        Center(
          child: GestureDetector(
            onTap: onStart,
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: const Color(0xFF111122),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFF00F5FF),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00F5FF).withOpacity(0.6),
                    blurRadius: 25,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "RUNNER",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00F5FF),
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "TAP TO START",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class GameOverOverlay extends StatelessWidget {
  final VoidCallback onRestart;

  const GameOverOverlay({super.key, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Dim background slightly (not full white)
        Container(
          color: Colors.black.withOpacity(0.4),
        ),

        // Center Card
        Center(
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF111122),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF00F5FF),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00F5FF).withOpacity(0.6),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "GAME OVER",
                  style: TextStyle(
                    color: Color(0xFF00F5FF),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: onRestart,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    child: const Text(
                      "RESTART",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
