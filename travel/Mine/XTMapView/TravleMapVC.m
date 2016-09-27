//
//  TravleMapVC.m
//  travel
//
//  Created by 叶慧伟 on 16/8/12.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import "TravleMapVC.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

@interface TravleMapVC ()<MAMapViewDelegate, AMapSearchDelegate>

@property (nonatomic, strong)MAMapView *mapView;
@property (nonatomic, strong)AMapSearchAPI *mapSearch;
@property (nonatomic, strong)MAPointAnnotation *myAnno;
@property (nonatomic, assign)BOOL isFirstLocation;

@end

@implementation TravleMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initMap];
}

- (void)initMap{
    
    self.mapView = [[MAMapView alloc]initWithFrame:self.view.bounds];
    self.mapView.mapType = MAMapTypeStandard;
    self.mapView.delegate = self;
    self.mapView.showsScale = YES;
    self.mapView.compassOrigin = CGPointMake(self.mapView.compassOrigin.x, 68);
    self.mapView.zoomEnabled = YES;
    self.mapView.showsUserLocation = YES;
    [self.mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    
    [self.view addSubview:self.mapView];

//    [self addAnnotation];
}

- (void)initSearch{
    self.isFirstLocation = YES;
    
    self.mapSearch = [[AMapSearchAPI alloc]init];
    self.mapSearch.delegate = self;
    
//    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc]init];
//    request.keywords = @"商场";
//    request.city = @"上海";
//    request.requireExtension = YES;
//    
//    [self.mapSearch AMapPOIKeywordsSearch:request];
    
    AMapPOIAroundSearchRequest *aroundRequest = [[AMapPOIAroundSearchRequest alloc]init];
    aroundRequest.keywords = @"商场";
    aroundRequest.location = [AMapGeoPoint locationWithLatitude:self.mapView.userLocation.location.coordinate.latitude longitude:self.mapView.userLocation.location.coordinate.longitude];
    [self.mapSearch AMapPOIAroundSearch:aroundRequest];
}

- (void)addAnnotation{
    MAPointAnnotation *annotatin = [[MAPointAnnotation alloc]init];
    annotatin.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    annotatin.title = @"方恒国际";
    annotatin.subtitle = @"阜通东大街6号";
    
    [self.mapView addAnnotation:annotatin];
}

#pragma mark --delegate--
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response{
    if (response.pois.count == 0) {
        return;
    }
    
    NSMutableArray *annos = [NSMutableArray arrayWithCapacity:response.pois.count];
    [response.pois enumerateObjectsUsingBlock:^(AMapPOI * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         MAPointAnnotation *annotatin = [[MAPointAnnotation alloc]init];
        annotatin.coordinate = CLLocationCoordinate2DMake(obj.location.latitude, obj.location.longitude);
        annotatin.title = obj.name;
        annotatin.subtitle = obj.address;
        [annos addObject:annotatin];
    }];
    [self.mapView addAnnotations:annos];
    
    //如果只有一个点，设置其为中心点
    if (annos.count == 1) {
        [self.mapView setCenterCoordinate:[annos[0] coordinate]];
    }else{
        [self.mapView showAnnotations:annos animated:NO];
    }
}

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    if (!self.isFirstLocation) {
        [self initSearch];
    }
    
    if (updatingLocation) {
        self.myAnno.coordinate = userLocation.coordinate;
        [self.mapView addAnnotation:self.myAnno];
    }
}

-  (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil) {
            annotationView = [[MAPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = NO;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorRed;
        return annotationView;
    }
    return nil;
}

- (MAPointAnnotation *)myAnno{
    if (nil == _myAnno) {
        _myAnno = [[MAPointAnnotation alloc]init];
        _myAnno.title = @"我所在的位置";
    }
    return _myAnno;
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
