//
//  OWSpaceDataViewController.m
//  Out of this World
//
//  Created by Reilly ODonnell on 3/31/14.
//  Copyright (c) 2014 Reilly ODonnell. All rights reserved.
//

#import "OWSpaceDataViewController.h"

@interface OWSpaceDataViewController ()

@end

@implementation OWSpaceDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor  = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIT

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath: indexPath];
    
    switch (indexPath.row)
    {
        case 0:
        cell.textLabel.text = @"Nickname: ";
        cell.detailTextLabel.text = self.spaceObject.nickname;
        break;
        case 1:
            cell.textLabel.text = @"Diameter (km):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.diameter];
            break;
        case 2:
            cell.textLabel.text = @"Length of Year (days):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.yearLength];
            break;
        case 3:
            cell.textLabel.text = @"Gratational Force: ";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.gravitationalForce];
            break;
        case 4:
            cell.textLabel.text = @"Day Length: ";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.dayLength];
            break;
        case 5:
            cell.textLabel.text = @"Temp (c): ";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.spaceObject.temperature];
            break;
        case 6:
            cell.textLabel.text = @"Number of Moons: ";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i",self.spaceObject.numberOfMoons];
            break;
        case 7:
            cell.textLabel.text = @"Interesting Fact: ";
            cell.detailTextLabel.text = self.spaceObject.interestingFact;
            break;
        default:
            break;
            

        
    }
    return cell;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
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

@end
