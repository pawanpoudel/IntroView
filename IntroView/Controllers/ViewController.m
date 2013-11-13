//
//  ViewController.m
//  TestCollectionView
//
//  Created by PAWAN POUDEL on 2/13/13.
//  Copyright (c) 2013 Mobile Defense Inc. All rights reserved.
//

#import "ViewController.h"
#import "LinearLayout.h"
#import "SimpleCell.h"

NSString *kSimpleCellIdentifier = @"SimpleCell";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet LinearLayout *layout;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

#pragma mark - View lifecycle methods

-(void)viewDidLoad {
    [self.collectionView registerClass:[SimpleCell class]
            forCellWithReuseIdentifier:kSimpleCellIdentifier];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self adjustLayoutForOrientation:self.interfaceOrientation];
}

#pragma mark - Collection view methods

- (NSInteger)collectionView:(UICollectionView *)view
     numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SimpleCell *cell = [cv dequeueReusableCellWithReuseIdentifier:kSimpleCellIdentifier
                                                     forIndexPath:indexPath];
    
    cell.label.text = [NSString stringWithFormat:@"%d", indexPath.item];
    return cell;
}

#pragma mark - Rotation

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    [self adjustLayoutForOrientation:toInterfaceOrientation];
}

- (void)adjustLayoutForOrientation:(UIInterfaceOrientation)orientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        if (UIInterfaceOrientationIsPortrait(orientation)) {
            self.layout.sectionInset = UIEdgeInsetsMake(125.0, 135.0, 275.0, 135.0);
            self.layout.minimumLineSpacing = 270.0;
            self.layout.itemSize = CGSizeMake(500, 600);
        }
        else {
            self.layout.sectionInset = UIEdgeInsetsMake(20.0, 310.0, 200.0, 310.0);
            self.layout.minimumLineSpacing = 628.0;
            self.layout.itemSize = CGSizeMake(400, 500);
        }
    }
    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.layout.sectionInset = UIEdgeInsetsMake(25.0, 25.0, 75.0, 35.0);
        self.layout.minimumLineSpacing = 50.0;
        self.layout.itemSize = CGSizeMake(270, 370);
    }
}

#pragma mark - Scroll view delegate methods

/*
 * Note: Remember, UICollectionView is a subclass of UIScrollview.
 * So, all the scroll view delegate methods are automatically called
 */

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page control
    
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    NSInteger whichPage = lround(self.collectionView.contentOffset.x / collectionViewWidth);
    
    if (self.pageControl.currentPage != whichPage) {
		self.pageControl.currentPage = whichPage;
		
		// Update page control directly if dragging
		if (self.collectionView.dragging) {
			[self.pageControl updateCurrentPageDisplay];
        }
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.pageControl updateCurrentPageDisplay];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)aScrollView {
    [self.pageControl updateCurrentPageDisplay];
}

@end
