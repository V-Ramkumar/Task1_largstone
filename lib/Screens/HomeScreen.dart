import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/Database/DbHelper.dart';
import 'package:task1/Utils/colors.dart';

import '../Database/DatabaseModel/MarketModel.dart';
import '../Utils/Strings.dart';
import '../viewHolder/customlisttilecard.dart';
import 'createleadscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper helper=DatabaseHelper.instance;

  String searchString = "";
  // List<MarketModel>_list=[];
  // void getalllist()async{
  //   await helper.queryAllUsers().then((value) => {
  //     _list=value.toList(),
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0,60),
        child: AppBar(
          backgroundColor: Appcolors.primaryColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Appcolors.primaryColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          title: const Row(
            children: [
              Icon(
                Icons.menu,
                color: Appcolors.cardColor,
              ),
              SizedBox(width: 10,),
              Text(
                Strings.homeAppbarname,
              ),
              Spacer(flex: 1),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Appcolors.buttoncolor,onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Createlead()));
      },
      child: const Icon(Icons.add,size: 30,)),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
        mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true, //<-- SEE HERE
                  fillColor:Appcolors.cardColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Appcolors.cardColor, width: 2.0),
                  ),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ImageIcon(AssetImage('assets/images/setting.png'),size: 10,color: Colors.black,),
                  )
                ),
                onChanged: (value) {
                  setState(() {
                    searchString = value.toLowerCase();
                  });
                },
              ),
            ),
            Expanded(child:SingleChildScrollView(
              child: FutureBuilder(
                future: helper.queryAllUsers(), builder: (BuildContext context, AsyncSnapshot<List<MarketModel>> snapshot) {
                  if(snapshot.hasData){
                    if(snapshot.data!.isNotEmpty){
                      return ListView.separated(reverse: true,shrinkWrap: true,physics: const ScrollPhysics(),itemBuilder: (BuildContext context,index){
                        return snapshot.data![index].leadId!.toLowerCase().contains(searchString)?Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomListTilecard(
                                    leadId: snapshot.data![index].leadId,
                                    customerName: snapshot.data![index].customerName,
                                    customerType: snapshot.data![index].customerType,
                                    managedBy: snapshot.data![index].managedBy,
                                    date: snapshot.data![index].date,
                                  ),
                        ):Container();
                      }, separatorBuilder: (BuildContext context, int index) {
                        return snapshot.data![index].leadId!
                            .toLowerCase()
                            .contains(searchString)
                            ? Container()
                            : Container();
                      }, itemCount: snapshot.data!.length);
                      // return ListView.builder(shrinkWrap: true,physics: ScrollPhysics(),itemCount:snapshot.data!.length,itemBuilder: (context,index){
                      //   return Padding(
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: CustomListTilecard(
                      //       leadId: snapshot.data![index].leadId,
                      //       customerName: snapshot.data![index].customerName,
                      //       customerType: snapshot.data![index].customerType,
                      //       managedBy: snapshot.data![index].managedBy,
                      //       date: snapshot.data![index].date,
                      //     ),
                      //   );
                      //
                      // });
                    }else{
                      return Center(child: Container(child: const Text("No data",style: TextStyle(color: Colors.black),),));
                    }
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }


              },
              ),

            ), )
          ],
        ),
      ),
    );
  }
}
