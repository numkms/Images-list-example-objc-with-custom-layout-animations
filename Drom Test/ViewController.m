//
//  ViewController.m
//  Drom Test
//
//  Created by Владимир Курдюков on 13/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import "ViewController.h"
#import "Core/CollectionViewAdapter.h"

@interface ViewController ()

@property CollectionViewAdapter *collectionViewAdapter;
@property UICollectionView *collectionView;
@end

static float CellPadding = 10;

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createCollectionView];
    
}

- (void)createCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    _collectionView.backgroundColor = UIColor.redColor;
    [self.view addSubview:_collectionView];
    
    _collectionViewAdapter = [[CollectionViewAdapter alloc] initWithTableView:_collectionView];
    
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *trailing =[NSLayoutConstraint
                                    constraintWithItem:_collectionView
                                    attribute:NSLayoutAttributeTrailing
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                    attribute:NSLayoutAttributeTrailing
                                    multiplier:1.0f
                                    constant:0.f];
    NSLayoutConstraint *leading = [NSLayoutConstraint
                                       constraintWithItem:_collectionView
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1.0f
                                       constant:0.f];
    
    NSLayoutConstraint *bottom =[NSLayoutConstraint
                                     constraintWithItem:_collectionView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                     attribute:NSLayoutAttributeBottom
                                     multiplier:1.0f
                                     constant:0.f];
    
    NSLayoutConstraint *top =[NSLayoutConstraint
                                    constraintWithItem:_collectionView
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                    attribute:NSLayoutAttributeTop
                                    multiplier:1.0f
                                    constant:0.f];
    
    [self.view addConstraint:trailing];
    [self.view addConstraint:bottom];
    [self.view addConstraint:leading];
    [self.view addConstraint:top];

}

@end

