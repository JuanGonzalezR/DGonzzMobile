part of '../../util/views_import.dart';

//*********************************************************************************************************************/

class HeaderMenuFirebase extends StatelessWidget {
  const HeaderMenuFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: Container(
                width: double.infinity,
                height: rsp.hp(37),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 222, 100)),
                child: Center(
                  child: Image.asset(
                      width: rsp.dp(30),
                      height: rsp.dp(30),
                      'asset/image/firebase.png',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: SizedBox(width: double.infinity, height: rsp.hp(38)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: rsp.wp(35), right: rsp.wp(35), top: rsp.wp(25)),
            width: rsp.wp(30),
            height: rsp.wp(30),
            child: Card(
              elevation: 5,
              shape: const StadiumBorder(
                side: BorderSide(
                  color: Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: Image.asset('asset/image/firebase.png', fit: BoxFit.fill),
            ),
          ),
          Positioned.fill(
            top: rsp.hp(32),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
            ),
          ),
          const IconBackMenu(),
          const SearchContainer(),
          const ListViewData()
        ],
      ),
    );
  }
}

//*********************************************************************************************************************/

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: rsp.wp(2)),
      child: Container(
        height: rsp.hp(7),
        color: Colors.transparent,
        margin: EdgeInsets.only(
            left: rsp.wp(8), right: rsp.wp(8), top: rsp.hp(35)),
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: const StadiumBorder(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: rsp.wp(5)),
            child: Row(
              children: const [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Search ...',
                        labelStyle: TextStyle(color: Colors.black38),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintStyle: TextStyle(color: Colors.white38),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.search_sharp)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//*********************************************************************************************************************/

class ExpandableCardContainer extends StatelessWidget {
  const ExpandableCardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin:
          EdgeInsets.only(top: rsp.hp(33), left: rsp.wp(10), right: rsp.wp(10)),
      //width: rsp.wp(50),
      height: rsp.hp(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.white),
      child: Column(
        children: const [
          Text('Firebase',
              style: TextStyle(
                  color: Color.fromARGB(113, 0, 0, 0),
                  fontSize: 25,
                  fontFamily: 'rimouski')),
          SizedBox(height: 4),
          Text('This screen allows you to perform a CRUD in firebase.',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontFamily: 'Comfortaa-Light')),
        ],
      ),
    );
  }
}

//*********************************************************************************************************************/

class ListViewData extends StatelessWidget {
  const ListViewData({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    final List<String> items = List<String>.generate(20, (i) => '$i');
    return Container(
        margin:
            EdgeInsets.only(left: rsp.wp(4), right: rsp.wp(4), top: rsp.hp(44)),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 0, bottom: 5),
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, i) {
              return Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 211, 211, 211),
                    child: Text(
                      items[i],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text('Item ${items[i]}'),
                  subtitle: const Text('Item description'),
                  trailing: const Icon(Icons.cleaning_services),
                  onTap: () {},
                ),
              );
            },
          ),
        ));
  }
}

//*********************************************************************************************************************/

class BottonCreateNewRegister extends StatelessWidget {
  const BottonCreateNewRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final rsp = Responsive(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 85, 130, 228),
            maxRadius: 30,
            child: IconButton(
                onPressed: () {
                  bottonSheetNewRegister(context, rsp);
                },
                icon: const Icon(
                  Icons.add_circle_sharp,
                  color: Colors.white,
                  size: 30,
                )),
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottonSheetNewRegister(BuildContext context, Responsive rsp) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: EdgeInsets.all(rsp.dp(3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'New Register',
                            style: TextStyle(
                                fontFamily: 'Comfortaa-Bold',
                                fontSize: 30,
                                color: Colors.black54),
                          ),
                        ),
                        const SizedBox(height: 40),
                        DesignTextField(
                            "example",
                            'Dato 1',
                            Icons.dark_mode_sharp,
                            Colors.white,
                            const Color.fromARGB(255, 211, 211, 211),
                            Colors.white,
                            (v) {},
                            () {},
                            TextInputType.emailAddress,
                            'Comfortaa-Light',
                            false),
                        SizedBox(height: rsp.dp(4)),
                        DesignTextField(
                            "example",
                            'Dato 2',
                            Icons.dark_mode_sharp,
                            Colors.white,
                            const Color.fromARGB(255, 211, 211, 211),
                            Colors.white,
                            (v) {},
                            () {},
                            TextInputType.emailAddress,
                            'Comfortaa-Light',
                            false),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      fontSize: 30, fontFamily: 'chubby'),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ));
  }
}

//*********************************************************************************************************************/

class ExpansionCard extends StatefulWidget {
  const ExpansionCard({
    Key? key,
    this.leading,
    required this.title,
    this.gif,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.color,
    this.expansionArrowColor,
    this.topMargin = 0,
  }) : super(key: key);

  final String? gif;
  final Widget? leading;
  final Widget title;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Color? backgroundColor;
  final Widget? trailing;
  final bool initiallyExpanded;
  final Color? color;
  final Color? expansionArrowColor;
  final double topMargin;

  @override
  ExpansionTileState createState() => ExpansionTileState();
}

class ExpansionTileState extends State<ExpansionCard>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded =
        PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {});
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null)
      // ignore: curly_braces_in_flow_control_structures
      widget.onExpansionChanged!(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    const Color borderSideColor = Colors.transparent; // _borderColor.value ??

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: _backgroundColor.value ?? Colors.transparent,
            border: const Border(
              top: BorderSide(color: borderSideColor),
              bottom: BorderSide(color: borderSideColor),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTileTheme.merge(
                  iconColor: _iconColor.value,
                  textColor: _headerColor.value,
                  child: Container(
                    margin: EdgeInsets.only(top: widget.topMargin),
                    child: ListTile(
                      onTap: _handleTap,
                      leading: widget.leading,
                      title: widget.title,
                    ),
                  )),
              ClipRect(
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = Colors.white
      ..end = widget.color ?? const Color(0xff60c9df);
    _iconColorTween
      ..begin = Colors.white
      ..end = widget.color ?? const Color(0xff60c9df);
    _backgroundColorTween.end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}
