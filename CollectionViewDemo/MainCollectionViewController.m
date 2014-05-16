//
//  MainCollectionViewController.m
//  CollectionViewDemo
//
//  Created by maolin on 14-4-24.
//  Copyright (c) 2014年 maolin. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "SupplementaryView.h"

@interface MainCollectionViewController ()

@end

@implementation MainCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [((UICollectionView *)self.view) setCollectionViewLayout:<#(UICollectionViewLayout *)#> animated:YES completion:^(BOOL finished){
//        
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    });
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.03f*[indexPath row] green:.04f*[indexPath row] blue:0.08f*[indexPath row] alpha:1.0f];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [collectionView registerClass:[SupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SupplementaryView"];
        [collectionView registerClass:[SupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SupplementaryView"];
    });
    
    UICollectionReusableView * supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SupplementaryView" forIndexPath:indexPath];
    NSLog(@"%s",__FUNCTION__);
    return supplementaryView;
}

//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    float width = indexPath.row*50.0f > collectionView.frame.size.width ? collectionView.frame.size.width : indexPath.row*50.0f;
//    float height = indexPath.row * 50.0f > collectionView.frame.size.width ? collectionView.frame.size.width : indexPath.row * 50.0f;
//    return CGSizeMake(width,height);
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    float lineSpace = 0.f;
    if (section == 0) {
        lineSpace = 30.f;
    }else if (section == 1) {
        lineSpace = 50.f;
    }else {
        lineSpace = 0.f;
    }
    return lineSpace;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    float itemSpace = 0.f;
    if (section == 0) {
        itemSpace = 10.f;
    }else if (section == 1) {
        itemSpace = 10.f;
    }else {
        itemSpace = 20.f;
    }
    return itemSpace;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(collectionView.frame.size.width, 140.0f);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(collectionView.frame.size.width, 140.0f);
}


@end
