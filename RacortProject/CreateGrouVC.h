//
//  CreateGrouVC.h
//  RacortProject
//
//  Created by Polyanna Cunha on 04/09/14.
//  Copyright (c) 2014 Polyanna Cunha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateGrouVC : UIViewController <UITextViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property UITextView* textArea;
- (IBAction)backButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *groupLocal;
@property (weak, nonatomic) IBOutlet UITextField *groupSubject;
@property (weak, nonatomic) IBOutlet UITextField *groupDuration;
@property (weak, nonatomic) IBOutlet UITextField *groupHorary;
@property (weak, nonatomic) IBOutlet UITextField *groupDate;
@property (weak, nonatomic) IBOutlet UITextField *groupContact;


@property (weak, nonatomic) IBOutlet UIButton *addGroupButton;


@end
