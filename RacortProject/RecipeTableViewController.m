//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Simon on 7/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "RecipeTableViewController.h"
#import "RecipeTableCell.h"
#import "RecipeDetailViewController.h"
#import "Recipe.h"
#import "Group.h"
#import "WebService.h"

@interface RecipeTableViewController ()

@end

@implementation RecipeTableViewController
{
    NSMutableArray *recipes;
    NSMutableArray *searchResults;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setContentInset:UIEdgeInsetsMake(50,0,0,0)];
    recipes = [[NSMutableArray alloc]init];
    
    
    self.navigationController.navigationBarHidden = YES;
    
    NSArray *d = (NSArray*)[WebService searchGroup:@"a"];
    for (NSDictionary *n in d) {
        Group *g = Group.new;
        g.name = [n objectForKey:@"name"];
        g.local = [n objectForKey:@"location"];
        g.horario = [n objectForKey:@"horary"] ;
        g.description = [n objectForKey:@"description"];
        g.username = [n objectForKey:@"user"];
        
        [recipes addObject:g];
    }
    // Initialize the recipes array
    
    
       //recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10, recipe11, recipe12, recipe13, recipe14, recipe15, recipe16, nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [ self.tabBarController.tabBar setHidden:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [recipes count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    RecipeTableCell *cell = (RecipeTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[RecipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    Group *recipe = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        recipe = [searchResults objectAtIndex:indexPath.row];
    } else {
        recipe = [recipes objectAtIndex:indexPath.row];
    }
    
    cell.nameLabel.text = recipe.name;
 
    cell.prepTimeLabel.text = recipe.username;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = nil;
        Recipe *recipe = nil;
        
        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            recipe = [searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            recipe = [recipes objectAtIndex:indexPath.row];
        }
        
        RecipeDetailViewController *destViewController = segue.destinationViewController;
        destViewController.recipe = recipe;
    }
}


//METODO PRA PESQUISAR
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [searchResults removeAllObjects];
    
    NSArray *d = (NSArray*)[WebService searchGroup:@"foto"];
    for (NSDictionary *n in d) {
        Group *g = Group.new;
        g.name = [n objectForKey:@"name"];
        g.local = [n objectForKey:@"location"];
        g.horario = [n objectForKey:@"horary"] ;
        g.description = [n objectForKey:@"description"];
        g.username = [n objectForKey:@"user"];
        
        [searchResults addObject:g];
    }

    
    /*
    NSLog(@"pesquiseu");
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
     */
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}


@end
