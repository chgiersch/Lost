//
//  ViewController.m
//  Lost
//
//  Created by Chris Giersch on 1/27/15.
//  Copyright (c) 2015 ChrisGiersch. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSManagedObjectContext *context;
@property NSArray *lostPersonsArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    AppDelegate *delegate = [[UIApplication sharedApplication] delegate]; // Create instance of AppDelegate
    self.context = delegate.managedObjectContext;                         // Grab access (through calling self.context) to ManagedObjectContext in the AppDelegate
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"dataImported"])
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"lost" ofType:@"plist"];
        NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in plistArray)
        {
            NSManagedObject *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.context];
            [person setValue:dict[@"actor"] forKey:@"nameActor"];
            [person setValue:dict[@"passenger"] forKey:@"namePassenger"];

        }
        [defaults setObject:@"OK" forKey:@"dataImported"];
        [defaults synchronize];
        
        [self.context save:nil];
    }

    [self load];
}

- (void)load
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Person"];                 // Create request for created entity
//    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES]; // Create sortDescriptor sorting by name in asceding order
//    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"prowess" ascending:YES]; // Create sortDescriptor sorting by prowess in asceding order
//    request.sortDescriptors = [NSArray arrayWithObjects:sortDescriptor2, sortDescriptor1, nil];       // Create array of new sortDescriptors and set to request's sortDescriptor array
//
//    request.predicate = [NSPredicate predicateWithFormat:@"prowess >= 5 && prowess < 9"];             // Add predicate "filter"

    self.lostPersonsArray = [self.context executeFetchRequest:request error:nil];             // Fetch entity with created request(now sorted) and set to Warriors array (without sort descriptors, the request will fetch sorted by created date)

    [self.tableView reloadData];                                                      // Load new data into table view
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lostPersonsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSManagedObject *person = self.lostPersonsArray[indexPath.row];
    cell.textLabel.text = [person valueForKey:@"namePassenger"];
    return cell;
}

@end
