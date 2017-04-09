//
//  FlowFlower.m
//  FlowFlower
//
//  Created by 夏远全 on 2017/3/29.
//  Copyright © 2017年 夏远全. All rights reserved.
//

#import "FlowFlower.h"

@interface FlowFlower ()
/** 显示图片的视图 */
@property (strong, nonatomic) UIView *view;
/** 计时器数组 */
@property (strong, nonatomic) NSMutableArray *displayLinkArr;
/** 存放图片的字典 */
@property (strong, nonatomic) NSMutableDictionary *imageDicM;
@end

/** 显示图片的视图数组*/
static NSArray *imageArr;

@implementation FlowFlower

//类方法创建对象
+ (FlowFlower *)flowerFLow:(NSArray *)images{
    imageArr = images;
    return [[FlowFlower alloc] init];
}


//创建计时器
-(instancetype)init{
    self = [super init];
    if (self) {
        for (NSInteger i=0; i<imageArr.count; i++) {
            CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(flyAction:)];
            displayLink.frameInterval = 4+i;
            [self.imageDicM setObject:imageArr[i] forKey:[NSString stringWithFormat:@"displayLink-%ld",displayLink.frameInterval]];
            [self.displayLinkArr addObject:displayLink];
        }
    }
    return self;
}

//启动落花
- (void)startFlyFlowerOnView:(UIView *)view{
    self.view = view;
    [self.displayLinkArr enumerateObjectsUsingBlock:^(CADisplayLink *displayLink, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        });
    }];
}

//结束落花
- (void)endFlyFlower{
   
    [self.displayLinkArr enumerateObjectsUsingBlock:^(CADisplayLink *displayLink, NSUInteger idx, BOOL * _Nonnull stop) {
        [displayLink invalidate];
        displayLink = nil;
    }];
}


//处理计时器动画
- (void)flyAction:(CADisplayLink *)displayLink{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    UIImage *image = (UIImage *)[self.imageDicM objectForKey:[NSString stringWithFormat:@"displayLink-%ld",displayLink.frameInterval]];
    imageView.image = image;
    imageView.frame = CGRectMake(0, 0, image.size.width/2, image.size.height/2);
    
    CGSize viewSize = self.view.bounds.size;
    CGFloat x = arc4random_uniform(viewSize.width);
    CGFloat y = -imageView.frame.size.height;
    imageView.center = CGPointMake(x, y);
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:2 animations:^{
        CGFloat toX = arc4random_uniform(viewSize.width);
        CGFloat toY = viewSize.height + imageView.frame.size.height * 0.5;
        imageView.center = CGPointMake(toX, toY);
        imageView.alpha = 0;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}

//懒加载
-(NSMutableArray *)displayLinkArr{
    if (!_displayLinkArr) {
        _displayLinkArr = [NSMutableArray array];
    }
    return _displayLinkArr;
}
-(NSMutableDictionary *)imageDicM{
    if (!_imageDicM) {
        _imageDicM = [NSMutableDictionary dictionary];
    }
    return _imageDicM;
}

@end
