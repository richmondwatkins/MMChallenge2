//
//  ViewController.m
//  MMChallenge2
//
//  Created by Richmond on 10/10/14.
//  Copyright (c) 2014 Richmond. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityDetailViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *cityData;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *cities;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    City *nashville = [[City alloc]init];
    nashville.name = @"Nashville";
    nashville.state = @"Tennessee";
    nashville.image = [UIImage imageNamed:@"nashville"];
    City *memphis = [[City alloc]init];
    memphis.name = @"Memphis";
    memphis.state = @"Tennessee";
    memphis.image = [UIImage imageNamed:@"memphis"];

    City *chicago = [[City alloc]init];
    chicago.name = @"Chicago";
    chicago.state = @"Illinois";
    chicago.image = [UIImage imageNamed:@"chicago"];

    City *denver = [[City alloc]init];
    denver.name = @"Denver";
    denver.state = @"Colorado";
    denver.image = [UIImage imageNamed:@"denver"];

    self.cities = [[NSMutableArray alloc] initWithObjects:nashville, memphis, chicago, denver, nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.cities.count
    ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    City *city = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    cell.imageView.image = city.image;
    return cell;
}
- (IBAction)onEditPress:(UIBarButtonItem *)button {
    if ([self.tableView isEditing]) {
        button.title = @"Edit";
        [self.tableView setEditing:NO animated:YES];
    }else{
        button.title = @"Done";
        [self.tableView setEditing:YES animated:YES];
    }

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cities removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        CityDetailViewController *cityDetailCtrl = segue.destinationViewController;
        cityDetailCtrl.city = [self.cities objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}








@end
