import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../core/responsive.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController controller = ChatController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.w(context, 20),
            vertical: Responsive.w(context, 12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: Get.back,
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: Responsive.w(context, 12)),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/chat/avatar-usman.png"),
                  ),

                  SizedBox(width: Responsive.w(context, 11)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Usman Ahmed",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: Responsive.h(context, 10),
                              width: Responsive.w(context, 10),
                              decoration: const BoxDecoration(
                                color: AppColors.success,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: Responsive.w(context, 11)),
                            Text(
                              "Online",
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.success,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call_outlined,
                      size: Responsive.sp(context, 24),
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Responsive.h(context, 15)),
              Expanded(
                child: Obx(() {
                  return ListView(
                    children: [
                      Align(
                        child: Container(
                          width: Responsive.width(context) * 0.76,
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive.w(context, 18),
                            vertical: Responsive.h(context, 14),
                          ),

                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(
                              Responsive.w(context, 17),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets.",
                                style: theme.textTheme.bodyLarge,
                              ),
                              SizedBox(height: Responsive.h(context, 11)),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "9:40 AM",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: Responsive.sp(context, 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: Responsive.h(context, 14)),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: Responsive.width(context) * 0.75,
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive.w(context, 18),
                            vertical: Responsive.h(context, 14),
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.darkChatBubble
                                : AppColors.lightChatBubble,
                            borderRadius: BorderRadius.circular(
                              Responsive.w(context, 17),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Walaikumassalam, yes we still need 2 units. Can you come to Mayo Hospital?",
                                style: theme.textTheme.bodyLarge,
                              ),
                              SizedBox(height: Responsive.h(context, 11)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,

                                    child: Text(
                                      "9:42 AM",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ),
                                  SizedBox(width: Responsive.w(context, 3)),
                                  Icon(
                                    Icons.done_all,
                                    size: Responsive.sp(context, 14),
                                    color: theme.textTheme.bodySmall?.color,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: Responsive.h(context, 17)),
                      GestureDetector(
                        onTap: () {
                          // Map integration later
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive.w(context, 12),
                            vertical: Responsive.h(context, 9),
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(
                              Responsive.w(context, 12),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/chat/pin.png",
                                height: Responsive.h(context, 28),
                                width: Responsive.w(context, 28),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: Responsive.w(context, 12)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Mayo Hospital, Lahore",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: Responsive.h(context, 8)),
                                  Text(
                                    "Tap to open location",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Responsive.h(context, 12)),
                      ...controller.messages.map((msg) {
                        final DateTime time = msg['time'] as DateTime;
                        final String formattedTime = TimeOfDay.fromDateTime(
                          time,
                        ).format(context);
                        final bool isMe = msg['isMe'] == true;
                        return Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            width: Responsive.width(context) * 0.76,
                            padding: EdgeInsets.symmetric(
                              horizontal: Responsive.w(context, 18),
                              vertical: Responsive.h(context, 14),
                            ),
                            margin: EdgeInsets.only(
                              bottom: Responsive.h(context, 12),
                            ),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? (isDark
                                        ? AppColors.darkChatBubble
                                        : AppColors.lightChatBubble)
                                  : theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(
                                Responsive.w(context, 17),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: IconButton(
                                            onPressed: controller.resetList,
                                            icon: Icon(Icons.delete),
                                          ),
                                        ),
                                      ];
                                    },
                                  ),
                                ),

                                Text(
                                  msg["message"],
                                  style: theme.textTheme.bodyLarge,
                                ),
                                SizedBox(height: Responsive.h(context, 11)),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    formattedTime,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontSize: Responsive.sp(context, 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                }),
              ),

              SizedBox(height: Responsive.h(context, 12)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.messageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Responsive.w(context, 14),
                          vertical: Responsive.h(context, 12),
                        ),
                        hintText: 'Type a message...',
                        hintStyle: theme.textTheme.bodySmall,
                        filled: true,
                        fillColor: theme.colorScheme.surface,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Responsive.w(context, 12),
                          ),
                          borderSide: BorderSide(color: theme.dividerColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Responsive.w(context, 12),
                          ),
                          borderSide: BorderSide(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Responsive.w(context, 8)),
                  Container(
                    height: Responsive.w(context, 48),
                    width: Responsive.w(context, 48),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(
                        Responsive.w(context, 12),
                      ),
                    ),
                    child: IconButton(
                      onPressed: controller.sendMessage,
                      icon: Icon(
                        Icons.send,
                        color: theme.colorScheme.onPrimary,
                        size: Responsive.sp(context, 22),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
