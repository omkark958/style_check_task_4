import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:style_check_task_4/app/widgets/reusablewidgets/borrowed_item_card.dart';

class BorrowedItemsScreen extends StatefulWidget {
  const BorrowedItemsScreen({super.key});

  @override
  State<BorrowedItemsScreen> createState() => _BorrowedItemsScreenState();
}

class _BorrowedItemsScreenState extends State<BorrowedItemsScreen> {
  final List<Map<String, dynamic>> allItems = [
    {
      'logoUrl':
          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/06/Starbucks_Corporation_Logo_2011.svg-e1657703028844.png?auto=format&q=60&fit=max&w=930',
      'companyName': 'TechCorp Solutions',
      'userName': 'Aarti Sathe',
      'status': 'Approved',
      'borrowId': 'BRW-2024-001',
      'dateTime': '02 June 2025 10:30 AM',
      'noOfItems': 10,
      'payableAmount': '₹13,000.50',
      'returnWindow': '14 days',
      'dueDate': '15 June 2025',
    },
    {
      'logoUrl':
          'https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/06/Starbucks_Corporation_Logo_2011.svg-e1657703028844.png?auto=format&q=60&fit=max&w=930',
      'companyName': 'GreenEarth Supplies',
      'userName': 'Ravi Joshi',
      'status': 'Pending',
      'borrowId': 'BRW-2024-002',
      'dateTime': '03 June 2025 11:00 AM',
      'noOfItems': 5,
      'payableAmount': '₹7,500.00',
      'returnWindow': '7 days',
      'dueDate': '10 June 2025',
    },
  ];

  List<Map<String, dynamic>> filteredItems = [];
  String? selectedStatus;
  final TextEditingController _searchController = TextEditingController();
  bool isAscending = true;

  String? selectedCategory = "Borrow";
  @override
  void initState() {
    super.initState();
    filteredItems = List.from(allItems);
  }

  void filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = allItems.where((item) {
        final matchesName = item['companyName'].toLowerCase().contains(query);
        final matchesStatus = selectedStatus == null ||
            selectedStatus == "All" ||
            item['status'] == selectedStatus;
        return matchesName && matchesStatus;
      }).toList();
    });
  }

  void sortItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      // Filter
      filteredItems = allItems.where((item) {
        final matchesName = item['companyName'].toLowerCase().contains(query);
        final matchesStatus = selectedStatus == null ||
            selectedStatus == "All" ||
            item['status'] == selectedStatus;
        return matchesName && matchesStatus;
      }).toList();

      // Sort
      filteredItems.sort((a, b) {
        final aName = a['companyName'].toLowerCase();
        final bName = b['companyName'].toLowerCase();
        return isAscending ? aName.compareTo(bName) : bName.compareTo(aName);
      });

      // Toggle direction
      isAscending = !isAscending;
    });
  }

  List<Map<String, dynamic>> generateMoreFakeItems(int count) {
    return List.generate(count, (index) {
      int num = filteredItems.length + index + 1;
      return {
        'logoUrl':
            'https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/06/Starbucks_Corporation_Logo_2011.svg-e1657703028844.png?auto=format&q=60&fit=max&w=930',
        'companyName': 'NewCompany $num',
        'userName': 'User $num',
        'status': ['Approved', 'Pending', 'Rejected'][index % 3],
        'borrowId': 'BRW-2024-00$num',
        'dateTime': '05 July 2025 11:00 AM',
        'noOfItems': 3 + index,
        'payableAmount': '₹${(5000 + index * 300).toStringAsFixed(2)}',
        'returnWindow': '${7 + index % 5} days',
        'dueDate': '15 July 2025',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorrowLendExchangeToggle(
            selectedCategory: selectedCategory ?? "Borrow",
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          const SizedBox(height: 16),

          /// 🔍 Search + Status Filter Row
          /// 🔍 Search + Status Filter + Filter Button
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  // TypeAhead search
                  Expanded(
                    flex: 4,
                    child: TypeAheadField<String>(
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(
                            suggestion,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      },
                      onSelected: (String suggestion) {
                        _searchController.text = suggestion;
                        filterItems();
                      },
                      builder: (context, controller, focusNode) {
                        return TextField(
                          controller: _searchController,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 12,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: const Color(0xFF1C1C1E),
                            hintText: 'Search business name...',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          onChanged: (val) => filterItems(),
                        );
                      },
                      suggestionsCallback: (String search) {},
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Filter Button
                  ElevatedButton(
                    onPressed: sortItems,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Icon(Icons.swap_vert, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Status Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedStatus,
                        hint: const Text(
                          "Status",
                          style: TextStyle(color: Colors.white),
                        ),
                        dropdownColor: const Color(0xFF1C1C1E),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        style: const TextStyle(color: Colors.white),
                        items: ['All', 'Approved', 'Pending', 'Rejected'].map((
                          status,
                        ) {
                          return DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => selectedStatus = value);
                          filterItems();
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            allItems.insert(0, {
                              'logoUrl':
                                  'https://www.feedough.com/wp-content/uploads/2016/08/what-is-brand.png',
                              'companyName': 'QuickAdd Co.',
                              'userName': 'New User',
                              'status': 'Approved',
                              'borrowId':
                                  'BRW-${DateTime.now().millisecondsSinceEpoch}',
                              'dateTime': '25 June 2025 12:00 PM',
                              'noOfItems': 2,
                              'payableAmount': '₹2,999.00',
                              'returnWindow': '10 days',
                              'dueDate': '05 July 2025',
                            });
                            filterItems(); // reapply filter
                            Get.snackbar(
                                "Quick Add", "Borrower added successfully",
                                colorText: Colors.blue);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(Icons.add, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Borrowed Items",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 10),

          filteredItems.isEmpty
              ? const Center(
                  child: Text(
                    "No items found.",
                    style: TextStyle(color: Colors.white60),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return BorrowedItemCard(
                      logoUrl: item['logoUrl'],
                      companyName: item['companyName'],
                      userName: item['userName'],
                      status: item['status'],
                      borrowId: item['borrowId'],
                      dateTime: item['dateTime'],
                      noOfItems: item['noOfItems'],
                      payableAmount: item['payableAmount'],
                      returnWindow: item['returnWindow'],
                      dueDate: item['dueDate'],
                    );
                  },
                ),
          const SizedBox(height: 12),

          /// View More Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final newItems = generateMoreFakeItems(3); // Add 3 new items
                setState(() {
                  allItems.addAll(newItems);
                  filterItems(); // reapply filters
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(49, 252, 252, 252),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("View More"),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BorrowLendExchangeToggle extends StatelessWidget {
  final String selectedCategory;
  final void Function(String) onCategorySelected;

  const BorrowLendExchangeToggle({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'label': 'Borrow', 'icon': Icons.shopping_bag},
      {'label': 'Lend', 'icon': Icons.upload_rounded},
      {'label': 'Exchange', 'icon': Icons.swap_horiz},
    ];

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories.map((category) {
          final String label = category['label'] as String;
          final IconData icon = category['icon'] as IconData;
          final bool isSelected = selectedCategory == label;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color:
                    isSelected ? Colors.white : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => onCategorySelected(label),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        size: 18,
                        color: isSelected ? Colors.black : Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        label,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

//  @override
// Widget build(BuildContext context) {
//   return SingleChildScrollView(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// Search + Filter Row
//         Row(
//           children: [
//             Expanded(
//               flex: 3,
//               child: TypeAheadField<String>(
//                 suggestionsCallback: (pattern) {
//                   final lowercasePattern = pattern.toLowerCase();
//                   return allItems
//                       .map((e) => e['companyName'].toString())
//                       .where((name) => name.toLowerCase().contains(lowercasePattern))
//                       .toSet()
//                       .toList();
//                 },
//                 itemBuilder: (context, suggestion) {
//                   return ListTile(
//                     title: Text(suggestion, style: const TextStyle(color: Colors.black)),
//                   );
//                 },
//                 onSelected: (String suggestion) {
//                   _searchController.text = suggestion;
//                   filterItems();
//                 },
//                 builder: (context, controller, focusNode) {
//                   return TextField(
//                     controller: _searchController,
//                     focusNode: focusNode,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search, color: Colors.white),
//                       filled: true,
//                       fillColor: const Color(0xFF1C1C1E),
//                       hintText: 'Search business name...',
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     style: const TextStyle(color: Colors.white),
//                     onChanged: (val) => filterItems(),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(width: 12),
//             Container(
//               height: 48,
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1C1C1E),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   value: selectedStatus,
//                   dropdownColor: const Color(0xFF1C1C1E),
//                   hint: Row(
//                     children: const [
//                       Text("Status", style: TextStyle(color: Colors.white)),
//                       SizedBox(width: 6),
//                       Icon(Icons.add, size: 20, color: Colors.white),
//                     ],
//                   ),
//                   icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
//                   style: const TextStyle(color: Colors.white),
//                   items: ['Approved', 'Pending', 'Rejected']
//                       .map((status) => DropdownMenuItem(
//                             value: status,
//                             child: Text(status),
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() => selectedStatus = value);
//                     filterItems();
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         const Text("Borrowed Items",
//             style: TextStyle(color: Colors.white, fontSize: 18)),
//         const SizedBox(height: 10),

//         // ✅ Replace Flexible with shrink-wrapped ListView
//         filteredItems.isEmpty
//             ? const Center(
//                 child: Text("No items found.",
//                     style: TextStyle(color: Colors.white60)),
//               )
//             : ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(), // prevent nested scrolling
//                 itemCount: filteredItems.length,
//                 itemBuilder: (context, index) {
//                   final item = filteredItems[index];
//                   return BorrowedItemCard(
//                     logoUrl: item['logoUrl'],
//                     companyName: item['companyName'],
//                     userName: item['userName'],
//                     status: item['status'],
//                     borrowId: item['borrowId'],
//                     dateTime: item['dateTime'],
//                     noOfItems: item['noOfItems'],
//                     payableAmount: item['payableAmount'],
//                     returnWindow: item['returnWindow'],
//                     dueDate: item['dueDate'],
//                   );
//                 },
//               ),
//       ],
//     ),
//   );
// }
