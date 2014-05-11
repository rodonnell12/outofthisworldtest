//
//  OWOuterSpaceTableViewController.h
//  Out of this World
//
//  Created by Reilly ODonnell on 3/8/14.
//  Copyright (c) 2014 Reilly ODonnell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWAddSpaceObjectViewController.h"

@interface OWOuterSpaceTableViewController : UITableViewController <OWAddSpaceObjectViewControllerDeletgate>



@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;
@end
