import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import '../model/new_order_response.dart';
import '../model/new_order.dart';
import '../model/calculation_response.dart';
import '../bloc/bloc_new_order.dart';
import 'text_style.dart';
import 'behavior.dart';
import 'options_btn.dart';
import 'text_field_hint.dart';
import 'text_field_label.dart';
import 'colors.dart';
import 'adressearch_page.dart';
import 'neworder_decoration.dart';


class NewOrderPage extends StatefulWidget {
  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  final List<TextEditingController> _controller = List.generate(12, (_) => TextEditingController());
  final List<String> _listOptions = ['доставка', 'самовывоз', 'экспресс'];
  int _orderType = 0;

  @override
  void initState() {
    super.initState();
    blocNewOrder.init();
    _controller[0].addListener(() => blocNewOrder.changeClientNameFrom(_controller[0].text));
    _controller[1].addListener(() => blocNewOrder.changeClientContactFrom(_controller[1].text));
    _controller[2].addListener(() => blocNewOrder.changeClientPhoneFrom(_controller[2].text));
    _controller[3].addListener(() => blocNewOrder.changeClientNameTo(_controller[3].text));
    _controller[4].addListener(() => blocNewOrder.changeClientContactTo(_controller[4].text));
    _controller[5].addListener(() => blocNewOrder.changeClientPhoneTo(_controller[5].text));
    _controller[6].addListener(() => blocNewOrder.changeWeight(_controller[6].text));
    _controller[7].addListener(() => blocNewOrder.changeValue(_controller[7].text));
    _controller[8].addListener(() => blocNewOrder.changePieces(_controller[8].text));
    _controller[9].addListener(() => blocNewOrder.changeAppraisedValue(_controller[9].text));
    _controller[10].addListener(() => blocNewOrder.changeCodAmount(_controller[10].text));
    _controller[11].addListener(() => blocNewOrder.changeComment(_controller[11].text));
  }

  @override
  void dispose() {
    super.dispose();
    blocNewOrder.dispose();
    _controller.forEach((controller) => controller.dispose());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: blocNewOrder.newOrder.stream,
        builder: (context, AsyncSnapshot<NewOrder> newOrder){
          if(newOrder.hasData){
            return ScrollConfiguration(
              behavior: Behavior(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Новый заказ',
                        style: AppTextStyle.header,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          _controller.forEach((controller) => controller.clear());
                          _orderType = 0;
                          blocNewOrder.init();
                          setState(() {});
                        },
                        borderRadius: BorderRadius.circular(25.0),
                        highlightColor: Colors.black12,
                        splashColor: Colors.black12,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Сбросить',
                            style: AppTextStyle.text,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (i) => OptionsBtn(
                          onTap: (){
                            _orderType = i;
                            blocNewOrder.changeOrderType(_orderType);
                            setState((){});
                          },
                          caption: _listOptions[i],
                          color: _orderType == i ? AppColor.green : Colors.white,
                        )),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Отправитель',
                        style: AppTextStyle.title,
                      ),
                    ),
                    NewOrderDecoration(
                      children: <Widget>[
                        AppTextFieldHint(
                          controller: _controller[0],
                          inputType: TextInputType.text,
                          hintText: 'Организация',
                        ),
                        AppTextFieldHint(
                          controller: _controller[1],
                          inputType: TextInputType.text,
                          hintText: 'Контактное лицо',
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => AddressSearchPage(true)
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                newOrder.data.streetFrom,
                                style: newOrder.data.streetFrom == 'Адрес' ? AppTextStyle.hover : AppTextStyle.text,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => DatePicker.showDateTimePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) => blocNewOrder.changeDateTimeFrom(date),
                              currentTime: DateTime.now(),
                              locale: LocaleType.ru,
                              theme: DatePickerTheme(cancelStyle: AppTextStyle.text, doneStyle: AppTextStyle.textBold)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                newOrder.data.dateFrom + '   ' + newOrder.data.time1From,
                                style: newOrder.data.dateFrom == 'Время получения' ? AppTextStyle.hover : AppTextStyle.text,
                              ),
                            ),
                          ),
                        ),
                        AppTextFieldHint(
                          controller: _controller[2],
                          inputType: TextInputType.phone,
                          hintText: 'Телефон',
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Получатель',
                        style: AppTextStyle.title,
                      ),
                    ),
                    NewOrderDecoration(
                      children: <Widget>[
                        AppTextFieldHint(
                          controller: _controller[3],
                          inputType: TextInputType.text,
                          hintText: 'Организация',
                        ),
                        AppTextFieldHint(
                          controller: _controller[4],
                          inputType: TextInputType.text,
                          hintText: 'Контактное лицо',
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => AddressSearchPage(false)
                            );
                          },
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  newOrder.data.streetTo,
                                  style: newOrder.data.streetTo == 'Адрес' ? AppTextStyle.hover : AppTextStyle.text,
                                ),
                              )
                          ),
                        ),
                        GestureDetector(
                          onTap: () => DatePicker.showDateTimePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) => blocNewOrder.changeDateTimeTo(date),
                              currentTime: DateTime.now(),
                              locale: LocaleType.ru,
                              theme: DatePickerTheme(cancelStyle: AppTextStyle.text, doneStyle: AppTextStyle.textBold)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                newOrder.data.dateTo + '   ' + newOrder.data.time1To,
                                style: newOrder.data.dateTo == 'Время доставки' ? AppTextStyle.hover : AppTextStyle.text,
                              ),
                            ),
                          ),
                        ),
                        AppTextFieldHint(
                          controller: _controller[5],
                          inputType: TextInputType.phone,
                          hintText: 'Телефон',
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Товар',
                        style: AppTextStyle.title,
                      ),
                    ),
                    NewOrderDecoration(
                      children: <Widget>[
                        AppTextFieldLabel(
                          controller: _controller[6],
                          inputType: TextInputType.number,
                          labelText: 'Вес заказа (кг)',
                        ),
                        AppTextFieldLabel(
                          controller: _controller[7],
                          inputType: TextInputType.number,
                          labelText: 'Объем заказа',
                        ),
                        AppTextFieldLabel(
                          controller: _controller[8],
                          inputType: TextInputType.number,
                          labelText: 'Количество мест',
                        ),
                        AppTextFieldLabel(
                          controller: _controller[9],
                          inputType: TextInputType.number,
                          labelText: 'Оценочная стоимость',
                        ),
                        AppTextFieldLabel(
                          controller: _controller[10],
                          inputType: TextInputType.number,
                          labelText: 'Сумма наложенного платежа',
                        ),
                        AppTextFieldLabel(
                          controller: _controller[11],
                          inputType: TextInputType.multiline,
                          labelText: 'Комментарий',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    StreamBuilder(
                      stream: blocNewOrder.calculationResponse.stream,
                      builder: (context, AsyncSnapshot<CalculationResponse> calcResp){
                        if(calcResp.hasData && calcResp.data.message!=null && calcResp.data.message != '' && calcResp.data.message != 'Не все данные отправлены'){
                          return Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 12.0),
                            child: Text(
                              '${calcResp.data.message}',
                              style: AppTextStyle.msgRed,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 16.0),
                        StreamBuilder(
                          stream: blocNewOrder.calculationResponse.stream,
                          builder: (context, AsyncSnapshot<CalculationResponse> calculationResponse){
                            if(calculationResponse.hasData && calculationResponse.data.calcResult != 0){
                              if(calculationResponse.data.calcResult == -1) return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox.fromSize(
                                    size: Size.square(16.0),
                                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppColor.blue))),
                              );
                              return Text('${calculationResponse.data.costDelivery} руб', style: AppTextStyle.title);
                            }
                            return Text('0 руб', style: AppTextStyle.title);
                          },
                        ),
                        Spacer(),
                        Ink(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.elliptical(25.0, 25.0)),
                              boxShadow: [
                                BoxShadow(offset: Offset(2.0, 4.0), blurRadius: 6.0, color: AppColor.shadow)
                              ]
                          ),
                          child: InkWell(
                            onTap: () => blocNewOrder.sendRequest(),
                            highlightColor: Colors.black12,
                            splashColor: Colors.black12,
                            borderRadius: BorderRadius.circular(25.0),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  StreamBuilder(
                                    stream: blocNewOrder.newOrderResponse.stream,
                                    builder: (context, AsyncSnapshot<NewOrderResponse> newOrderResponse){
                                      if(newOrderResponse.hasData){
                                        switch(newOrderResponse.data.result){
                                          case -1: return SizedBox.fromSize(size: Size.square(14.0), child: CircularProgressIndicator());
                                          case 0: return Icon(Icons.cancel, color: Colors.red, size: 20.0);
                                          case 1: return Icon(Icons.check_circle, color: AppColor.green, size: 20.0);
                                        }
                                      }
                                      if(newOrderResponse.hasError) return Icon(Icons.cancel, color: Colors.redAccent, size: 20.0);
                                      return Container();
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                                    child: Text(
                                      'Отправить',
                                      style: AppTextStyle.textBigBold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                      ],
                    ),
                    SizedBox(height: 20.0)
                  ],
                ),
              ),
            );
          } return Container();
        },
      ),
    );
  }
}