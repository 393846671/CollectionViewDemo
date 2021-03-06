//
//  MainCollectionViewController.m
//  CollectionViewDemo
//
//  Created by maolin on 14-4-24.
//  Copyright (c) 2014年 maolin. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "SupplementaryView.h"
#import <Crashlytics/Crashlytics.h>
#import "CollectionViewFlowLayoutNew.h"

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
    UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(chooseCell:)];
    [self.view addGestureRecognizer:longPressGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return itemCount;
    }
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
//    NSLog(@"%s",__FUNCTION__);
    return supplementaryView;
}



#pragma mark- ------------------------ UICollectionViewDelegateFlowLayout ------------------------
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
//    NSLog(@"%d hs highlight",[indexPath row]);
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
    itemCount++;
    [collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:[indexPath item] inSection:0]]];
    
//    __block UICollectionView * temp = collectionView;
//    [UIView animateWithDuration:0.5f animations:^{
//        [collectionView setCollectionViewLayout:[[CollectionViewFlowLayoutNew alloc] init] animated:YES completion:^(BOOL finished){
//            temp.backgroundColor = [UIColor whiteColor];
//        }];
//    }];
    
//    [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionBottom];
    
//    NSIndexPath * indexPathNew = [NSIndexPath indexPathForRow:5 inSection:0];
//    [collectionView moveItemAtIndexPath:indexPath toIndexPath:indexPathNew];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor = [UIColor whiteColor];
    NSLog(@"%s",__FUNCTION__);
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    
}

// These methods provide support for copy/paste actions on cells.
// All three should be implemented if any are.
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    NSLog(@"%@",NSStringFromSelector(action));
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender{
    NSLog(@"%@",sender);
}

// support for custom transition layout
//- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout{
//    
//}

- (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath{
    NSLog(@"123");
}


-(void)chooseCell:(id)sender{
    UILongPressGestureRecognizer * longPress = (UILongPressGestureRecognizer *)sender;
    UICollectionView * view = (UICollectionView *)self.collectionView;
    CGPoint location = [longPress locationInView:view];
    NSIndexPath * index = [view indexPathForItemAtPoint:location];
    
    static UIView * snapShot = nil;
    static NSIndexPath * sourceIndexPath = nil;
    UIGestureRecognizerState state = longPress.state;
    switch (state) {
        case UIGestureRecognizerStateBegan:{
            UICollectionViewCell * cell = [view cellForItemAtIndexPath:index];
            snapShot = [cell snapshotViewAfterScreenUpdates:YES];
            snapShot.center = cell.center;
            [self.collectionView addSubview:snapShot];
            [UIView animateWithDuration:0.2f animations:^{
                cell.alpha = 0.0f;
                snapShot.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
            }];
            sourceIndexPath = index;
        }break;
        case UIGestureRecognizerStateChanged:
            if (snapShot.center.x != location.x || snapShot.center.y != location.y) {
                [UIView animateWithDuration:1.2f animations:^{
                    snapShot.center = location;
                }];
            }
            if (index != nil && index.row != sourceIndexPath.row) {
                [self.collectionView moveItemAtIndexPath:sourceIndexPath toIndexPath:index];
                UICollectionViewCell * cell = [view cellForItemAtIndexPath:index];
                cell.alpha = 0.0f;
                sourceIndexPath = index;
            }
            break;
        case UIGestureRecognizerStateEnded:{
            if (index == nil) {
                index = sourceIndexPath;
            }
            __block UICollectionViewCell * cell = [view cellForItemAtIndexPath:index];
            [UIView animateWithDuration:0.5f animations:^{
                snapShot.frame = cell.frame;
//                snapShot.center = cell.center;
            }completion:^(BOOL finished){
                [snapShot removeFromSuperview];
                cell.alpha = 1.0f;
            }];
        }break;
        default:
            NSLog(@"i don't know the gesture");
            break;
    }
}
@end
