
class InProgressTaskCard extends StatefulWidget {
  VoidCallback onTap;
  InProgressTaskCard({super.key, required this.onTap});

  @override
  _InProgressTaskCardState createState() => _InProgressTaskCardState();
}

class _InProgressTaskCardState extends State<InProgressTaskCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimationInProgress = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Duration of the animation
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  void _restartAnimation() {
    widget.onTap();
    setState(() {
      _isAnimationInProgress = true;
    });
    _controller.reset(); // Reset the animation
    _controller.forward().then((_) {
      setState(() {
        _isAnimationInProgress = false;
      });
    }); // Start the animation again
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _isAnimationInProgress ? null : _restartAnimation,
        child: AbsorbPointer(
          absorbing: _isAnimationInProgress,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width / 2.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      value: _animation.value,
                      backgroundColor: Themecolor.flushbar,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Themecolor.primary,
                      ),

                      borderRadius: BorderRadius.circular(8),
                      minHeight: 65, // Set the height of the progress indicator
                    );
                  },
                ),
                Text("Get More Offers", style: Themetext.ctextstyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
