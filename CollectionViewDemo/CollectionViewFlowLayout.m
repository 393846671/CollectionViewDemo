//
//  CollectionViewFlowLayout.m
//  CollectionViewDemo
//
//  Created by maolin on 14-4-24.
//  Copyright (c) 2014年 maolin. All rights reserved.
//

#import "CollectionViewFlowLayout.h"

@implementation CollectionViewFlowLayout
-(instancetype)init{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(100.0f, 100.0f);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(100, 0.0, 100, 0.0);
        self.minimumLineSpacing = 50.0;
    }
    return self;
}
@end
