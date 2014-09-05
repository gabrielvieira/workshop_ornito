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

@interface RecipeDetailViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *lugar;
@property (weak, nonatomic) IBOutlet UILabel *horario;
@property UITextView* textArea;
- (IBAction)participar:(id)sender;

- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *novo;

@property Group *grupo;

@end
