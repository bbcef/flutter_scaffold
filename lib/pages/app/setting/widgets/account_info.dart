import 'package:flutter/material.dart';
import 'package:flutter_scaffold/widgets/cs_cell.dart';

class AccountInfoPage extends StatefulWidget {
  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账号资料')
      ),
      body: Scrollbar(
        thickness: 3,
        radius: Radius.circular(8),
        child:SingleChildScrollView(
          child: Column(
            children: [
              _space,
              CsCell(
                title: '头像',
                rightWidget: ClipOval(
                  child: Image.asset(
                    'assets/images/portrait.jpg',
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover
                  ),
                )
              ),
              CsCell(
                title: '昵称',
                rightWidget: Text('cat-eat-fish',style: TextStyle(color: Colors.grey),),
              ),
              CsCell(
                title: '性别',
                rightWidget: Text('保密',style: TextStyle(color: Colors.grey),),
              ),
              CsCell(
                title: '出生年月',
                rightWidget: Text('1997-11-17',style: TextStyle(color: Colors.grey),),
              ),
              CsCell(
                hiddenLine: true,
                title: '个性签名',
                rightWidget: Expanded(
                  child: Text('qqq' * 9,maxLines: 1,textAlign: TextAlign.end,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey),)
                )
              ),
              _space,
              CsCell(
                hiddenArrow: true,
                title: 'UID',
                rightWidget: Text('44654884566',maxLines: 1,overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey))
              ),
              CsCell(
                hiddenLine: true,
                title: '二维码名片',
                rightWidget: Icon(Icons.qr_code)
              ),
              _space,
            ],
          )
        )
      )
    );
  }

  
  Widget _space = SizedBox(height: 15);
}

