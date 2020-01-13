//
//  ImageCollectionViewCell.m
//  Drom Test
//
//  Created by Владимир Курдюков on 13/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import "ImageCollectionViewCell.h"
static NSString *ReuseIdentifier = @"imageCollectionViewCell";

@implementation ImageCollectionViewCell

+ (NSString*)reuseIdentifier {
    return ReuseIdentifier;
}

+ (void)setReuseIdentifier:(NSString *)reuseIdentifier {
    
}

- (void) fillBy: (NSString*)imageUrl {
    NSLog(@"%@", imageUrl);
}

@end
