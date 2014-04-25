//
//  DetailViewController.m
//  Open
//
//  Created by Visnu on 4/24/14.
//  Copyright (c) 2014 Visnu Pitiyanuvath. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  CGFloat hue = [[self.detailItem valueForKey:@"hue"] floatValue];
  self.view.backgroundColor = [UIColor colorWithHue:hue saturation:1 brightness:1 alpha:1];

  self.textView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}

@end
