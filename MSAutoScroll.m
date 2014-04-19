//
//  MSAutoScroll.m
//  AutoScroll
//
//  Created by Mayank on 3/10/14.
//  Copyright (c) 2014 Mayank Sanganeria. All rights reserved.
//

#import "MSAutoScroll.h"

#define SPEED 10

@interface MSAutoScroll() <UIScrollViewDelegate>
{
    float basePitch;
    CGFloat scrollSpeed;
    CGFloat previousTableViewYOffset;
    UIScrollView *_scrollView;
}
@end

@implementation MSAutoScroll

-(void)initializeWithScrollView:(UIScrollView *)scrollView
{
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.deviceMotionUpdateInterval = 0.02;  // 50 Hz
    
    self.motionDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(motionRefresh:)];
    [self.motionDisplayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    if ([self.motionManager isDeviceMotionAvailable]) {
        // to avoid using more CPU than necessary we use `CMAttitudeReferenceFrameXArbitraryZVertical`
        [self.motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXArbitraryZVertical];
    }
    _scrollView = scrollView;
    scrollView.delegate = self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    scrollSpeed = scrollView.contentOffset.y - previousTableViewYOffset;
    NSLog(@"scroll speed, %f", scrollSpeed);
    previousTableViewYOffset = scrollView.contentOffset.y;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"end");
    float baseVelocity = scrollSpeed;
    if (fabs(baseVelocity) < 1) {
        baseVelocity = 0;
    }
    NSLog(@"base velocity, %f", baseVelocity);
    float pitchOffset = baseVelocity / SPEED;
    basePitch = self.motionManager.deviceMotion.attitude.pitch - pitchOffset;
}

- (void)motionRefresh:(id)sender
{
    double yaw = self.motionManager.deviceMotion.attitude.yaw;
    double pitch = self.motionManager.deviceMotion.attitude.pitch;
    double roll = self.motionManager.deviceMotion.attitude.roll;
    
    NSLog(@"%f,%f,%f", yaw, pitch, roll);
    float v = SPEED * (pitch - basePitch);
    dispatch_async(dispatch_get_main_queue(), ^{
        CGPoint newPoint = CGPointMake(_scrollView.contentOffset.x, _scrollView.contentOffset.y + v);
        [_scrollView setContentOffset:newPoint animated:NO];
    });
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [scrollView setContentOffset:scrollView.contentOffset animated:YES];
}


@end
