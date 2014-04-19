//
//  MSAutoScroll.h
//  AutoScroll
//
//  Created by Mayank on 3/10/14.
//  Copyright (c) 2014 Mayank Sanganeria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface MSAutoScroll : NSObject

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) CADisplayLink *motionDisplayLink;

-(void)initializeWithScrollView:(UIScrollView *)scrollView;

@end
