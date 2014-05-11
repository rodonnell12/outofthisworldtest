//
//  OWSpaceImageViewController.h
//  Out of this World
//
//  Created by Reilly ODonnell on 3/16/14.
//  Copyright (c) 2014 Reilly ODonnell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"


@interface OWSpaceImageViewController : UIViewController <UIScrollViewDelegate>



@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) OWSpaceObject *spaceObject;




@end
