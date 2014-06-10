//
//  CollectionViewFlowLayoutNew.h
//  CollectionViewDemo
//
//  Created by maolin on 14-5-20.
//  Copyright (c) 2014年 maolin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MLLayoutEnum) {
    MLLayoutEnumDefault = 0,
    MLLayoutEnumCircle = 1,
    MLLayoutEnumHight = 2
};


typedef NS_OPTIONS(NSUInteger, MLOptionsEnumDemo) {
    MLOptionsEnumDemoNone                   = 0,
    MLOptionsEnumDemoFirst                  = 1 << 0,
    MLOptionsEnumDemoSecond                 = 1 << 1,
    MLOptionsEnumDemoThird                  = 1 << 2
};

@interface CollectionViewFlowLayoutNew : UICollectionViewFlowLayout
@property(nonatomic,assign)MLOptionsEnumDemo enumDemo;
@end
