//
//  LinearLayout.m
//  TestCollectionView
//
//  Created by PAWAN POUDEL on 2/13/13.
//  Copyright (c) 2013 Mobile Defense Inc. All rights reserved.
//

#import "LinearLayout.h"

@implementation LinearLayout

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

@end