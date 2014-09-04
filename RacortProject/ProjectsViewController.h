//
//  ProjectsViewController.h
//  RacortProject
//
//  Created by Polyanna Cunha on 04/09/14.
//  Copyright (c) 2014 Polyanna Cunha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
@interface ProjectsViewController : UIViewController



@property (weak, nonatomic) IBOutlet UILabel *prepTimeLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTextView;



@property (nonatomic, strong) Recipe *recipe;
- (IBAction)backButton:(id)sender;

@end
