//
//  OWSpaceDataViewController.h
//  Out of this World
//
//  Created by Reilly ODonnell on 3/31/14.
//  Copyright (c) 2014 Reilly ODonnell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@interface OWSpaceDataViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) OWSpaceObject *spaceObject;
@end
