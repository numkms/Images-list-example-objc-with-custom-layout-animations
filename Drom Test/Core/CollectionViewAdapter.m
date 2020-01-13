//
//  CollectionViewAdapter.m
//  Drom Test
//
//  Created by Владимир Курдюков on 13/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CollectionViewAdapter.h"
#import "ImageCollectionViewCell.h"
@implementation CollectionViewAdapter: NSObject

-(id)initWithTableView: (UICollectionView*) collectionView {
  if (self = [super init]) {
      
      NSLog(@"%@", collectionView);
      
      [collectionView registerClass: ImageCollectionViewCell.class forCellWithReuseIdentifier:ImageCollectionViewCell.reuseIdentifier ];
      
      _collectionView = collectionView;
      
      [collectionView setDataSource: self];
      [collectionView setDelegate: self];
  }
  return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    return 1;
}
 
- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   ImageCollectionViewCell* newCell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageCollectionViewCell.reuseIdentifier forIndexPath:indexPath];
    [newCell fillBy:@"http://some.url"];
   return newCell;
}

@end
