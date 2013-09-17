//
//  BookView.m
//  testTranslate
//
//  Created by apple on 13-4-26.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BookView.h"

@implementation PageView
@synthesize showImage;
@synthesize storeVale, storeTime, origanVale, comName, countPeople;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (IPhone5) {
            bettomPageHight = 21.0;
        }
        else{
            bettomPageHight = 18.0;
        }
        self.userInteractionEnabled = YES;
        //
        showImage = [[EGOImageButton alloc] initWithFrame:CGRectMake(3, 0, frame.size.width-6, frame.size.height-105)];
        self.image = [UIImage imageNamed:@"pageBg1"];
        [self addSubview:showImage];
        //
        storeVale = [[UILabel alloc] initWithFrame:CGRectMake(18, frame.size.height-95, 180, 20)];
        storeVale.font = [UIFont boldSystemFontOfSize:17];
//        storeVale.text = @"团购价:";
        storeVale.textColor = [UIColor whiteColor];
        storeVale.backgroundColor = [UIColor clearColor];
        [self addSubview:storeVale];
        
        origanVale = [[UILabel alloc] initWithFrame:CGRectMake(18, frame.size.height-70, 180, 20)];
        origanVale.font = [UIFont systemFontOfSize:15];
//        origanVale.text = @"原价:";
        origanVale.backgroundColor = [UIColor clearColor];
        [self addSubview:origanVale];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(17, frame.size.height-78, 1, 1)];
        line.tag = 33004;
        line.backgroundColor = [UIColor colorWithRed:31.0/255 green:30.0/255 blue:40.0/255 alpha:1];
        [self addSubview:line];
        
        UIButton *joinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        joinBtn.tag = 33001;
        joinBtn.frame = CGRectMake(225, frame.size.height-90, 80, 28);
        [joinBtn setTitle:@"立即参团" forState:UIControlStateNormal];
        [self addSubview:joinBtn];
        
        countPeople = [[UILabel alloc] initWithFrame:CGRectMake(190, frame.size.height-40, 60, 16)];
        countPeople.font = [UIFont systemFontOfSize:13];
//        countPeople.text = @"324";
        countPeople.textAlignment = UITextAlignmentRight;
        countPeople.textColor = [UIColor redColor];
        countPeople.backgroundColor = [UIColor clearColor];
        [self addSubview:countPeople];
        UILabel *peopleTitle = [[UILabel alloc] initWithFrame:CGRectMake(250, frame.size.height-40, 60, 16)];
        peopleTitle.font = [UIFont systemFontOfSize:13];
        peopleTitle.tag = 33002;
        peopleTitle.text = @"人已参团";
        peopleTitle.backgroundColor = [UIColor clearColor];
        [self addSubview:peopleTitle];
        
        comName = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height-25, 175, 20)];
        comName.font = [UIFont systemFontOfSize:17];
//        comName.text = @"女装v领无袖连衣裙";
        //        origanVale = [UIColor whiteColor];
        [self addSubview:comName];
        
        UILabel *lastTime = [[UILabel alloc] initWithFrame:CGRectMake(190, frame.size.height-22, 65, 16)];
        lastTime.font = [UIFont systemFontOfSize:13];
        lastTime.text = @"剩余时间:";
        lastTime.tag = 33003;
        [self addSubview:lastTime];
        storeTime = [[UILabel alloc] initWithFrame:CGRectMake(250, frame.size.height-22, 60, 16)];
        storeTime.font = [UIFont systemFontOfSize:13];
        storeTime.text = @"09:18:03";
        storeTime.textColor = [UIColor redColor];
        [self addSubview:storeTime];
        //
        overViw = [[UIControl alloc] initWithFrame:CGRectMake(3, 0, frame.size.width, frame.size.height-5)];
        [overViw.layer setMasksToBounds:YES];
        [overViw.layer setCornerRadius:3];
        overViw.backgroundColor = [UIColor whiteColor];
        [self addSubview:overViw];
        if(!IPhone5){
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(17, frame.size.height-68, 1, 1)];
            showImage.frame = CGRectMake(3, 0, frame.size.width-6, frame.size.height-88);
            storeVale.frame = CGRectMake(18, frame.size.height-80, 180, 18);
            origanVale.frame = CGRectMake(18, frame.size.height-60, 180, 16);
            comName.frame = CGRectMake(15, frame.size.height-25, 175, 20);
            countPeople.frame = CGRectMake(190, frame.size.height-40, 60, 16);
            storeTime.frame = CGRectMake(250, frame.size.height-22, 60, 16);
            joinBtn.frame = CGRectMake(225, frame.size.height-80, 80, 28);
            peopleTitle.frame = CGRectMake(250, frame.size.height-40, 60, 16);
            lastTime.frame = CGRectMake(190, frame.size.height-22, 65, 16);
        }
        [lastTime release];
        [peopleTitle release];
        [line release];
    }
    return self;
}

- (void)setGroupStoreValue:(NSString*)value
{
    NSString *content = [NSString stringWithFormat:@"团购价: %@元", value];
    storeVale.text = content;
}
- (void)setOrignalValue:(NSString*)value
{
    NSString *content = [NSString stringWithFormat:@"原价: %@元", value];
    CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(20, 180) lineBreakMode:NSLineBreakByCharWrapping];
    origanVale.text = content;
    UIView *line = [self viewWithTag:33004];
    line.frame = CGRectMake(line.frame.origin.x, line.frame.origin.y, size.width+2, line.frame.size.height);
    
}
//加入团购
- (void)addTarget:(id)target joinSelector:(SEL)sel
{
    UIButton *joinBtn = (UIButton*)[self viewWithTag:33001];
    [joinBtn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
}
//查看详情
- (void)addTarget:(id)target detailSelector:(SEL)sel
{
    [showImage addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
}

- (void)isLastPage:(BOOL)last
{
    isLastPage = last;
    if (last) {
        showImage.frame = CGRectMake(3, 0, self.frame.size.width-6, self.frame.size.height-bettomPageHight-125);
        overViw.frame = CGRectMake(3, 0, self.frame.size.width-6, self.frame.size.height-bettomPageHight*2-4);
        self.image = [UIImage imageNamed:@"pageBg2"];
        ///
        CGFloat height = 40;
        if (!IPhone5) {
            showImage.frame = CGRectMake(3, 0, self.frame.size.width-6, self.frame.size.height-bettomPageHight-105);
            height = 35;
        }
        storeVale.frame = CGRectMake(storeVale.frame.origin.x, storeVale.frame.origin.y-height, storeVale.frame.size.width, storeVale.frame.size.height);
        origanVale.frame = CGRectMake(origanVale.frame.origin.x, origanVale.frame.origin.y-height, origanVale.frame.size.width, origanVale.frame.size.height);
        comName.frame = CGRectMake(comName.frame.origin.x, comName.frame.origin.y-height, comName.frame.size.width, comName.frame.size.height);
        countPeople.frame = CGRectMake(countPeople.frame.origin.x, countPeople.frame.origin.y-height, countPeople.frame.size.width, countPeople.frame.size.height);
        storeTime.frame = CGRectMake(storeTime.frame.origin.x, storeTime.frame.origin.y-height, storeTime.frame.size.width, storeTime.frame.size.height);
        UIView *countTitle = [self viewWithTag:33002];
        UIView *joinBtn = [self viewWithTag:33001];
        UIView *lastTime = [self viewWithTag:33003];
        UIView *line = [self viewWithTag:33004];
        countTitle.frame = CGRectMake(countTitle.frame.origin.x, countTitle.frame.origin.y-height, countTitle.frame.size.width, countTitle.frame.size.height);
        joinBtn.frame = CGRectMake(joinBtn.frame.origin.x, joinBtn.frame.origin.y-height, joinBtn.frame.size.width, joinBtn.frame.size.height);
        lastTime.frame = CGRectMake(lastTime.frame.origin.x, lastTime.frame.origin.y-height, lastTime.frame.size.width, lastTime.frame.size.height);
        line.frame = CGRectMake(line.frame.origin.x, line.frame.origin.y-height, line.frame.size.width, line.frame.size.height);
    }
    else{
        self.image = [UIImage imageNamed:@"pageBg1"];
    }
}
- (void)setOverViewAlPha:(CGFloat)aple
{
    overViw.alpha = aple;
    if (isLastPage) {
        if (aple == 1.0) {
            showImage.hidden = YES;
        }
        else{
            showImage.hidden = NO;
        }
//        overViw.frame = showImage.bounds;
    }
}

- (void)dealloc
{
    [origanVale release];
    [storeTime release];
    [storeVale release];
    [comName release];
    [countPeople release];
    [showImage release];
    [overViw release];
    [super dealloc];
}
@end

@implementation BookView
@synthesize upImage=_upImage, centerImage=_centerImage, downImage=_downImage;
@synthesize dataSource, delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (IPhone5) {
            bettomPageHight = 21.0;
        }
        else{
            bettomPageHight = 18.0;
        }
        self.backgroundColor = [UIColor colorWithRed:250.0/255 green:250.0/255 blue:250.0/255 alpha:1];
        _downImage = [[PageView alloc] initWithFrame:CGRectMake(0, bettomPageHight, frame.size.width, frame.size.height)];
//        _downImage.showImage.imageURL = [NSURL URLWithString:[dataAry objectAtIndex:2]];
        [self.downImage isLastPage:YES];
        [self addSubview:_downImage];
        
        self.centerImage = [[[PageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-bettomPageHight*2)] autorelease];
        [_centerImage addTarget:self joinSelector:@selector(joinStore)];
        [_centerImage addTarget:self detailSelector:@selector(ShowDetail)];
        [self addSubview:_centerImage];
        
        self.upImage = [[[PageView alloc] initWithFrame:CGRectMake(0, -frame.size.height+bettomPageHight*2, frame.size.width, frame.size.height-bettomPageHight*2)] autorelease];
        
        [self addSubview:_upImage];
        
        [self.upImage setOverViewAlPha:0.0];
        [self.centerImage setOverViewAlPha:0.0];
        [self.downImage setOverViewAlPha:1.0];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
        [self addGestureRecognizer:panGesture];

    }
    return self;
}

- (void)joinStore
{
    if ([delegate respondsToSelector:@selector(bookView:joinGroupStore:)]) {
        [delegate bookView:self joinGroupStore:currentIndex];
    }
}

- (void)ShowDetail
{
    if ([delegate respondsToSelector:@selector(bookView:joinGroupStore:)]) {
        [delegate bookView:self selectedIndex:currentIndex];
    }
}

- (void)tranformImage
{
    [self.centerImage setOverViewAlPha:0.0];
    self.centerImage.showImage.imageURL = [dataSource bookView:self pageView:_centerImage indexOfPage:currentIndex];
    if (currentIndex+1 < countPages) {
        self.downImage.showImage.imageURL = [dataSource bookView:self pageView:_downImage indexOfPage:currentIndex+1];
        self.downImage.hidden = NO;
    }
    else{
        self.downImage.hidden = YES;
    }
}

- (void)didPan:(UIPanGestureRecognizer *)panGesture
{
    switch (panGesture.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            isScroll = YES;
            scrollStat = kScrollStateNormol;
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            isScroll = NO;
            if (scrollStat == kScrollStateUp) {
                if (self.centerImage.frame.origin.y > -200) {//上拉高度不够，恢复到原位
                    [UIView animateWithDuration:0.2 animations:^{
                        self.centerImage.frame = CGRectMake(0, 0, self.centerImage.frame.size.width, self.frame.size.height-bettomPageHight*2);
                        [self.downImage setOverViewAlPha:1.0];
                    }];
                }
                else{//翻倒下一页
                    [UIView animateWithDuration:0.3 animations:^{
                        self.centerImage.frame = CGRectMake(0, -self.centerImage.frame.size.height, self.centerImage.frame.size.width, self.centerImage.frame.size.height);
                    }completion:^(BOOL finish){
                        currentIndex++;
                        [self performSelectorOnMainThread:@selector(tranformImage) withObject:nil waitUntilDone:NO];
                        //////
                        dispatch_time_t popTime = dispatch_time(0, 0.2);
                        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                            self.centerImage.frame = CGRectMake(0, 0, self.centerImage.frame.size.width, self.centerImage.frame.size.height);
                            if (currentIndex > 0) {
                                self.upImage.showImage.imageURL = [dataSource bookView:self pageView:_upImage indexOfPage:currentIndex-1];
                            }
                            //恢复白色背景
                            [self.downImage setOverViewAlPha:1.0];
                        });
                        
                    }];
                }
                
            }
            else if(scrollStat == kScrollStateDown){
                if (self.upImage.frame.origin.y < -300) {//下拉高度不够，恢复到原位
                    [UIView animateWithDuration:0.2 animations:^{
                        self.upImage.frame = CGRectMake(0, -self.upImage.frame.size.height, self.upImage.frame.size.width, self.upImage.frame.size.height);
                        [self.centerImage setOverViewAlPha:0.0];
                    }];
                }
                else{//翻倒上一页
                    [UIView animateWithDuration:0.3 animations:^{
                        self.upImage.frame = CGRectMake(0, 0, self.upImage.frame.size.width, self.upImage.frame.size.height);
                    }completion:^(BOOL finish){
                        //
                        currentIndex--;
                        [self performSelectorOnMainThread:@selector(tranformImage) withObject:nil waitUntilDone:NO];
                        //
                        dispatch_time_t popTime = dispatch_time(0, 0.2);
                        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                            self.upImage.frame = CGRectMake(0, -self.upImage.frame.size.height, self.upImage.frame.size.width, self.upImage.frame.size.height);
                            ///
                            if (currentIndex > 0) {
                                self.upImage.showImage.imageURL = [dataSource bookView:self pageView:_upImage indexOfPage:currentIndex-1];
                            }
                            
                        });
                        
                    }];
                }
                
            }
            scrollStat = kScrollStateNormol;
            break;
        }
        case UIGestureRecognizerStateCancelled:
        {
            isScroll = NO;
            break;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            CGFloat translation = [panGesture translationInView:self].y;
            NSLog(@"==== %f", translation);
            if (isScroll) {
                if (translation > 0 &&
                    (scrollStat == kScrollStateNormol || scrollStat == kScrollStateDown)) {//向下拉
                    if (currentIndex > 0) {
                        scrollStat = kScrollStateDown;
                        CGRect frame = CGRectMake(0, -self.upImage.frame.size.height, self.upImage.frame.size.width, self.upImage.frame.size.height);
                        frame.origin.y = frame.origin.y + translation;
                        if (frame.origin.y >= -bettomPageHight*2) {
                            frame.origin.y = -bettomPageHight*2;
                        }
                        self.upImage.frame = frame;
                        
                        [self.centerImage setOverViewAlPha:translation/self.frame.size.height];
                    }
                    
                }
                else if(translation < 0 &&
                        (scrollStat == kScrollStateNormol || scrollStat == kScrollStateUp)){//向上拉
                    if (currentIndex+1 < countPages) {
                        scrollStat = kScrollStateUp;
                        CGRect frame = CGRectMake(0, 0, self.centerImage.frame.size.width, self.centerImage.frame.size.height);
                        frame.origin.y = frame.origin.y + translation;
                        if (frame.origin.y <= -548) {
                            frame.origin.y = 548;
                        }
                        self.centerImage.frame = frame;
                        //
                        [self.downImage setOverViewAlPha:1 + translation/self.frame.size.height];
                    }
                }
            }
            break;
        }
        default:
        {
//            NSLog(@"++++++++ %d", panGesture.state);
        }
    }
    
}

- (void)dealloc
{
    [_upImage release];
    [_centerImage release];
    [_downImage release];
    [super dealloc];
}

#pragma mark- load data mothd
- (void)reloadBookView
{
    countPages = [dataSource numberOfPages];
    if (countPages > 0) {
        self.centerImage.showImage.imageURL = [dataSource bookView:self pageView:_centerImage indexOfPage:0];
    }
    if (countPages > 1) {
        self.downImage.showImage.imageURL = [dataSource bookView:self pageView:_downImage indexOfPage:1];
    }
}
@end
