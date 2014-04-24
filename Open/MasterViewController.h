//
//  MasterViewController.h
//  Open
//
//  Created by Visnu on 4/24/14.
//  Copyright (c) 2014 Visnu Pitiyanuvath. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
