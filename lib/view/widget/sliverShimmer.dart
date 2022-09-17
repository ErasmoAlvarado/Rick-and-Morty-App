import 'package:flutter/material.dart';

class SliverShimmer extends StatelessWidget {
  const SliverShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[350],
                        ),
                        title: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[350],
                          ),
                        ),
                        subtitle: Container(
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[350],
                          ),
                        ),
                        
                      );
                      
                    },
                  ));
  }
}