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

@interface CollectionViewAdapter : NSObject <UICollectionViewDelegate, UICollectionViewDataSource>
@property UICollectionView *collectionView;
-(id)initWithTableView: (UICollectionView*) collectionView;
@end

#endif /* CollectionViewAdapter_h */
