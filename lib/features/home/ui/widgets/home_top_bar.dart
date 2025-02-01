import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickup/features/home/logic/home_cubit.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class HomeTopBar extends StatefulWidget {
  const HomeTopBar({super.key});

  @override
  State<HomeTopBar> createState() => _HomeTopBarState();
}

class _HomeTopBarState extends State<HomeTopBar> {
  final TextEditingController searchController = TextEditingController();

  String username = '';


  Future<void> getUsername() async {
    String fetchedUsername = await SharedPrefHelper.getSecuredString("username");
    setState(() {
      username = fetchedUsername;
    });
  }

  @override
  void initState() {
    getUsername();
    print(username);
    print("username");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: ColorsManager.mainBlue,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(35),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Pick-up APP', style: TextStyles.font16WhiteSemiBold),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined, color: ColorsManager.white),
                ),
              ],
            ),
            verticalSpace(10),
            Text('Hi, $username', style: TextStyles.font16WhiteMedium),
            verticalSpace(20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                onChanged: (query) {
                  setState(() {});
                  context.read<HomeCubit>().searchShipments(query);
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search by ID...',
                  hintStyle: TextStyles.font14GrayRegular,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: ColorsManager.gray),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


