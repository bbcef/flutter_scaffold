import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:flutter_scaffold/config.dart';
import 'package:flutter/material.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:permission_handler/permission_handler.dart';


class AllMapConfigDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllMapConfigDemoPageState();
}

class AllMapConfigDemoPageState extends State<AllMapConfigDemoPage> {

  //默认
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(37.78813912338759, 112.55736650195354),
    zoom: 10.0,
  );

  ///地图类型
  MapType _mapType = MapType.normal;

  ///显示路况开关
  bool _trafficEnabled = true;

  /// 地图poi是否允许点击
  bool _touchPoiEnabled = false;

  ///是否显示3D建筑物
  bool _buildingsEnabled = true;

  ///是否显示底图文字标注
  bool _labelsEnabled = true;

  ///是否显示指南针
  bool _compassEnabled = true;

  ///是否显示比例尺
  bool _scaleEnabled = true;

  ///是否支持缩放手势
  bool _zoomGesturesEnabled = true;

  ///是否支持滑动手势
  bool _scrollGesturesEnabled = true;

  ///是否支持旋转手势
  bool _rotateGesturesEnabled = true;

  ///是否支持倾斜手势
  bool _tiltGesturesEnabled = true;

  AMapController _controller;

  CustomStyleOptions _customStyleOptions = CustomStyleOptions(false);

  
  final double _minZoom = 10;
  final double _maxZoom = 15;

  void _requestLocaitonPermission() async {
    PermissionStatus status = await Permission.location.request();
    print('permissionStatus=====> $status');
  }

  ///自定义定位小蓝点
  MyLocationStyleOptions _myLocationStyleOptions = MyLocationStyleOptions(true);
  
  @override
  void initState() {
    super.initState();
    // 位置权限
    _requestLocaitonPermission();
  }

  @override
  void reassemble() {
    super.reassemble();
    _requestLocaitonPermission();

  }

  @override
  Widget build(BuildContext context) {
    final AMapWidget map = AMapWidget(
      apiKey: AmapConfig.amapApiKeys,
      initialCameraPosition: _kInitialPosition,
      mapType: _mapType,
      trafficEnabled: _trafficEnabled,
      buildingsEnabled: _buildingsEnabled,
      compassEnabled: _compassEnabled,
      labelsEnabled: _labelsEnabled,
      scaleEnabled: _scaleEnabled,
      touchPoiEnabled: _touchPoiEnabled,
      rotateGesturesEnabled: _rotateGesturesEnabled,
      scrollGesturesEnabled: _scrollGesturesEnabled,
      tiltGesturesEnabled: _tiltGesturesEnabled,
      zoomGesturesEnabled: _zoomGesturesEnabled,
      onMapCreated: onMapCreated,
      customStyleOptions: _customStyleOptions,
      myLocationStyleOptions: _myLocationStyleOptions,
      onLocationChanged: _onLocationChanged,
      onCameraMove: _onCameraMove,
      onCameraMoveEnd: _onCameraMoveEnd,
      onTap: _onMapTap,
      onLongPress: _onMapLongPress,
      onPoiTouched: _onMapPoiTouched,
      minMaxZoomPreference: MinMaxZoomPreference(_minZoom, _maxZoom),
    );

    Widget _buildZoomInOut(){
      return Positioned(
        right: 5,
        bottom: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkResponse(
              child: Container(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                width: 40,
                height: 40,
                color: Colors.blue,
              ),
              onTap: _zoomIn,
            ),
            InkResponse(
              child: Container(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                color: Colors.blue,
                width: 40,
                height: 40,
              ),
              onTap: _zoomOut,
            ),
          ],
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: map,
          ),
          _buildZoomInOut()
        ]
      )
    );
  }

  
  void onMapCreated(AMapController controller) {
    setState(() {
      _controller = controller;
      printApprovalNumber();
    });
  }

  void printApprovalNumber() async {
    String mapContentApprovalNumber =
        await _controller?.getMapContentApprovalNumber();
    String satelliteImageApprovalNumber =
        await _controller?.getSatelliteImageApprovalNumber();
    print('地图审图号（普通地图）: $mapContentApprovalNumber');
    print('地图审图号（卫星地图): $satelliteImageApprovalNumber');
  }

  void _onLocationChanged(AMapLocation location) {
    if (null == location) {
      return;
    }
    print('_onLocationChanged ${location.toJson()}');
  }

  void _onCameraMove(CameraPosition cameraPosition) {
    if (null == cameraPosition) {
      return;
    }
    print('onCameraMove===> ${cameraPosition.toMap()}');
  }

  void _onCameraMoveEnd(CameraPosition cameraPosition) {
    if (null == cameraPosition) {
      return;
    }
    print('_onCameraMoveEnd===> ${cameraPosition.toMap()}');
  }

  void _onMapTap(LatLng latLng) {
    if (null == latLng) {
      return;
    }
    print('_onMapTap===> ${latLng.toJson()}');
  }

  void _onMapLongPress(LatLng latLng) {
    if (null == latLng) {
      return;
    }
    print('_onMapLongPress===> ${latLng.toJson()}');
  }

  void _onMapPoiTouched(AMapPoi poi) {
    if (null == poi) {
      return;
    }
    print('_onMapPoiTouched===> ${poi.toJson()}');
  }


  //级别加1
  void _zoomIn() {
    _controller?.moveCamera(
      CameraUpdate.zoomIn(),
      animated: true,
    );
  }

  //级别减1
  void _zoomOut() {
    _controller?.moveCamera(
      CameraUpdate.zoomOut(),
      animated: true,
    );
  }
}
