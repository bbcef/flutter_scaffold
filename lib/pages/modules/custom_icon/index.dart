import 'package:flutter/material.dart';
import 'package:flutter_scaffold/utils/nhtc_icon.dart';

class CoustomIconPage extends StatelessWidget {
  static const String routeNmae = "/custom_icon";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义icon'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: CenterBody(),
    );
  }
}

class CenterBody extends StatelessWidget {
  List _listIcons = [
    {"text": "NhtcIcons.Home", "iconData": NhtcIcons.Home},
    {"text": "NhtcIcons.Product", "iconData": NhtcIcons.Product},
    {"text": "NhtcIcons.Mima", "iconData": NhtcIcons.Mima},
    {"text": "NhtcIcons.Shenpi", "iconData": NhtcIcons.Shenpi},
    {"text": "NhtcIcons.Information", "iconData": NhtcIcons.Information},
    {"text": "NhtcIcons.Me", "iconData": NhtcIcons.Me},
    {"text": "NhtcIcons.Public", "iconData": NhtcIcons.Public},
    {"text": "NhtcIcons.Zuzhijiagou", "iconData": NhtcIcons.Zuzhijiagou},
    {"text": "NhtcIcons.Tel", "iconData": NhtcIcons.Tel},
    {"text": "NhtcIcons.WeChat", "iconData": NhtcIcons.WeChat},
    {"text": "NhtcIcons.Renwu", "iconData": NhtcIcons.Renwu},
    {"text": "NhtcIcons.Gongzhang", "iconData": NhtcIcons.Gongzhang},
    {"text": "NhtcIcons.Telfill", "iconData": NhtcIcons.Telfill},
    {"text": "NhtcIcons.Fuwu", "iconData": NhtcIcons.Fuwu},
    {"text": "NhtcIcons.WeChatfill", "iconData": NhtcIcons.WeChatfill},
    {"text": "NhtcIcons.Qiandai", "iconData": NhtcIcons.Qiandai},
    {"text": "NhtcIcons.Fenxi2", "iconData": NhtcIcons.Fenxi2},
    {"text": "NhtcIcons.Location", "iconData": NhtcIcons.Location},
    {"text": "NhtcIcons.Gengduo", "iconData": NhtcIcons.Gengduo},
    {"text": "NhtcIcons.Tongzhi", "iconData": NhtcIcons.Tongzhi},
    {"text": "NhtcIcons.Hetong", "iconData": NhtcIcons.Hetong},
    {"text": "NhtcIcons.ThumbsUp", "iconData": NhtcIcons.ThumbsUp},
    {"text": "NhtcIcons.ShareFill", "iconData": NhtcIcons.ShareFill},
    {"text": "NhtcIcons.Achievements", "iconData": NhtcIcons.Achievements},
    {
      "text": "NhtcIcons.Personalinformation",
      "iconData": NhtcIcons.Personalinformation
    },
    {"text": "NhtcIcons.Share", "iconData": NhtcIcons.Share},
    {"text": "NhtcIcons.Setup", "iconData": NhtcIcons.Setup},
    {"text": "NhtcIcons.QRcode", "iconData": NhtcIcons.QRcode},
    {"text": "NhtcIcons.DropDown", "iconData": NhtcIcons.DropDown},
    {"text": "NhtcIcons.Display", "iconData": NhtcIcons.Display},
    {"text": "NhtcIcons.Hide", "iconData": NhtcIcons.Hide},
    {"text": "NhtcIcons.Passwordfill", "iconData": NhtcIcons.Passwordfill},
    {"text": "NhtcIcons.Username", "iconData": NhtcIcons.Username},
    {"text": "NhtcIcons.Guquan", "iconData": NhtcIcons.Guquan},
    {"text": "NhtcIcons.Sanzijianguan", "iconData": NhtcIcons.Sanzijianguan},
    {"text": "NhtcIcons.Caiwuguanli", "iconData": NhtcIcons.Caiwuguanli},
    {"text": "NhtcIcons.Shenqing", "iconData": NhtcIcons.Shenqing},
    {"text": "NhtcIcons.Jilu", "iconData": NhtcIcons.Jilu},
    {
      "text": "NhtcIcons.ArrowRightBold",
      "iconData": NhtcIcons.ArrowRightBold
    },
    {"text": "NhtcIcons.ArrowLeftBold", "iconData": NhtcIcons.ArrowLeftBold},
    {
      "text": "NhtcIcons.Daozhangchaxun",
      "iconData": NhtcIcons.Daozhangchaxun
    },
    {"text": "NhtcIcons.Shalou", "iconData": NhtcIcons.Shalou},
    {"text": "NhtcIcons.Launch", "iconData": NhtcIcons.Launch},
    {"text": "NhtcIcons.Approval", "iconData": NhtcIcons.Approval},
    {"text": "NhtcIcons.Processquery", "iconData": NhtcIcons.Processquery},
    {
      "text": "NhtcIcons.Dataacquisition",
      "iconData": NhtcIcons.Dataacquisition
    },
    {
      "text": "NhtcIcons.Creditassistance",
      "iconData": NhtcIcons.Creditassistance
    },
    {
      "text": "NhtcIcons.Examinationtraining",
      "iconData": NhtcIcons.Examinationtraining
    },
    {"text": "NhtcIcons.Maillist", "iconData": NhtcIcons.Maillist},
    {
      "text": "NhtcIcons.Basicconfiguration",
      "iconData": NhtcIcons.Basicconfiguration
    },
    {"text": "NhtcIcons.Mail", "iconData": NhtcIcons.Mail},
    {"text": "NhtcIcons.Distribution", "iconData": NhtcIcons.Distribution},
    {
      "text": "NhtcIcons.Rolemanagement",
      "iconData": NhtcIcons.Rolemanagement
    },
    {
      "text": "NhtcIcons.Usermanagement",
      "iconData": NhtcIcons.Usermanagement
    },
    {
      "text": "NhtcIcons.ElectronicSignature",
      "iconData": NhtcIcons.ElectronicSignature
    },
    {"text": "NhtcIcons.Worktime", "iconData": NhtcIcons.Worktime},
    {"text": "NhtcIcons.Deposit", "iconData": NhtcIcons.Deposit},
    {
      "text": "NhtcIcons.Depositloanratio",
      "iconData": NhtcIcons.Depositloanratio
    },
    {"text": "NhtcIcons.Loan", "iconData": NhtcIcons.Loan},
    {"text": "NhtcIcons.Decline", "iconData": NhtcIcons.Decline},
    {"text": "NhtcIcons.Deosits", "iconData": NhtcIcons.Deosits},
    {"text": "NhtcIcons.Bankcard", "iconData": NhtcIcons.Bankcard},
    {"text": "NhtcIcons.Cunkuan", "iconData": NhtcIcons.Cunkuan},
    {"text": "NhtcIcons.Risk", "iconData": NhtcIcons.Risk},
    {"text": "NhtcIcons.Cunkuanyewu", "iconData": NhtcIcons.Cunkuanyewu},
    {"text": "NhtcIcons.Daikuanyewu", "iconData": NhtcIcons.Daikuanyewu},
    {"text": "NhtcIcons.Dianziyinhang", "iconData": NhtcIcons.Dianziyinhang},
    {"text": "NhtcIcons.Shujubaobiao", "iconData": NhtcIcons.Shujubaobiao},
    {"text": "NhtcIcons.Jiashicang", "iconData": NhtcIcons.Jiashicang},
    {"text": "NhtcIcons.Fawen", "iconData": NhtcIcons.Fawen},
    {"text": "NhtcIcons.Shouwen", "iconData": NhtcIcons.Shouwen},
    {"text": "NhtcIcons.Qingshi", "iconData": NhtcIcons.Qingshi},
    {"text": "NhtcIcons.Zhoubao", "iconData": NhtcIcons.Zhoubao},
    {
      "text": "NhtcIcons.Shanghuiyitiqingshi",
      "iconData": NhtcIcons.Shanghuiyitiqingshi
    },
    {"text": "NhtcIcons.Huiyishenqing", "iconData": NhtcIcons.Huiyishenqing},
    {"text": "NhtcIcons.Qingjia", "iconData": NhtcIcons.Qingjia},
    {"text": "NhtcIcons.Waichu", "iconData": NhtcIcons.Waichu},
    {
      "text": "NhtcIcons.Bumenneibujiaoban",
      "iconData": NhtcIcons.Bumenneibujiaoban
    },
    {"text": "NhtcIcons.Bumenxieban", "iconData": NhtcIcons.Bumenxieban},
    {"text": "NhtcIcons.Duchaduban", "iconData": NhtcIcons.Duchaduban},
    {
      "text": "NhtcIcons.Yinshuashenqing",
      "iconData": NhtcIcons.Yinshuashenqing
    },
    {"text": "NhtcIcons.Jiedai", "iconData": NhtcIcons.Jiedai},
    {"text": "NhtcIcons.Wupinlingyong", "iconData": NhtcIcons.Wupinlingyong},
    {
      "text": "NhtcIcons.Renyuanchoutiao",
      "iconData": NhtcIcons.Renyuanchoutiao
    },
    {
      "text": "NhtcIcons.Daibanshixiang",
      "iconData": NhtcIcons.Daibanshixiang
    },
    {"text": "NhtcIcons.Yibanshixiang", "iconData": NhtcIcons.Yibanshixiang},
    {"text": "NhtcIcons.Yunyingguanli", "iconData": NhtcIcons.Yunyingguanli},
    {
      "text": "NhtcIcons.Caizhengzhibiao",
      "iconData": NhtcIcons.Caizhengzhibiao
    },
    {"text": "NhtcIcons.Daihouguanli", "iconData": NhtcIcons.Daihouguanli},
    {
      "text": "NhtcIcons.Daihoujianchashenpi",
      "iconData": NhtcIcons.Daihoujianchashenpi
    },
    {
      "text": "NhtcIcons.Daihounianjianshenpi",
      "iconData": NhtcIcons.Daihounianjianshenpi
    },
    {
      "text": "NhtcIcons.Daihounianjianshenyi",
      "iconData": NhtcIcons.Daihounianjianshenyi
    },
    {"text": "NhtcIcons.Xinxifabu", "iconData": NhtcIcons.Xinxifabu},
    {
      "text": "NhtcIcons.Gexiangdaikuan",
      "iconData": NhtcIcons.Gexiangdaikuan
    },
    {
      "text": "NhtcIcons.Shenongdaikuan",
      "iconData": NhtcIcons.Shenongdaikuan
    },
    {
      "text": "NhtcIcons.Xiaoweidaikuan",
      "iconData": NhtcIcons.Xiaoweidaikuan
    },
    {
      "text": "NhtcIcons.Duigongdaikuan",
      "iconData": NhtcIcons.Duigongdaikuan
    },
    {"text": "NhtcIcons.Shujucaiji", "iconData": NhtcIcons.Shujucaiji},
    {"text": "NhtcIcons.Zhengshudayin", "iconData": NhtcIcons.Zhengshudayin},
    {
      "text": "NhtcIcons.Chanquanjiaoyi",
      "iconData": NhtcIcons.Chanquanjiaoyi
    },
    {
      "text": "NhtcIcons.Liuzhuanjiaoyi",
      "iconData": NhtcIcons.Liuzhuanjiaoyi
    },
    {"text": "NhtcIcons.Caiwugongkai", "iconData": NhtcIcons.Caiwugongkai},
    {"text": "NhtcIcons.Fuwugongkai", "iconData": NhtcIcons.Fuwugongkai},
    {
      "text": "NhtcIcons.Siyilianggongkai",
      "iconData": NhtcIcons.Siyilianggongkai
    },
    {"text": "NhtcIcons.Cunwugongkai", "iconData": NhtcIcons.Cunwugongkai},
    {"text": "NhtcIcons.Dangwugongkai", "iconData": NhtcIcons.Dangwugongkai},
    {
      "text": "NhtcIcons.Xiangcungaikuang",
      "iconData": NhtcIcons.Xiangcungaikuang
    },
    {"text": "NhtcIcons.Shengri", "iconData": NhtcIcons.Shengri},
    {"text": "NhtcIcons.Dianhua", "iconData": NhtcIcons.Dianhua},
    {"text": "NhtcIcons.Tianjia", "iconData": NhtcIcons.Tianjia},
    {"text": "NhtcIcons.Kehudengji", "iconData": NhtcIcons.Kehudengji},
    {"text": "NhtcIcons.Keling", "iconData": NhtcIcons.Keling},
    {
      "text": "NhtcIcons.Dangqianchiyouchanpinshu",
      "iconData": NhtcIcons.Dangqianchiyouchanpinshu
    },
    {
      "text": "NhtcIcons.Zuidadanbijiaoyijine",
      "iconData": NhtcIcons.Zuidadanbijiaoyijine
    },
    {
      "text": "NhtcIcons.Zuigaoshouxinedu",
      "iconData": NhtcIcons.Zuigaoshouxinedu
    },
    {"text": "NhtcIcons.Gongzuotai", "iconData": NhtcIcons.Gongzuotai},
    {
      "text": "NhtcIcons.Yingxiaoguanli",
      "iconData": NhtcIcons.Yingxiaoguanli
    },
    {"text": "NhtcIcons.Gonghaikehu", "iconData": NhtcIcons.Gonghaikehu},
    {"text": "NhtcIcons.Wodekehu", "iconData": NhtcIcons.Wodekehu},
    {"text": "NhtcIcons.Kequnguanli", "iconData": NhtcIcons.Kequnguanli},
    {"text": "NhtcIcons.Jiebang", "iconData": NhtcIcons.Jiebang},
    {"text": "NhtcIcons.Yijiao", "iconData": NhtcIcons.Yijiao},
    {"text": "NhtcIcons.Daitiaocha", "iconData": NhtcIcons.Daitiaocha},
    {"text": "NhtcIcons.Bohui", "iconData": NhtcIcons.Bohui},
    {"text": "NhtcIcons.Daixieban", "iconData": NhtcIcons.Daixieban},
    {"text": "NhtcIcons.Tongguo", "iconData": NhtcIcons.Tongguo},
    {"text": "NhtcIcons.Zhou", "iconData": NhtcIcons.Zhou},
    {"text": "NhtcIcons.Ri", "iconData": NhtcIcons.Ri},
    {"text": "NhtcIcons.Yue", "iconData": NhtcIcons.Yue},
    {
      "text": "NhtcIcons.Feixianchangshenchashenpi",
      "iconData": NhtcIcons.Feixianchangshenchashenpi
    },
    {
      "text": "NhtcIcons.Shouxinshenchashenpi",
      "iconData": NhtcIcons.Shouxinshenchashenpi
    },
    {
      "text": "NhtcIcons.Yongxinshenchashenpi",
      "iconData": NhtcIcons.Yongxinshenchashenpi
    },
    {
      "text": "NhtcIcons.Shoucishenchashenpi",
      "iconData": NhtcIcons.Shoucishenchashenpi
    },
    {"text": "NhtcIcons.Shujutiqu", "iconData": NhtcIcons.Shujutiqu},
    {"text": "NhtcIcons.Shujucaiji1", "iconData": NhtcIcons.Shujucaiji1}
  ];
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8),
        children: _listIcons.map((e) {
          return Container(
            color: Colors.grey,
            padding: EdgeInsets.all(10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(e['iconData'], size: 34, color: Colors.white),
              // Text(
              //   e['text'],
              //   maxLines: 3,
              //   overflow: TextOverflow.ellipsis,
              //   style: TextStyle(fontSize: 14),
              // )
            ]),
          );
        }).toList());
  }
}
