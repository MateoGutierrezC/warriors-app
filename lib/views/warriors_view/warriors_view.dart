import "dart:convert";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:warrior_app/utils/Global.colors.dart";

class WarriorsView extends StatefulWidget {
  const WarriorsView({super.key});

  @override
  WarriorsViewState createState() => WarriorsViewState();
}

class WarriorsViewState extends State<WarriorsView> {
  List<String> myRoles = [];
  List<dynamic> myRolData = [];
  bool isLoading = true;
  String selectedRoles = "Todo";

  @override
  void initState() {
    super.initState();
    fetchRoles();
    fetchRolData("Todo");
  }

  // Para obtener los tipos de guerreros/campeones

  Future<void> fetchRoles() async {
    Uri url = Uri.parse("http://localhost:80/api/warriors");

    try {
      final response = await http.get(url);
      final List<dynamic> data = json.decode(response.body)["warriors"];
      final List<String> fetchdeRoles = ["Todo"];
      for (var rol in data) {
        final String roleType = rol["position"][0]["type"];

        if (!fetchdeRoles.contains(roleType)) {
          fetchdeRoles.add(roleType);
        }
      }
      setState(() {
        myRoles = fetchdeRoles;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  //Para obtener los datos segun el rol

  void fetchRolData(String role) async {
    Uri url = Uri.parse("http://localhost:80/api/warriors");

    try {
      final response = await http.get(url);
      final List<dynamic> data = json.decode(response.body)["warriors"];
      final List<dynamic> rolData = [];
      for (var warrior in data) {
        final String roleType = warrior["position"][0]["type"];
        if (role == "Todo" || roleType == role) {
          rolData.add(warrior);
        }
      }
      setState(() {
        myRolData = rolData;
        selectedRoles = role;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Guerreros / Campeones",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      itemCount: myRoles.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final rol = myRoles[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            //
                            onTap: () {
                              fetchRolData(rol);
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: rol == selectedRoles
                                    ? Colors.amber
                                    : GlobalColors.grey,
                              ),
                              child: Center(
                                child: Text(
                                  rol,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount =
                          (constraints.maxWidth ~/ 200).clamp(1, 3);
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: myRolData.length,
                        itemBuilder: (context, index) {
                          final data = myRolData[index];
                          return Card(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(data["splash_art"]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(data["champion"]),
                                  subtitle: Text(data["origen"]),
                                  trailing: Text(data["position"][0]["type"]),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
