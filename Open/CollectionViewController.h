//
//  CollectionViewController.h
//  Open
//
//  Created by Visnu on 4/25/14.
//  Copyright (c) 2014 Visnu Pitiyanuvath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UICollectionViewController <UIScrollViewDelegate>

@property (weak, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end
