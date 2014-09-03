//
//  ViewController.h
//  RacortProject
//
//  Created by Polyanna Cunha on 03/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeVC.h"
#import "Single.h"

@interface ViewController : UIViewController
- (IBAction)loginButton:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UITextField *userTextBox;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextBox;

@end
