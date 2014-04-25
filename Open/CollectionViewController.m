//
//  CollectionViewController.m
//  Open
//
//  Created by Visnu on 4/25/14.
//  Copyright (c) 2014 Visnu Pitiyanuvath. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@property BOOL didInitialScroll;

@end

@implementation CollectionViewController

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];

  if (!self.didInitialScroll) {
    [self.collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    self.didInitialScroll = YES;
  }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
  return [[self.fetchedResultsController sections] count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return [[self.fetchedResultsController sections][section] numberOfObjects];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
  UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
  ((UIScrollView *)[cell.contentView.subviews firstObject]).contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
  cell.backgroundColor = [UIColor colorWithHue:[[object valueForKey:@"hue"] floatValue] saturation:1 brightness:1 alpha:1];
  return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
  NSInteger row = [scrollView contentOffset].x/scrollView.bounds.size.width;
  self.indexPath = [NSIndexPath indexPathForRow:row inSection:self.indexPath.section];
}

@end
