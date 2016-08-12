//
//  TravleMapVC.m
//  travel
//
//  Created by 叶慧伟 on 16/8/12.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "TravleMapVC.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TravleMapVC ()<MKMapViewDelegate>

@property (nonatomic, strong)MKMapView *mapView;
@property (nonatomic, strong)CLLocationManager *locationMangaer;

@end

@implementation TravleMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initMap];
}

- (void)initMap{
    self.mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.mapView];
    
    self.mapView.delegate = self;
    
    //请求定位
    self.locationMangaer = [[CLLocationManager alloc]init];
    if ([CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationMangaer requestWhenInUseAuthorization];
    }
    //用户位置追踪
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    //设置地图类型
    self.mapView.mapType = MKMapTypeStandard;
    
    //添加大头针
    [self addAnnotation];
}

- (void)addAnnotation{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
