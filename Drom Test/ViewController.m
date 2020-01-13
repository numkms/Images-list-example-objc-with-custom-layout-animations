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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createCollectionView];
    
}

- (void)createCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    
    _collectionViewAdapter = [[CollectionViewAdapter alloc] initWithTableView:_collectionView];
}

@end

