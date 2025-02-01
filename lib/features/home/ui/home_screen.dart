import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickup/features/auth/logic/cubit/login_state.dart';
import 'package:pickup/features/home/logic/home_cubit.dart';
import '../../../core/helpers/spacing.dart';
import '../logic/home_state.dart';
import 'widgets/shipments_container.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ShipmentsError) {
              return Center(child: Text(state.errorHandler.apiErrorModel.message ?? ''));
            } else if (state is ShipmentsSuccess) {
              final shipments = context.watch<HomeCubit>().filteredShipments;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeTopBar(),
                    shipments.isNotEmpty
                        ? SpecialShipmentsWidget(shipments: shipments)
                        : Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "لا توجد شحنات بهذا الرقم.",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ),
                    verticalSpace(24),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )
        ,
      ),
    );
  }
}
