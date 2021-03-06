//
//  HomeVC.h
//  RacortProject
//
//  Created by Polyanna Cunha on 03/09/14.
//  Copyright (c) 2014 Polyanna Cunha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Single.h"
@interface HomeVC : UIViewController
@property IBOutlet UILabel* userName;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIButton *oldProjects;
@property (weak, nonatomic) IBOutlet UIButton *atualProjects;

@end
