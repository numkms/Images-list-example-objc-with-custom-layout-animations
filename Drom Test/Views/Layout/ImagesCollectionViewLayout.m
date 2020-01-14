//
//  ImagesCollectionViewLayout.m
//  Drom Test
//
//  Created by Владимир Курдюков on 15/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImagesCollectionViewLayout.h"

@implementation ImagesCollectionViewLayout

- (UICollectionViewLayoutAttributes*)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    if ([_indexPathsToAnimate containsObject:itemIndexPath]) {
        attr.center = CGPointMake(attr.center.x + self.collectionView.bounds.size.width, attr.center.y);
        attr.zIndex = 1;
        [_indexPathsToAnimate removeObject:itemIndexPath];
    } else {
        attr.alpha = 1.0;
    }
    
    return attr;
}

- (void)prepareForCollectionViewUpdates:(NSArray *)updateItems
{
    [super prepareForCollectionViewUpdates:updateItems];
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (UICollectionViewUpdateItem *updateItem in updateItems) {
        switch (updateItem.updateAction) {
            case UICollectionUpdateActionInsert:
                [indexPaths addObject:updateItem.indexPathAfterUpdate];
                break;
            case UICollectionUpdateActionDelete:
                [indexPaths addObject:updateItem.indexPathBeforeUpdate];
                break;
            default:
                break;
        }
    }
    
    self.indexPathsToAnimate = indexPaths;
}

@end
