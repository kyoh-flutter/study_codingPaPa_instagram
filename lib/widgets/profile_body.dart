import 'package:flutter/material.dart';
import 'package:temp/constans/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:temp/widgets/rounded_avatar.dart';

enum SelectedTab { left, right }

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key, required this.onMenuChanged}) : super(key: key);

  final Function() onMenuChanged;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagePageMargin = 0;
  double _rightImagePageMargin = size!.width;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(14.0),
                            child: RoundedAvatar(
                              size: 80,
                            ),
                          ),
                          Expanded(
                            child: Table(
                              children: [
                                TableRow(
                                  children: [
                                    _valueText('123123'),
                                    _valueText('123123'),
                                    _valueText('123123'),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    _labelText('post'),
                                    _labelText('Followers'),
                                    _labelText('Following'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      _username(),
                      _userBio(),
                      _editProfileBtn(),
                      _tabButtons(),
                      _selectedIndicator(),
                    ],
                  ),
                ),
                _imagesPager()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _appBar() {
    return Row(
      children: [
        const SizedBox(
          width: 44,
        ),
        const Expanded(
          child: Text(
            'Kyoh',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          onPressed: () {
            widget.onMenuChanged();
          },
          icon: const Icon(Icons.menu),
        )
      ],
    );
  }

  Text _valueText(String value) {
    return Text(
      value,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text _labelText(String value) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
        child: Stack(
      children: [
        AnimatedContainer(
          transform: Matrix4.translationValues(_leftImagePageMargin, 0, 0),
          curve: Curves.easeInOutQuad,
          duration: const Duration(milliseconds: 300),
          child: _images(),
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(_rightImagePageMargin, 0, 0),
          curve: Curves.easeInOutQuad,
          duration: const Duration(milliseconds: 300),
          child: _images(),
        ),
      ],
    ));
  }

  GridView _images() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
          30,
          (index) => CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: 'https://picsum.photos/id/$index/100/100',
              )),
    );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        height: 3,
        width: (size!.width / 2),
        color: Colors.black87,
      ),
      curve: Curves.easeInOutCirc,
    );
  }

  Row _tabButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: IconButton(
              onPressed: () {
                _tapSelected(SelectedTab.left);
              },
              icon: ImageIcon(
                const AssetImage('assets/images/grid.png'),
                color: _selectedTab == SelectedTab.left
                    ? Colors.black
                    : Colors.black26,
              )),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {
                _tapSelected(SelectedTab.right);
              },
              icon: ImageIcon(
                const AssetImage('assets/images/saved.png'),
                color: _selectedTab == SelectedTab.left
                    ? Colors.black26
                    : Colors.black,
              )),
        ),
      ],
    );
  }

  _tapSelected(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.left:
          setState(() {
            _selectedTab = SelectedTab.left;
            _leftImagePageMargin = 0;
            _rightImagePageMargin = size!.width;
          });
          break;
        case SelectedTab.right:
          setState(() {
            _selectedTab = SelectedTab.right;
            _leftImagePageMargin = -size!.width;
            _rightImagePageMargin = 0;
          });
          break;
      }
    });
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 15.0),
      child: SizedBox(
        height: 24,
        child: OutlinedButton(
          onPressed: () {},
          child: const Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text('username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget _userBio() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text('this is what I believe!!',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
