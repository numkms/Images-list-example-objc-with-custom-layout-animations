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

@synthesize imageView = _imageView;

- (UIImageView*)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame: CGRectZero];
        
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:_imageView];
        
        NSLayoutConstraint *trailing =[NSLayoutConstraint
                                        constraintWithItem:_imageView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0f
                                        constant:0.f];
        NSLayoutConstraint *leading = [NSLayoutConstraint
                                           constraintWithItem:_imageView
                                           attribute:NSLayoutAttributeLeading
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.contentView
                                           attribute:NSLayoutAttributeLeading
                                           multiplier:1.0f
                                           constant:0.f];
        
        NSLayoutConstraint *bottom =[NSLayoutConstraint
                                         constraintWithItem:_imageView
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationEqual
                                         toItem:self.contentView
                                         attribute:NSLayoutAttributeBottom
                                         multiplier:1.0f
                                         constant:0.f];
        
        NSLayoutConstraint *top =[NSLayoutConstraint
                                        constraintWithItem:_imageView
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                        attribute:NSLayoutAttributeTop
                                        multiplier:1.0f
                                        constant:0.f];
        
        [self.contentView addConstraint:trailing];
        [self.contentView addConstraint:bottom];
        [self.contentView addConstraint:leading];
        [self.contentView addConstraint:top];
    }
    
    return _imageView;
}
+ (NSString*)reuseIdentifier {
    return ReuseIdentifier;
}


+ (void)setReuseIdentifier:(NSString *)reuseIdentifier {
    
}

- (void) fillBy: (NSString*)imageUrl {
    self.backgroundColor = UIColor.grayColor;
    [self.imageView setImage: UIImage.addImage];
}

@end
