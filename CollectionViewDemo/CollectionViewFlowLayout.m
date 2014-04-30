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
    
    
    UICollectionViewLayoutAttributes* att = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    
    
    att.frame=CGRectMake(0.0f,0.0f*indexPath.row,320.0f,500.0f);
    
    att.zIndex=0;
    
    
    return att;
    
    
}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    [self registerClass:[DecorationView class] forDecorationViewOfKind:@"haha"];
    NSMutableArray* attributes = [NSMutableArray array];
    NSMutableArray * array = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    [array addObject:[self layoutAttributesForDecorationViewOfKind:@"haha"atIndexPath:[NSIndexPath]]];
    //把Decoration View的布局加入可见区域布局。
    
    for (int y=0; y<2; y++) {
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:3 inSection:y];
        
        [attributes addObject:[self layoutAttributesForDecorationViewOfKind:@"haha"atIndexPath:indexPath]];
        
    }
    
    
    for (NSInteger i=0 ; i < 2; i++) {
        
        for (NSInteger t=0; t<2; t++) {
            
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:t inSection:i];
            
            [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
            
        }
        
        
    }
    
    
    return attributes;
    
}
@end
