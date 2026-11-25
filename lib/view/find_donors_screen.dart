import 'package:bloodlink/constants/app_colors.dart';
import 'package:bloodlink/controllers/find_donors_controller.dart';
import 'package:bloodlink/controllers/navigation_controller.dart';
import 'package:bloodlink/core/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindDonorsScreen extends StatelessWidget {
  FindDonorsScreen({super.key});
  final FindDonorsController controller = Get.put(FindDonorsController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.w(context, 22),
          vertical: Responsive.h(context, 14),
        ),
        child: Column(
          children: [
            //  HEADER
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.find<NavigationController>().changeTab(0);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                SizedBox(width: Responsive.w(context, 48)),
                Expanded(
                  child: Text(
                    'Find Blood Donors',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: Responsive.sp(context, 22),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: Responsive.h(context, 22)),

            // SEARCH BAR
            TextField(
              controller: controller.searchController,

              onChanged: (value) {
                controller.searchText.value = value;
              },

              style: theme.textTheme.bodyMedium,

              decoration: InputDecoration(
                hintText: 'Search by blood group, area or name',
                hintStyle: theme.textTheme.bodySmall,

                prefixIcon: Icon(
                  Icons.search,
                  color: theme.colorScheme.onSurface,
                  size: Responsive.sp(context, 22),
                ),

                filled: true,
                fillColor: theme.colorScheme.surface,

                contentPadding: EdgeInsets.symmetric(
                  vertical: Responsive.h(context, 13),
                  horizontal: Responsive.w(context, 12),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Responsive.w(context, 10),
                  ),
                  borderSide: BorderSide(color: theme.dividerColor),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Responsive.w(context, 10),
                  ),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            SizedBox(height: Responsive.h(context, 16)),

            // 3. FILTER BUTTONS
            Obx(() {
              return Row(
                children: [
                  // Blood Group
                  Expanded(
                    child: PopupMenuButton(
                      onSelected: (value) {
                        controller.selectedBloodGroup.value = value;
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(value: 'All', child: Text('All Groups')),
                        PopupMenuItem(value: 'A+', child: Text('A+')),
                        PopupMenuItem(value: 'A-', child: Text('A-')),
                        PopupMenuItem(value: 'B+', child: Text('B+')),
                        PopupMenuItem(value: 'B-', child: Text('B-')),
                        PopupMenuItem(value: 'AB+', child: Text('AB+')),
                        PopupMenuItem(value: 'AB-', child: Text('AB-')),
                        PopupMenuItem(value: 'O+', child: Text('O+')),
                        PopupMenuItem(value: 'O-', child: Text('O-')),
                      ],
                      child: filterButton(
                        context,
                        controller.selectedBloodGroup.value == "All"
                            ? "Blood Group"
                            : controller.selectedBloodGroup.value,
                        controller.selectedBloodGroup.value != 'All',
                      ),
                    ),
                  ),

                  SizedBox(width: Responsive.w(context, 7)),
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.toggleDistance,
                      child: filterButton(
                        context,
                        controller.nearbyOnly.value
                            ? 'Within 3 km'
                            : 'Distance',
                        controller.nearbyOnly.value,
                      ),
                    ),
                  ),
                  SizedBox(width: Responsive.w(context, 7)),

                  // Avalability
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.toggleAvailability,
                      child: filterButton(
                        context,
                        controller.availableOnly.value
                            ? 'Available'
                            : 'Availability',
                        controller.availableOnly.value,
                      ),
                    ),
                  ),
                ],
              );
            }),

            SizedBox(height: Responsive.h(context, 18)),
            // 4. DONOR COUNT AND FILTER ICON

            Obx(
              () => Row(
                children: [
                  Text(
                    "${controller.visibleDonors.length} Donors Found",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: Responsive.sp(context, 17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),

                  IconButton(
                    tooltip: 'Reset Filters',
                    onPressed: controller.resetFilters,

                    icon: Image.asset(
                      'assets/find donor/filter.png',
                      width: Responsive.w(context, 24),
                      height: Responsive.w(context, 24),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: Responsive.h(context, 8)),

            Expanded(
              child: Obx(() {
                final donors = controller.visibleDonors;
                if (donors.isEmpty) {
                  return Center(child: Text("Donor is Not Found"));
                }

                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: theme.dividerColor.withValues(alpha: 0.4),
                      height: Responsive.h(context, 10),
                    );
                  },
                  itemCount: donors.length,

                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        Get.find<NavigationController>().openDonorDetails(
                          donors[index],
                        );
                      },

                      child: donorCard(context, donors[index]),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Filter Button

  Widget filterButton(BuildContext context, String title, bool isSelected) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: Responsive.h(context, 34),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected
            ? (isDark ? const Color(0xFF47252E) : const Color(0xFFFFE8EC))
            : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(Responsive.w(context, 22)),
        border: Border.all(
          color: isSelected ? AppColors.primary : theme.dividerColor,
        ),
      ),

      child: Text(
        title,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodySmall?.copyWith(
          fontSize: Responsive.sp(context, 12),
          fontWeight: FontWeight.w600,
          color: isSelected ? AppColors.primary : theme.colorScheme.onSurface,
        ),
      ),
    );
  }

  // Reusable Donor Card
  Widget donorCard(BuildContext context, Map<String, String> donor) {
    final theme = Theme.of(context);
    final name = donor["name"]!;
    final isAvailable = donor['status'] == 'Available';

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.h(context, 12),
        horizontal: Responsive.w(context, 7),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Responsive.w(context, 10)),
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: Responsive.w(context, 25),
            backgroundImage: AssetImage(donor["image"]!),
          ),
          SizedBox(width: Responsive.w(context, 14)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Responsive.h(context, 3)),
              Text(
                "${donor["group"]}. ${donor["km"]} km . ${donor["city"]}",
                style: theme.textTheme.bodySmall,
              ),

              SizedBox(height: Responsive.h(context, 3)),

              // DONOR STATUS
              Row(
                children: [
                  Container(
                    height: Responsive.h(context, 7),
                    width: Responsive.w(context, 7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isAvailable ? AppColors.success : Colors.orange,
                    ),
                  ),
                  SizedBox(width: Responsive.w(context, 5)),
                  Text(
                    donor["status"]!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isAvailable ? AppColors.success : Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
