import 'package:flutter/material.dart';
import '../bloc/bloc_search_address.dart';
import '../model/address_list.dart';
import '../bloc/bloc_new_order.dart';
import 'text_style.dart';
import 'colors.dart';
import 'behavior.dart';


class AddressSearchPage extends StatefulWidget {
  final bool _from;
  AddressSearchPage(this._from);
  @override
  _AddressSearchPageState createState() => _AddressSearchPageState(_from);
}

class _AddressSearchPageState extends State<AddressSearchPage> {
  final TextEditingController _controller = TextEditingController(); 
  final BlocSearchAddress _bloc = BlocSearchAddress();
  final bool _from;

  _AddressSearchPageState(this._from);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _bloc.getAddressList(_controller.text));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Отмена',
                      style: AppTextStyle.text,
                    )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    if(_controller.text.isEmpty) return;
                    _from ? blocNewOrder.changeStreetFrom(_controller.text) : blocNewOrder.changeStreetTo(_controller.text);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Готово',
                      style: AppTextStyle.textBold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: TextField(
                controller: _controller,
                autofocus: true,
                cursorColor: AppColor.greenDark,
                style: AppTextStyle.textBig,
                decoration: InputDecoration.collapsed(
                  hintText: 'Адрес',
                  hintStyle: AppTextStyle.hoverBig,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: StreamBuilder(
                stream: _bloc.searchAddress.stream,
                builder: (context, AsyncSnapshot<AddressList> snapshot){
                  if(snapshot.hasData && snapshot.data.list!=null && snapshot.data.list.isNotEmpty){
                    return ScrollConfiguration(
                      behavior: Behavior(),
                      child: ListView.separated(
                        separatorBuilder: (context, i) => Divider(),
                        itemCount: snapshot.data.list.length,
                        itemBuilder: (context, i){
                          return GestureDetector(
                            onTap: (){
                              _from ? blocNewOrder.changeStreetFrom(snapshot.data.list[i].address2) : blocNewOrder.changeStreetTo(snapshot.data.list[i].address2);
                              Navigator.pop(context);
                            },
                            child: Text(
                              snapshot.data.list[i].address2,
                              style: AppTextStyle.items,
                            ),
                          );
                        },
                      ),
                    );
                  } return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}