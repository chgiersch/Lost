//
//  DetailViewController.m
//  Lost
//
//  Created by Clint Chilcott on 1/27/15.
//  Copyright (c) 2015 ChrisGiersch. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passengerTextField;
@property (weak, nonatomic) IBOutlet UITextField *actorTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *seatTextField;
@property (weak, nonatomic) IBOutlet UITextField *hairTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self populatePersonDetails];

    
}



- (void)idunno
{

    [self.object setValue:self.passengerTextField.text forKey:@"namePassenger"];
    [self.object setValue:self.actorTextField.text forKey:@"nameActor"];
    [self.object setValue:self.ageTextField.text forKey:@"age"];
    [self.object setValue:self.seatTextField.text forKey:@"planeSeat"];
    [self.object setValue:self.hairTextField.text forKey:@"hairColor"];
    //[self.object setValue:self.imageView forKey:@"imageURLString"];
    
    [self.object.managedObjectContext save:nil];

    
}




- (void)populatePersonDetails
{

    self.passengerTextField.text = [self.object valueForKey:@"namePassenger"];
    self.actorTextField.text = [self.object valueForKey:@"nameActor"];
    self.ageTextField.text = [self.object valueForKey:@"age"];
    self.seatTextField.text = [self.object valueForKey:@"planeSeat"];
    self.hairTextField.text = [self.object valueForKey:@"hairColor"];
    //self.imageView = [UIImage image][self.object valueForKey:@"imageURLString"];
    
}


@end
