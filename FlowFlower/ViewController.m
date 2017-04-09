//
//  ViewController.m
//  FlowFlower
//
//  Created by 夏远全 on 2017/3/29.
//  Copyright © 2017年 夏远全. All rights reserved.
//

#import "ViewController.h"
#import "FlowFlower.h"
#import "UIImage+Extension.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface ViewController ()
@property (strong,nonatomic)FlowFlower *flowFlower;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self FlyFaceImage];
}

#pragma mark - 鲜花
-(void)FlyColorImage{
   
    //#FFBF00 #038AE6 #73D0F5 #D93600 #FFFF00 #63DB59 彩片颜色值
    UIImage *image1 = [UIImage imageWithColor:UIColorFromRGB(0xFFBF00)];
    UIImage *image2 = [UIImage imageWithColor:UIColorFromRGB(0x038AE6)];
    UIImage *image3 = [UIImage imageWithColor:UIColorFromRGB(0x73D0F5)];
    UIImage *image4 = [UIImage imageWithColor:UIColorFromRGB(0xD93600)];
    UIImage *image5 = [UIImage imageWithColor:UIColorFromRGB(0xFFFF00)];
    UIImage *image6 = [UIImage imageWithColor:UIColorFromRGB(0x3DB59)];
    
    //飞行
    _flowFlower = [FlowFlower flowerFLow:@[image1,image2,image3,image4,image5,image6]];
    [_flowFlower startFlyFlowerOnView:self.view];
}


#pragma mark - 表情
-(void)FlyFaceImage{
    
    //face
    UIImage *faceImage = [UIImage imageNamed:@"face.png"];
    
    //飞行
    _flowFlower = [FlowFlower flowerFLow:@[faceImage]];
    [_flowFlower startFlyFlowerOnView:self.view];
}

@end
