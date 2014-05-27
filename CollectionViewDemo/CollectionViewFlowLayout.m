//
//  CollectionViewFlowLayout.m
//  CollectionViewDemo
//
//  Created by maolin on 14-4-24.
//  Copyright (c) 2014年 maolin. All rights reserved.
//

#import "CollectionViewFlowLayout.h"
#import "DecorationView.h"

@implementation CollectionViewFlowLayout
-(instancetype)init{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(100.0f, 100.0f);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(0.0f, 0.0, 50.0f, 0.0);   //it's up left down right
        self.minimumLineSpacing = 50.0;
    }
    return self;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)decorationViewKind atIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%s",__FUNCTION__);
    
    UICollectionViewLayoutAttributes* att = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    
    
    att.frame=CGRectMake(0.0f,0.0f,320.0f,100.0f*indexPath.row);
    
    att.zIndex=-1;
    
    
    return att;
    
    
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"rect ,x%f,y%f,width%f,height%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    [self registerClass:[DecorationView class] forDecorationViewOfKind:@"haha"];
    NSMutableArray * array = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    NSMutableArray * temp = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes * atts in array) {
//        int x = (int)[atts.indexPath row];
//        atts.frame = CGRectMake(x%3 * 120.0f, x*40.0f, 100.0f, x*40.0f);
        [temp addObject:[self layoutAttributesForDecorationViewOfKind:@"haha"atIndexPath:atts.indexPath]];
    }
    [array addObjectsFromArray:temp];
    
    //把Decoration View的布局加入可见区域布局。
    
    return array;
    
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
//    NSLog(@"%s",__FUNCTION__);
    BOOL flag = [super shouldInvalidateLayoutForBoundsChange:newBounds];
    return flag;
}

- (void)prepareForCollectionViewUpdates:(NSArray *)updateItems{
//    [super prepareForCollectionViewUpdates:updateItems];
    NSLog(@"prepareViewUpdates");
}

-(void)prepareLayout{
    [super prepareLayout];
}

- (void)prepareForTransitionToLayout:(UICollectionViewLayout*)newLayout{
    newLayout = nil;
    NSLog(@"%s",__FUNCTION__);
}
- (void)prepareForAnimatedBoundsChange:(CGRect)oldBounds{
    NSLog(@"%s",__FUNCTION__);
}
- (void)finalizeAnimatedBoundsChange{
}
- (void)finalizeCollectionViewUpdates{

}
- (void)prepareForTransitionFromLayout:(UICollectionViewLayout*)oldLayout{
    
}
- (void)finalizeLayoutTransition {}
@end
