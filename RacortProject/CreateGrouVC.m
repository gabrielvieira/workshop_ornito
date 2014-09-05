//
//  CreateGrouVC.m
//  RacortProject
//
//  Created by Polyanna Cunha on 04/09/14.
//  Copyright (c) 2014 Polyanna Cunha. All rights reserved.
//

#import "CreateGrouVC.h"
#import "Group.h"
#import "Single.h"
#import "WebService.h"

@interface CreateGrouVC ()

@end

@implementation CreateGrouVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)selector:(id)sender
{
    Group* newGroup = [[Group alloc]init];
    Single* singleton = [Single alloc];
    
    [newGroup setName:[self.groupSubject text]];
    [newGroup setHorario:[self.groupHorary text]];
    [newGroup setLocal:[self.groupLocal text]];
    [newGroup setUsername:[singleton userName]];
    [newGroup setDate:[self.groupDate text]];
    [newGroup setContact:[self.groupContact text]];
    [newGroup setDescription:[self.textArea text]];
    newGroup.id_user = 2;
    
    [WebService insertGroup:newGroup];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGPoint point = CGPointMake(10,230);
    self.textArea = [self createTextAreaForActionPlan:@"" at:point];
    [[self groupDuration]setDelegate:self];
    [[self groupHorary]setDelegate:self];
    [[self groupLocal]setDelegate:self];
    [[self groupSubject]setDelegate:self];
    [[self textArea]setDelegate:self];

    // Do any additional setup after loading the view.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self groupLocal]resignFirstResponder];
    [[self groupHorary]resignFirstResponder];
    [[self groupSubject]resignFirstResponder];
    [[self groupDuration]resignFirstResponder];
    [[self textArea]resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [self.textArea setText:@""];
    return 1;
}

- (UITextView*)createTextAreaForActionPlan:(NSString*)title at:(CGPoint)origin
{
    //float height = [self createTextLabel:title at:origin];
    UITextView* textArea = [[UITextView alloc] initWithFrame:CGRectMake(origin.x, origin.y + 50, 290.0f, 100.0f)];
    [[textArea layer] setBorderWidth:1.0];
    [[textArea layer]setCornerRadius:4.0];
    [[textArea layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
    textArea.text =@"De uma pequena explicação sobre seu projeto."; // this is the default text. how to show in UI TextView.
    [textArea setFont:[UIFont systemFontOfSize:16.0f]];
    [textArea setTextColor:[UIColor lightGrayColor]];
    [textArea setDelegate:self];
    [[self view] addSubview:textArea];
    return textArea;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButton:(id)sender {
      [self.navigationController popViewControllerAnimated:YES];
}
@end
