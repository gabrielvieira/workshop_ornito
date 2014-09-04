//
//  GroupVC.h
//  RacortProject
//
//  Created by Gabriel Vieira on 04/09/14.
//  Copyright (c) 2014 Gabriel Vieira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
- (IBAction)txt:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@end
