//
//  ImageCollectionViewCell.h
//  Drom Test
//
//  Created by Владимир Курдюков on 13/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageCollectionViewCell : UICollectionViewCell

@property (class, nonatomic, copy) NSString *reuseIdentifier;
- (void) fillBy: (NSString*)imageUrl;
@end

NS_ASSUME_NONNULL_END
