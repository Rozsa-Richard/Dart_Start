import 'package:flutter/material.dart';

void main() {
  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatefulWidget {
  const TicTacToeApp({super.key});

  @override
  State<TicTacToeApp> createState() => _TicTacToeAppState();
}

class _TicTacToeAppState extends State<TicTacToeApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: GameScreen(
        isDarkMode: _isDarkMode,
        onThemeToggle: () => setState(() => _isDarkMode = !_isDarkMode),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const GameScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> board = List.filled(9, '');
  bool isXTurn = true;
  String? winner;
  List<int> winningLine = [];
  int scoreX = 0;
  int scoreO = 0;

  static const List<List<int>> _winPatterns = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
    [0, 4, 8], [2, 4, 6],           // diagonals
  ];

  void _makeMove(int index) {
    if (board[index] != '' || winner != null) return;

    setState(() {
      board[index] = isXTurn ? 'X' : 'O';
      isXTurn = !isXTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    for (var pattern in _winPatterns) {
      final a = board[pattern[0]];
      final b = board[pattern[1]];
      final c = board[pattern[2]];

      if (a != '' && a == b && b == c) {
        setState(() {
          winner = a;
          winningLine = List.from(pattern);
          if (a == 'X') scoreX++;
          if (a == 'O') scoreO++;
        });
        return;
      }
    }

    // Draw
    if (!board.contains('') && winner == null) {
      setState(() {
        winner = 'draw';
      });
    }
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      isXTurn = true;
      winner = null;
      winningLine = [];
    });
  }

  Color _getHighlightColor() {
    return widget.isDarkMode ? Colors.amber.shade800 : Colors.amber.shade300;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = widget.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            onPressed: widget.onThemeToggle,
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Scoreboard
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Player X',
                                style: TextStyle(color: Colors.blue, fontSize: 18)),
                            Text('$scoreX',
                                style: const TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Player O',
                                style: TextStyle(color: Colors.red, fontSize: 18)),
                            Text('$scoreO',
                                style: const TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Status
                Text(
                  winner == null
                      ? 'Turn: ${isXTurn ? "X" : "O"}'
                      : winner == 'draw'
                          ? "It's a Draw!"
                          : 'Winner: $winner!',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: winner == null
                        ? null
                        : winner == 'X'
                            ? Colors.blue
                            : winner == 'O'
                                ? Colors.red
                                : null,
                  ),
                ),

                const SizedBox(height: 32),

                // Game board
                SizedBox(
                  width: 360,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        final value = board[index];
                        final isWinning = winningLine.contains(index);

                        return GestureDetector(
                          onTap: () => _makeMove(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            decoration: BoxDecoration(
                              color: isWinning ? _getHighlightColor() : null,
                              borderRadius: BorderRadius.circular(16),
                              border: isWinning
                                  ? Border.all(
                                      color: isDark ? Colors.amber : Colors.orange,
                                      width: 4,
                                    )
                                  : Border.all(
                                      color: theme.dividerColor,
                                      width: 1.5,
                                    ),
                              boxShadow: isWinning
                                  ? [
                                      BoxShadow(
                                        color: (isDark ? Colors.amber : Colors.orange)
                                            .withOpacity(0.5),
                                        blurRadius: 12,
                                        spreadRadius: 2,
                                      )
                                    ]
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 68,
                                  fontWeight: FontWeight.bold,
                                  color: value == 'X'
                                      ? Colors.blue
                                      : value == 'O'
                                          ? Colors.red
                                          : null,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // New Game button
                FilledButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('New Game', style: TextStyle(fontSize: 18)),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                  ),
                  onPressed: _resetGame,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}