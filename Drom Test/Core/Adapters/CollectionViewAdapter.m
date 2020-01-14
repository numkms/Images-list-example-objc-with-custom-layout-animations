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
      _collectionView = collectionView;
      
      [collectionView registerClass: ImageCollectionViewCell.class forCellWithReuseIdentifier:ImageCollectionViewCell.reuseIdentifier ];
      [collectionView setDataSource: self];
      [collectionView setDelegate: self];
      
      _imagesRepository = [[ImagesRepository alloc] init];
  }
  return self;
}

- (void) setUrls: (NSArray*) urls {
    _urls = urls;
    [_collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    return 1;
}
 
- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return _urls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   ImageCollectionViewCell* newCell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageCollectionViewCell.reuseIdentifier forIndexPath:indexPath];
    NSString *currentUrl = _urls[indexPath.row];
     [newCell fillBy: NULL];
     [_imagesRepository getImageBy: currentUrl completionHandler:^(NSData *array) {
           [newCell fillBy: array];
     }];
   return newCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float cellSize = collectionView.frame.size.width;
    return CGSizeMake(cellSize - 10, collectionView.frame.size.width);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *) collectionView layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger) section
{
    return 1.0;
}
 - (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
     NSMutableArray *mutableArray =  [NSMutableArray arrayWithArray:_urls];;
     [mutableArray removeObjectAtIndex: indexPath.row];
     _urls = mutableArray;
     [_collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:indexPath.row inSection:indexPath.section]]];
     
     
}

@end



