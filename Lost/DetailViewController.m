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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@property BOOL isEditing;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.isEditing = YES;
    
    [self populatePersonDetails];
}


- (IBAction)onDoneButtonPressed:(UIBarButtonItem *)sender
{
//    if (self)// segue identifier == EditSegue)
//    {
//        [self.object setValue:self.passengerTextField.text forKey:@"namePassenger"];
//        [self.object setValue:self.actorTextField.text forKey:@"nameActor"];
//        [self.object setValue:self.ageTextField.text forKey:@"age"];
//        [self.object setValue:self.seatTextField.text forKey:@"planeSeat"];
//        [self.object setValue:self.hairTextField.text forKey:@"hairColor"];
//        //[self.object setValue:self.imageView forKey:@"imageURLString"];
//
//        [self.object.managedObjectContext save:nil];
//    }
//    else // segue identifier == AddSegue
    {
        NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.context];
        [person setValue:self.passengerTextField.text forKey:@"namePassenger"];
        [person setValue:self.actorTextField.text forKey:@"nameActor"];
        [person setValue:self.ageTextField.text forKey:@"age"];
        [person setValue:self.seatTextField.text forKey:@"planeSeat"];
        [person setValue:self.hairTextField.text forKey:@"hairColor"];
        //[person setValue:self.imageView forKey:@"imageURLString"];

        [person.managedObjectContext save:nil];
    }

    if (self.isEditing)
    {
//        [self.editButton setTitle:@"Done" forState:UIControlStateNormal];

    }
    else
    {
//        [self.editButton setTitle:@"Done" forState:UIControlStateNormal];


    }
}




- (void)populatePersonDetails
{
    {
        self.passengerTextField.text = [self.object valueForKey:@"namePassenger"];
        self.actorTextField.text = [self.object valueForKey:@"nameActor"];
        self.ageTextField.text = [self.object valueForKey:@"age"];
        self.seatTextField.text = [self.object valueForKey:@"planeSeat"];
        self.hairTextField.text = [self.object valueForKey:@"hairColor"];
        //self.imageView = [UIImage image][self.object valueForKey:@"imageURLString"];
    }


}


@end
