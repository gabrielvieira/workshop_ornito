//
//  ViewController.m
//  RacortProject
//
//  Created by Polyanna Cunha on 03/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)buttonNext:(UIButton *)sender {
    [self performSegueWithIdentifier:@"next" sender:nil];

}

- (IBAction)loginButton:(id)sender {
    
    
    //[WebService login:@"new" :@"poli" :@"1234"];
    // checar login e senha com o banco de dados
    
    
    
    HomeVC *home = [[HomeVC alloc]initWithNibName:@"HomeVC" bundle:nil];

    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    
    
    [self presentViewController:tabBarController animated:NO completion:^{
        NSLog(@"coco");
    }];
    
    
}
@end
