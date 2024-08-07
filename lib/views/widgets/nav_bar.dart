import 'package:flutter/material.dart';

class ModernBottomNavBar extends StatefulWidget {
  final List<BottomNavItem> items;
  final ValueChanged<int> onItemSelected;

  const ModernBottomNavBar({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  @override
  _ModernBottomNavBarState createState() => _ModernBottomNavBarState();
}

class _ModernBottomNavBarState extends State<ModernBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _selectedIndex = 0;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _colorTween = ColorTween(
      begin: Colors.grey,
      end: Colors.grey,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _colorTween = ColorTween(
          begin: widget.items[_selectedIndex].color,
          end: widget.items[index].color,
        ).animate(_animationController);
        _selectedIndex = index;
      });
      widget.onItemSelected(index);
      _animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          return GestureDetector(
            onTap: () => _onItemTapped(index),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                double scale = _selectedIndex == index
                    ? 1.0 + (0.1 * _animationController.value)
                    : 1.0;
                double opacity = _selectedIndex == index
                    ? 1.0
                    : 0.6 + (0.4 * _animationController.value);

                return Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? widget.items[index].color.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            widget.items[index].icon,
                            color: _colorTween.value,
                          ),
                          const SizedBox(height: 4),
                          if (_selectedIndex == index)
                            SizeTransition(
                              sizeFactor: _animationController,
                              axis: Axis.horizontal,
                              child: Text(
                                widget.items[index].label,
                                style: TextStyle(
                                  color: widget.items[index].color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final String label;
  final Color color;

  BottomNavItem({
    required this.icon,
    required this.label,
    required this.color,
  });
}
