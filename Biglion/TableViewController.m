//
//  TableViewController.m
//  Biglion
//
//  Created by Viktor Bespalov on 09/07/14.
//  Copyright (c) 2014 bespalown. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "Deal.h"
#import "ViewController.h"

@interface TableViewController ()
{
    NSArray* allDiscount;
    Deal* dealSelected;
}
@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
    
    NSString* urlString = @"http://api.biglion.ru/api.php?version=1.0&type=json_unescaped&method=get_deal_offer&short=1&city_id=18&active_today=1&startindex=0&quantity=36&category_id=131&rev=2.1";
    
    [self networkActivity:YES];
    [appDelegate.manager getDataFromUrlString:urlString block:^(NSArray* arr){
        [self networkActivity:NO];
        allDiscount = arr;
        [self.tableView reloadData];
    }failBlock:^(NSException* exception) {
        [self alertException:exception];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return allDiscount.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    Deal* deal = [allDiscount objectAtIndex:indexPath.row];
    cell.titleLabel.text = deal.short_name;
    cell.originalPriceLabel.text = [NSString stringWithFormat:@"%d.-",deal.original_price];
    cell.discountLabel.text = [NSString stringWithFormat:@"%d %%",deal.discount];
    [cell.image setImageWithURL:[NSURL URLWithString:deal.image]];
    cell.resultPriceLabel.text = [NSString stringWithFormat:@"%d.-", deal.original_price - deal.original_price * deal.discount/100];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    dealSelected = [allDiscount objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"segDetail" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ViewController* destination = [segue destinationViewController];
    destination.imageString = dealSelected.image;;
    destination.titleString = dealSelected.name;
}


-(void)alertException:(NSException*)exception
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:exception.name message:exception.reason delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
    [alert show];
    [self networkActivity:NO];
}

-(void)networkActivity:(BOOL)activity
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = activity;
    if (activity)
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    else
        [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
