import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:uas_mobile/models/biodata.dart';
import 'package:uas_mobile/screens/add_bio.dart';
import 'package:uas_mobile/screens/components/biodata_card.dart';
import 'package:uas_mobile/services/database_services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Biodata> biodatas = [];
  int selectedIndex = 0;
  bool isLoading = true;

  final ScrollController scrollController = ScrollController();

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

   fetchData() async {
    final List<Biodata> bio = await DatabaseService().biodataList();
    setState(() {
      biodatas = bio;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_array),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_card_sharp),
            label: 'Add',
          ),
        ],
        selectedItemColor: const Color(0xff6777ef),
        currentIndex: selectedIndex,
        onTap: isLoading
            ? null
            : (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
      ),
      body: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
          color: Color(0xff6777ef),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 40.0,
                  right: 25.0,
                  left: 25.0,
                  bottom: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              Image.asset('assets/logo-filled.png').image,
                        ),
                        const Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Hello, ',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              isLoading ? 'Loading...' : 'User',
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4.0,
                          ),
                          child: Text(
                            isLoading ? 'Loading...' : 'user@gmail.com',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: (selectedIndex == 0)
                    ? isLoading
                        ? CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 10.0,
                            percent: 1.0,
                            animation: true,
                            center: const Text('Loading'),
                            progressColor: const Color(0xff6777ef),
                          )
                        : Column(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    'Biodatas Data',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff6777ef),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: GridView.builder(
                                  controller: scrollController,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 25.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent:
                                        MediaQuery.of(context).size.width / 2,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: biodatas.length,
                                  itemBuilder: (context, index) => BiodataCard(
                                    alertContext: _scaffoldkey.currentContext!,
                                    biodata: biodatas[index],
                                    deleteData: () {},
                                  ),
                                ),
                              ),
                            ],
                          )
                    : const AddBioPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
