import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmort_app/business_logic/cubit/details_state.dart';
import 'package:rickandmort_app/business_logic/cubit/detials_cubit.dart';
import 'package:rickandmort_app/constans/colors.dart';
import 'package:rickandmort_app/presentation/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<dynamic> characters = [];
  late List searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Search ',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }
  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = characters
        .where((character) =>
        character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }
  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: MyColors.myGrey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }
  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterSuccessState) {
          characters = (state).character;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty? characters.length:searchedForCharacters.length,
      itemBuilder: (ctx, index) {
        return CharacterItem(
          characters:_searchTextController.text.isEmpty? characters[index]:searchedForCharacters[index],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }
  Widget _buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching?_buildSearchField():_buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: _isSearching
            ? BackButton(
          color: MyColors.myGrey,
        )
            : Container(),
      ),
      body: Container(child: buildBlocWidget()),
    );
  }
}
