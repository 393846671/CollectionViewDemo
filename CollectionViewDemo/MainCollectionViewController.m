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

@implementation MainCollectionViewController{
    int itemCount;
}

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
    itemCount = 20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return itemCount;
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
//    NSLog(@"%s",__FUNCTION__);
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

#pragma mark- ------------------------UICollectionViewDelegate-------------------------------------
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__FUNCTION__);
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d hs highlight",[indexPath row]);
    NSLog(@"%s",__FUNCTION__);
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__FUNCTION__);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

// called when the user taps on an already-selected item in multi-select mode
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSString * msg = [NSString stringWithFormat:@"%d has been select",[indexPath row]];
//    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"notice" message:msg delegate:self cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
//    [alert show];
    itemCount++;
    [collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:[indexPath item] inSection:0]]];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    [super collectionView:collectionView didEndDisplayingCell:cell forItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSLog(@"%s",__FUNCTION__);
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    
}

// These methods provide support for copy/paste actions on cells.
// All three should be implemented if any are.
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    NSLog(@"%@",NSStringFromSelector(action));
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    
}

// support for custom transition layout
//- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout{
//    
//}

- (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath{
    NSLog(@"123");
}


- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition{
    NSLog(@"%s",__FUNCTION__);
}
@end
