//
//  SimpleCell.m
//  TestCollectionView
//
//  Created by PAWAN POUDEL on 2/13/13.
//  Copyright (c) 2013 Mobile Defense Inc. All rights reserved.
//

#import "SimpleCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation SimpleCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0.0,
                                                           0.0,
                                                           frame.size.width,
                                                           frame.size.height)];
        
        _label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor underPageBackgroundColor];
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont boldSystemFontOfSize:100.0];
        _label.layer.cornerRadius = 5.0f;
        
        [self.contentView addSubview:_label];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.contentView.layer.cornerRadius = 5.0f;
        self.contentView.layer.borderWidth = 2.0f;
        self.contentView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    }
    return self;
}

@end
