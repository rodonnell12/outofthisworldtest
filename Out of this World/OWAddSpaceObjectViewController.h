//
//  OWAddSpaceObjectViewController.h
//  Out of this World
//
//  Created by Reilly ODonnell on 5/4/14.
//  Copyright (c) 2014 Reilly ODonnell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObject.h"

@protocol OWAddSpaceObjectViewControllerDeletgate <NSObject>

@required
-(void)addSpaceObject:(OWSpaceObject *)spaceObject;
-(void)didCancel;

@end


@interface OWAddSpaceObjectViewController : UIViewController


@property (weak,nonatomic) id <OWAddSpaceObjectViewControllerDeletgate> delegate;


@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)addButtonPressed:(UIButton *)sender;
@end
