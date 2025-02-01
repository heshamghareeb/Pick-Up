import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickup/core/helpers/spacing.dart';

import '../../data/models/models.dart';
import '../../data/responses/shipments_response_model.dart';

class SpecialShipmentsWidget extends StatelessWidget {
  final List<ShipmentsDataModel> shipments;

  const SpecialShipmentsWidget({super.key, required this.shipments});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Shipments',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: shipments.length,
            itemBuilder: (context, index) {
              return ShipmentCard(
                id: shipments[index].id,
                code: shipments[index].code,
                company: shipments[index].company,
                status: shipments[index].status,
                receiverId: shipments[index].receiverId,
                receiverName: shipments[index].receiverName,
                receiverPhone: shipments[index].receiverPhone,
                receiverCity: shipments[index].receiverCity,
                receiverArea: shipments[index].receiverArea,
                receiverAddress: shipments[index].receiverAddress,
                codeStatus: shipments[index].codeStatus,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ShipmentCard extends StatelessWidget {
  final int id;
  final String code;
  final String company;
  final String status;
  final int receiverId;
  final String receiverName;
  final String receiverPhone;
  final String receiverCity;
  final String receiverArea;
  final String receiverAddress;
  final int codeStatus;

  const ShipmentCard({
    super.key,
    required this.id,
    required this.code,
    required this.company,
    required this.status,
    required this.receiverId,
    required this.receiverName,
    required this.receiverPhone,
    required this.receiverCity,
    required this.receiverArea,
    required this.receiverAddress,
    required this.codeStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        childrenPadding: EdgeInsets.all(12.w),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.local_shipping, color: Colors.blue),
                horizontalSpace(10.w),
                Text(
                  code,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            verticalSpace(8.h),
            Row(
              children: [
                const Icon(Icons.business, color: Colors.green),
                horizontalSpace(10.w),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            verticalSpace(8.h),
            Row(
              children: [
                const Icon(Icons.info, color: Colors.orange),
                horizontalSpace(10.w),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              const Icon(Icons.person, color: Colors.purple),
              horizontalSpace(8.w),
              Expanded(
                child: Text(
                  receiverName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                'Status: $codeStatus',
                style: TextStyle(fontSize: 14.sp, color: Colors.blue),
              ),
            ],
          ),
        ),
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow(Icons.phone, 'Phone:', receiverPhone),
                _infoRow(Icons.location_city, 'City:', receiverCity),
                _infoRow(Icons.location_on, 'Area:', receiverArea),
                _infoRow(Icons.home, 'Address:', receiverAddress),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey.shade700, size: 20.sp),
          horizontalSpace(8.w),
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          horizontalSpace(4.w),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
