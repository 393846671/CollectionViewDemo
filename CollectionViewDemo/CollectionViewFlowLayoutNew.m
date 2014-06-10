//
//  CollectionViewFlowLayoutNew.m
//  CollectionViewDemo
//
//  Created by maolin on 14-5-20.
//  Copyright (c) 2014年 maolin. All rights reserved.
//

#import "CollectionViewFlowLayoutNew.h"

@implementation CollectionViewFlowLayoutNew
-(instancetype)init{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(50.0f, 50.0f);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(0.0f, 0.0, 0.0f, 0.0);   //it's up left down right
        self.minimumLineSpacing = 50.0;
        self.enumDemo = MLOptionsEnumDemoNone;
    }
    return self;
}
@end
