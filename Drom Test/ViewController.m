//
//  ViewController.m
//  Drom Test
//
//  Created by Владимир Курдюков on 13/01/2020.
//  Copyright © 2020 Numkms. All rights reserved.
//

#import "ViewController.h"
#import "Core/Adapters/CollectionViewAdapter.h"
#import "Core/Service/ImagesRepository.h"
#import "Views/Layout/ImagesCollectionViewLayout.h"

@interface ViewController ()

@property CollectionViewAdapter *collectionViewAdapter;
@property UICollectionView *collectionView;
@property ImagesRepository *imagesRepository;
@property (nonatomic, strong) UIRefreshControl* refreshControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Животные";
    
    [self createCollectionView];
    
}

- (void)createCollectionView {
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                         action:@selector(refreshCollectionView)
                         forControlEvents:UIControlEventValueChanged
    ];
    
    UICollectionViewFlowLayout *layout = [[ImagesCollectionViewLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    _collectionView.backgroundColor = UIColor.whiteColor;
    _collectionView.alwaysBounceVertical = YES;

    [_collectionView addSubview: [self refreshControl]];
    [self.view addSubview:_collectionView];

    _collectionViewAdapter = [[CollectionViewAdapter alloc] initWithTableView:_collectionView];
    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;

    
    [self reloadImages];
    
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

- (void) reloadImages {
    //6 картинок
    NSArray *images = [NSArray arrayWithObjects:
                       @"https://i.ytimg.com/vi/G569uHzxRD4/maxresdefault.jpg",
                       @"https://mymodernmet.com/wp/wp-content/uploads/2019/08/photo-manipulation-animals-ronald-ong-6.jpg",
                       @"https://media.4-paws.org/c/8/d/1/c8d144f4bf7df97ae51492de7216297cedcbd952/VP0175078-1936x1339-1920x1328.jpg",
                       @"https://d31j74p4lpxrfp.cloudfront.net/sites/default/files/styles/mobile_large_image/public/int_files/cat_in_cage_at_cat_shelter_in_indonesia.jpg?itok=71i5zWtC",
                       @"https://www.nationalgeographic.com/content/dam/animals/2019/12/wildlife-wins-losses/wildlife-wins-losses-nationalgeographic_2188826.adapt.885.1.jpg",
                       @"https://images.theconversation.com/files/285143/original/file-20190722-11355-1peled7.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip",
                       nil
    ];
    [_collectionViewAdapter setUrls:images];
}

- (void) refreshCollectionView {
    [_collectionViewAdapter setUrls:[NSArray alloc]];
    [self reloadImages];
    [_collectionViewAdapter.imagesRepository.cache flush];
    [self.refreshControl endRefreshing];
}

@end

