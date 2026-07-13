import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store/core/network/api_client.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/locations/presentation/cubit/address_cubit.dart';
import 'package:men_store/features/locations/presentation/cubit/address_state.dart';
import '../widgets/address_card.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressCubit(ApiService())..getLocations(),
      child: const _AddressView(),
    );
  }
}

class _AddressView extends StatelessWidget {
  const _AddressView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              _buildHeader(context),
              SizedBox(height: 8.h),

              SizedBox(height: 16.h),
              Text(
                'Saved Address',
                style: AppTextStyles.font16Bold.copyWith(
                  color: LightAppColors.neutral900,
                ),
              ),
              SizedBox(height: 12.h),
              Expanded(child: _buildList(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).maybePop(),
          child: Icon(
            Icons.arrow_back,
            size: 22.sp,
            color: LightAppColors.neutral900,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'Address',
              style: AppTextStyles.font20Bold.copyWith(
                color: LightAppColors.neutral900,
              ),
            ),
          ),
        ),
        SizedBox(width: 22.sp),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoading || state is AddressInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AddressError) {
          return Center(
            child: Text(
              state.message,
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.error500,
              ),
            ),
          );
        }
        final loadedState = state as AddressLoaded;
        if (loadedState.locations.isEmpty) {
          return Center(
            child: Text(
              'لا يوجد عناوين محفوظة',
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.grey700,
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: loadedState.locations.length,
          itemBuilder: (context, index) {
            final location = loadedState.locations[index];
            return AddressCard(
              title: location.name,
              subtitle: location.description,
              isDefault: index == 0,
              isSelected: loadedState.selectedId == location.id,
              onTap: () =>
                  context.read<AddressCubit>().selectAddress(location.id),
            );
          },
        );
      },
    );
  }
}
