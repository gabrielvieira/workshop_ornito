//
//  PageVC.h
//  RacortProject
//
//  Created by Gabriel Vieira on 03/09/14.
//  Copyright (c) 2014 Gabriel Vieira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageVC : UIViewController  <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@end
