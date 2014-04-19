//
//  MSScrollViewController.m
//  AutoScroll
//
//  Created by Mayank on 3/10/14.
//  Copyright (c) 2014 Mayank Sanganeria. All rights reserved.
//

#import "MSScrollViewController.h"
#import "MSAutoScroll.h"

@interface MSScrollViewController ()
{
    MSAutoScroll *_autoScroll;
}
@end

@implementation MSScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _autoScroll = [[MSAutoScroll alloc] init];
    [_autoScroll initializeWithScrollView:self.textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
