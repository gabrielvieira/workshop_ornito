//
//  RecipeDetailViewController.h
//  RecipeApp
//
//  Created by Simon on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"
#import "Group.h"

@interface RecipeDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *lugar;
@property (weak, nonatomic) IBOutlet UILabel *horario;

- (IBAction)backButton:(id)sender;

@property Group *grupo;

@end
