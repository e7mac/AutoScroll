//
//  MSTableViewController.h
//  AutoScroll
//
//  Created by Mayank on 3/10/14.
//  Copyright (c) 2014 Mayank Sanganeria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface MSTableViewController : UITableViewController

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) CADisplayLink *motionDisplayLink;

@end
