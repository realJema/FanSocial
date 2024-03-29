import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:untitled/Screens/SignlePage.dart';

class ItemsList extends StatefulWidget {
   ItemsList({Key? key}) : super(key: key);
// ValueChanged<bool> isInputTapped;
  @override
  State<ItemsList> createState() => _ItemsListState();
}

 bool _isSearchSelected= false;

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    final double deviceheight=MediaQuery.of(context).size.height;
     final double devicewidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
          
              body: SizedBox(
                height: deviceheight,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                         Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    child: Row(
                  
                      children:const [
                        Text("Browse",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 27),),
                     
                      ],
                    ),
                  ),
                ),
                    Row(
                      children: [
                        Card(
                          color: Colors.black,
                          child: Container(
                            width: !_isSearchSelected?devicewidth-(devicewidth/6):devicewidth/2+50,
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                  color:Color.fromARGB(255, 104, 103, 103).withOpacity(0.4) 
                
                  ),
                            child: TextFormField(
                              onTap: (){
                                           setState(() {
                              _isSearchSelected=!_isSearchSelected;
                          });
                              },
                        decoration: InputDecoration(
                        
                        hintText: "Try 'Ne-Yo'",
                        prefixIcon: IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){},),
                        border: InputBorder.none,
                        
                        ),),
                          ),
                        ),
                      if(_isSearchSelected)
                        InkWell(
                          onTap: (){
                            setState(() {
                              // widget.isInputTapped(true);
                              // _isSearchSelected=!_isSearchSelected;
                            });
                          },
                          child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                 Container(
                  height: deviceheight-(deviceheight/3-13),
                   child: ListView(
                    shrinkWrap: true,
                    children: [

                       cardListItemsTitle("Featured", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/business.webp"),

                    cardListItemsTitle("New& Noteworthy", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/ator5.jpg"),

                    cardListItemsTitle("For Business", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/p3.jpg"),


                    cardListItemsTitle("Comedian", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/comedy3.jpg"),

                      // TRENDING IMAGES HERE

                    cardListItemsTitle("Comedian", ""),
                   horizontalSCrollingOfItems("Assets/Images/actor1.jpg"),

                    cardListItemsTitle("Actores", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/actor2.jpg"),

                   cardListItemsTitle("Comedians", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                   cardListItemsTitle("Animals", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/comedy.jpg"),

                   cardListItemsTitle("Back for more", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/comedy1.jpg"),

                   cardListItemsTitle("Athletes", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/athletes.jpg"),

                   cardListItemsTitle("Musicians", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/actor2.jpg"),


                   cardListItemsTitle("Queer voices", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/actor1.jpg"),

                   cardListItemsTitle("Reality TV", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/p3.jpg"),

                   cardListItemsTitle("Creator", "see all"),
                   horizontalSCrollingOfItems("Assets/Images/business2.jpg"),
                    ],
                   ),
                 )
                 
                  ],
                ),
              ),
      ),
    );
  }

  navigationFunction(BuildContext context, Widget PageName) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => PageName));
  }

 Widget cardListItemsTitle( String type,String seeall){
    return Padding(
      padding: const EdgeInsets.only(top:18.0,left: 18,right: 18,bottom: 22.0),
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(type,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          Text(seeall,style:const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold))
        ],),
      ),
    );
  }
  Widget cardListItems(String name,occupation, int amount, String img){ 
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(img, width:230,height: 240,fit: BoxFit.fill,)),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(name,style: TextStyle(color: Colors.white),),
          ),
          Text(occupation,style: const TextStyle(color:Color.fromARGB(255, 104, 103, 103)),),
          Row(
            children: [
              Text("${amount.toString()} XAF",style:const TextStyle(color: Colors.white),),
                SizedBox(width: 80,),
              Icon(Icons.bolt,color:Colors.yellow),
              Text("24hr",style:const TextStyle(color: Colors.white))
            ],
          )
        ],),
      ),
    );
  }



 Widget horizontalSCrollingOfItems(String img){
    return SizedBox(
      height:335,
      // width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
          onTap:(){
            Get.to(SpecificPerson(personsImages: img,));
          },
          child: cardListItems("Jean Marie","Programmer",1200, img))),
    );
  }
  
 Widget VerticalScrollingItemList(deviceheight) {
    return  Container(
      height: deviceheight,
      child:Column(
        children: [
          
          horizontalSCrollingOfItems("Assets/Images/p3.jpg"),
        ],
      )
    );

  }
}