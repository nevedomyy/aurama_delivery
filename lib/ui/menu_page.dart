import 'package:flutter/material.dart';
import 'text_style.dart';
import 'colors.dart';
import 'neworder_page.dart';
import 'orders_page.dart';
import 'chat_page.dart';
import 'profile_page.dart';
import 'help_page.dart';
import 'menu_btn.dart';


class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin{
  final List<String> _menuItems = ['ПОМОЩЬ', 'КАБИНЕТ', 'ЧАТ', 'ЗАКАЗЫ', 'НОВЫЙ'];
  AnimationController _animationController;  
  Animation _animation;
  int _pageNumber = 4;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400)
    )..addListener((){setState(() {});});
    _animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: AppColor.background,
      child: Row(
              children: <Widget>[
                Container(
                  color: AppColor.green,
                  height: double.infinity,
                  width: 52.0,
                  child: _animationController.isCompleted
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(5, (i){
                            return MenuBtn(
                              onTap: (){
                                _pageNumber = i;
                                setState((){});
                              },
                              caption: _menuItems[i],
                              color: _pageNumber == i ? AppColor.blue : Colors.white
                            );
                          })
                        ),
                      )
                    : Container()
                ),
                Expanded(
                  child: _animationController.isCompleted
                    ? SafeArea(
                        child: IndexedStack(
                          index: _pageNumber,
                          children: <Widget>[
                            HelpPage(),
                            ProfilePage(),
                            ChatPage(),
                            OrdersPage(),
                            NewOrderPage()
                          ],
                        ),
                      )
                    : AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) => Transform.translate(
                          offset: Offset(-_animation.value*width, 0),
                          child: Container(
                            color: AppColor.green,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  right: 50.0,
                                  top: height/3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'КУРЬЕР',
                                        style: AppTextStyle.intro1,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Text(
                                        'доставка',
                                        style: AppTextStyle.intro2,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      SizedBox(height: 5.0),
                                      Icon(Icons.arrow_forward, color: Colors.white, size: 36.0)
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _animationController.forward(),
                                )
                              ],
                            ),
                          )
                        ),
                      )
                )
              ],
            )  
    );
  }
}
