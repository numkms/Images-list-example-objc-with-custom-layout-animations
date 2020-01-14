//
//  CollectionViewAdapter.h
//  Drom Test
//
//  Created by Владимир Курдюков on 13/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#ifndef CollectionViewAdapter_h
#define CollectionViewAdapter_h

#import <Foundation/Foundation.h>
#import "ImagesRepository.h"

@interface CollectionViewAdapter : NSObject <UICollectionViewDelegate, UICollectionViewDataSource>
@property UICollectionView *collectionView;
@property NSArray *urls;
@property ImagesRepository *imagesRepository;

-(id)initWithTableView: (UICollectionView*) collectionView;
@end

#endif /* CollectionViewAdapter_h */
