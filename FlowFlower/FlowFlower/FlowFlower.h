//
//  FlowFlower.h
//  FlowFlower
//
//  Created by 夏远全 on 2017/3/29.
//  Copyright © 2017年 夏远全. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlowFlower : NSObject

/**
 类方法创建对象
 @param images 花图片数组
 */
+ (FlowFlower *)flowerFLow:(NSArray *)images;

/**
 启动落花
 @param view  飞行的视图区域
 */
- (void)startFlyFlowerOnView:(UIView *)view;

/**
 结束落花
 */
- (void)endFlyFlower;

@end
