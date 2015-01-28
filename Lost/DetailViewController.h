//
//  DetailViewController.h
//  Lost
//
//  Created by Clint Chilcott on 1/27/15.
//  Copyright (c) 2015 ChrisGiersch. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property NSManagedObjectContext *context;
@property NSManagedObject *object;
@end
