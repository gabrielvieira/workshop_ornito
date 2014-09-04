//
//  ViewController.m
//  RacortProject
//
//  Created by Polyanna Cunha on 03/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "WebService.h"
#import "TabBarController.h"

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
    [[self passwordTextBox]resignFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"nextView"]) {
                
        
        //TabBarController *destViewController = segue.destinationViewController;
         [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
        
       // [[UITabBar appearance] setSelectedImageTintColor:[UIColor redColor]];
    }
}



- (IBAction)loginButton:(id)sender {
    
    Single* user = [Single alloc];
    [user setUserName:[[self userTextBox]text]];
    
    [self performSegueWithIdentifier:@"nextView" sender:nil];
    
}



@end
