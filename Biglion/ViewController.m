//
//  ViewController.m
//  Biglion
//
//  Created by Viktor Bespalov on 09/07/14.
//  Copyright (c) 2014 bespalown. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _detailTitle.text = _titleString;
    _detailTitle.contentMode = UIViewContentModeTop;
    _detailTitle.numberOfLines = 0;
    
    [_image setImageWithURL:[NSURL URLWithString:_imageString]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
