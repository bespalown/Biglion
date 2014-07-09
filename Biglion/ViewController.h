//
//  ViewController.h
//  Biglion
//
//  Created by Viktor Bespalov on 09/07/14.
//  Copyright (c) 2014 bespalown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//public
@property (nonatomic, strong) NSString* imageString;
@property (nonatomic, strong) NSString* titleString;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *detailTitle;

@end
