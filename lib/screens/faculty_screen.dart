import 'package:flutter/material.dart';
import '../widgets/faculty/faculty_header.dart';
import '../widgets/faculty/faculty_list.dart';
import '../widgets/footer.dart';

class FacultyScreen extends StatefulWidget {
  const FacultyScreen({super.key});

  @override
  State<FacultyScreen> createState() => _FacultyScreenState();
}

class _FacultyScreenState extends State<FacultyScreen>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 2;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const FacultyHeader(),
      body: FacultyList(),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
