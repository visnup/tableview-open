//
//  PageViewController.m
//  Open
//
//  Created by Visnu on 4/24/14.
//  Copyright (c) 2014 Visnu Pitiyanuvath. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()
@end

@implementation PageViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.dataSource = self;
  self.delegate = self;

  UIViewController *initial = [self viewControllerForIndexPath:self.indexPath];
  [self setViewControllers:@[ initial ] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
  NSManagedObject *object = [[self.viewControllers firstObject] valueForKey:@"detailItem"];
  self.indexPath = [self.fetchedResultsController indexPathForObject:object];
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
  NSIndexPath *indexPath = [self.fetchedResultsController indexPathForObject:[viewController valueForKey:@"detailItem"]];
  return [self viewControllerForIndexPath:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section]];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
  NSIndexPath *indexPath = [self.fetchedResultsController indexPathForObject:[viewController valueForKey:@"detailItem"]];
  return [self viewControllerForIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section]];
}

- (UIViewController *)viewControllerForIndexPath:(NSIndexPath *)indexPath
{
  @try
  {
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UIViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    [detailController setValue:object forKey:@"detailItem"];
    return detailController;
  } @catch (NSException *e) {
    return nil;
  }
}

@end
