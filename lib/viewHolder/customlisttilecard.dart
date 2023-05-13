import 'package:flutter/material.dart';

import '../Utils/Colors.dart';

class CustomListTilecard extends StatefulWidget {
  final String? leadId;
 final String? customerName;
 final String?managedBy;
 final String? customerType;
  final String?date;
  const CustomListTilecard({Key? key, this.leadId, this.customerName, this.managedBy, this.customerType, this.date}) : super(key: key);
  @override
  State<CustomListTilecard> createState() => _CustomListTilecardState();
}

class _CustomListTilecardState extends State<CustomListTilecard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.3),
        ),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lead ID :${widget.leadId}",
                      style:
                          const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: Appcolors.ActiveButton.withOpacity(0.5),
                              border: Border.all(width: 1, color: Colors.green),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                            ),
                            child: const Text(
                              "*  Active",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                        const ImageIcon(AssetImage('assets/images/dots.png'))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black.withOpacity(0.3),
            indent: 0,
            endIndent: 0,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 0, top: 5, bottom: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 150 ,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Lead Name :",
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    color: Colors.grey.shade700),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text("${widget.customerName}",
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    color: Colors.grey.shade700))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                "LeadType :",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    color: Colors.grey.shade700),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),  
                            Flexible(
                              child: Text(widget.customerType.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 0.2,
                                      color: Colors.grey.shade700)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                VerticalDivider(
                  indent: 0,
                  color: Colors.black.withOpacity(0.3),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0.0,
                   right: 15.0, top: 5, bottom: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 160 ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                "Address:",
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    color: Colors.grey.shade700),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("${widget.managedBy}",
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    color: Colors.grey.shade700))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                "Date:",
                                style: TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    color: Colors.grey.shade700),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(widget.date.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
