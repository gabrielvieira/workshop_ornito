//
//  ProjectsTableViewController.m
//  RacortProject
//
//  Created by Polyanna Cunha on 04/09/14.
//  Copyright (c) 2014 Polyanna Cunha. All rights reserved.
//

#import "ProjectsTableViewController.h"

@interface ProjectsTableViewController ()

@end

@implementation ProjectsTableViewController


{
    NSMutableArray *recipes;
    NSMutableArray *searchResults;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UISearchBar *searchBar = self.searchDisplayController.searchBar;
    CGRect rect = searchBar.frame;
    rect.origin.y = 200;
    searchBar.frame = rect;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self.tableView setContentInset:UIEdgeInsetsMake(50,0,0,0)];
    recipes = [[NSMutableArray alloc]init];
    self.navigationController.navigationBarHidden = YES;
    
    NSString *c = @"";
    [self performSelectorInBackground:@selector(buscaGrupo:) withObject:c];
    // Initialize the recipes array
    
    
    //recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10, recipe11, recipe12, recipe13, recipe14, recipe15, recipe16, nil];
    
}

-(void)buscaGrupo : (NSString*) busca
{
    NSLog(@"%@" , busca);
    NSArray *d = (NSArray*)[WebService searchGroup:busca];
    for (NSDictionary *n in d) {
        Group *g = Group.new;
        g.name = [n objectForKey:@"name"];
        g.local = [n objectForKey:@"location"];
        g.horario = [n objectForKey:@"horary"] ;
        g.description = [n objectForKey:@"description"];
        g.username = [n objectForKey:@"user"];
        
        [recipes addObject:g];
        
        
    }
    
    if (self.tableView == self.searchDisplayController.searchResultsTableView) {
        [self.searchDisplayController.searchResultsTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
        
    } else {
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    }
    
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
    /*
     if (tableView == self.searchDisplayController.searchResultsTableView) {
     return [searchResults count];
     
     } else {
     return [recipes count];
     }
     */
    return [recipes count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    ProjectsTableCell *cell = (ProjectsTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[ProjectsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    Group *recipe = nil;
    
    recipe = [recipes objectAtIndex:indexPath.row];
    /*
     if (tableView == self.searchDisplayController.searchResultsTableView) {
     recipe = [searchResults objectAtIndex:indexPath.row];
     } else {
     recipe = [recipes objectAtIndex:indexPath.row];
     }
     */
    
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
        
        ProjectsViewController *destViewController = segue.destinationViewController;
        destViewController.recipe = recipe;
    }
}


//METODO PRA PESQUISAR
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [recipes removeAllObjects];
    
    NSArray *d = (NSArray*)[WebService searchGroup:searchText];
    
    NSLog(@"%@", d);
    for (NSDictionary *n in d) {
        Group *g = Group.new;
        g.name = [n objectForKey:@"name"];
        g.local = [n objectForKey:@"location"];
        g.horario = [n objectForKey:@"horary"] ;
        g.description = [n objectForKey:@"description"];
        g.username = [n objectForKey:@"user"];
        
        [recipes addObject:g];
    }
    
    [self.searchDisplayController.searchResultsTableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
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
