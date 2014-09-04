//
//  ProjectVC.h
//  RacortProject
//
//  Created by Polyanna Cunha on 04/09/14.
//  Copyright (c) 2014 Polyanna Cunha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property IBOutlet UITableView* tableView;
- (IBAction)txt:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end
