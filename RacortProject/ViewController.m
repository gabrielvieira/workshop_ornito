//
//  ViewController.m
//  RacortProject
//
//  Created by Polyanna Cunha on 03/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "WebService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self userTextBox]resignFirstResponder];

}


- (IBAction)loginButton:(id)sender {
    
    Single* user = [Single alloc];
    [user setUserName:[[self userTextBox]text]];
    
    [self performSegueWithIdentifier:@"nextView" sender:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"nextView"]) {
        TabBarController* tabBarController = [[TabBarController alloc]init];
        [[tabBarController tabBar]setTintColor:[UIColor colorWithRed:60 green:173 blue:148 alpha:1]];
    }
}

@end
