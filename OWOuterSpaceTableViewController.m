//
//  OWOuterSpaceTableViewController.m
//  Out of this World
//
//  Created by Reilly ODonnell on 3/8/14.
//  Copyright (c) 2014 Reilly ODonnell. All rights reserved.
//

#import "OWOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "OWSpaceObject.h"
#import "OWSpaceImageViewController.h"
#import "OWSpaceDataViewController.h"

@interface OWOuterSpaceTableViewController ()

@end

@implementation OWOuterSpaceTableViewController

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
    

    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg",planetData[PLANET_NAME]];
        OWSpaceObject *planet = [[OWSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
              [self.planets addObject:planet];
    }

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    
    
    if ([sender isKindOfClass:[UITableView class]])
    {
        if ([segue.destinationViewController isKindOfClass:[OWSpaceImageViewController class]])
        {
            OWSpaceImageViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            OWSpaceObject *selectedObject = self.planets[path.row];
            nextViewController.spaceObject = selectedObject;
            
            
            
            
//            OWSpaceObject *selectedObject;
//            
//            if (path.section ==0){
//                selectedObject = self.planets[path.row];
//            }
//            else if (path.section ==1){
//                selectedObject = self.addedSpaceObjects[path.row];
//            }
//            
//            nextViewController.spaceObject = selectedObject;
        }
    
//    }
//    if ([sender isKindOfClass:[NSIndexPath class]])
//    {
//        if ([segue.destinationViewController isKindOfClass:[OWSpaceDataViewController class]])
//     {
//         OWSpaceDataViewController *targetViewController = segue.destinationViewController;
//         NSIndexPath *path = sender;
//         OWSpaceObject *selectedObject;
//         
//         if (path.section==0) {
//             selectedObject = self.planets[path.row];
//         }
//         else if (path.section ==1){
//             selectedObject = self.addedSpaceObjects[path.row];
//         }
//       
//         targetViewController.spaceObject = selectedObject;
//         
//     }
//    }
//    if([segue.destinationViewController isKindOfClass:[OWAddSpaceObjectViewController class]]){
//        OWAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
//        addSpaceObjectVC.delegate = self;
    }
//     NSLog(@"%@", sender);
    }

    
    



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - OWAddSpaceObjectViewController Delegate
-(void)didCancel
{
    NSLog(@"didCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addSpaceObject:(OWSpaceObject *)spaceObject
{
    if (!self.addedSpaceObjects){
        self.addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    [self.addedSpaceObjects addObject:spaceObject];
    
    NSLog(@"addSpaceObject");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if ([self.addedSpaceObjects count]){
        return 2;
        
    }
    else {
        return 1;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 1 ) {
        return [self.addedSpaceObjects count];
    }
    else {
    return [self.planets count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 1) {
            //use new space object to customize our cell
        OWSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    else {
        
    
    

    OWSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickname;
    cell.imageView.image = planet.spaceImage;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    
    return cell;
}



#pragma mark UITableViewDelegate Delegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath

{
    [self performSegueWithIdentifier:@"push to space data" sender:indexPath];
//    NSLog(@"Acessory button is working properly %i",indexPath.row);
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
