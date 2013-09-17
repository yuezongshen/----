//
//  BookView.h
//  testTranslate
//
//  Created by apple on 13-4-26.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGOImageButton.h"
#import <QuartzCore/QuartzCore.h>

typedef  enum
{
    kScrollStateNormol = 0,
    kScrollStateUp = 1,
    kScrollStateDown
}kScrollState;

@interface PageView : UIImageView
{
    
    UIControl *overViw;
    EGOImageButton *showImage;
    
    UILabel *storeVale;
    UILabel *origanVale;
    UILabel *comName;
    UILabel *countPeople;
    UILabel *storeTime;
    
    
    BOOL   isLastPage;
    CGFloat bettomPageHight;
}
@property (nonatomic, retain) EGOImageButton *showImage;
@property (nonatomic, readonly) UILabel *storeVale;
@property (nonatomic, readonly) UILabel *origanVale;
@property (nonatomic, readonly) UILabel *comName;
@property (nonatomic, readonly) UILabel *countPeople;
@property (nonatomic, readonly) UILabel *storeTime;

- (void)isLastPage:(BOOL)last;
- (void)setOverViewAlPha:(CGFloat)aple;

- (void)setGroupStoreValue:(NSString*)value;
- (void)setOrignalValue:(NSString*)value;
@end

@class BookView;
@protocol BookDataSource <NSObject>
@required
- (NSInteger)numberOfPages;
- (NSURL*)bookView:(BookView*)bookview pageView:(PageView*)pageView indexOfPage:(NSInteger)index;

@end

@protocol BookViewDelegate <NSObject>

- (void)bookView:(BookView*)bookview selectedIndex:(NSInteger)index;
- (void)bookView:(BookView *)bookview joinGroupStore:(NSInteger)index;

@end

@interface BookView : UIView
{
    CGFloat bettomPageHight;
    BOOL isScroll;
    kScrollState scrollStat;  //1:up    2:down
    NSInteger currentIndex;
    NSInteger countPages;
    id<BookDataSource> dataSource;
    id<BookViewDelegate> delegate;
}

@property (retain, nonatomic)  PageView *upImage;
@property (retain, nonatomic)  PageView *centerImage;
@property (retain, nonatomic)  PageView *downImage;
@property (nonatomic, assign) id<BookDataSource> dataSource;
@property (nonatomic, assign) id<BookViewDelegate> delegate;

- (void)reloadBookView;

@end
