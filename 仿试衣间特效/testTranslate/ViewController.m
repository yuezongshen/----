//
//  ViewController.m
//  testTranslate
//
//  Created by apple on 13-4-25.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

#pragma mark - BookDataSource

- (NSInteger)numberOfPages
{
    return [dataAry count];
}
- (NSURL*)bookView:(BookView*)bookview pageView:(PageView*)pageView indexOfPage:(NSInteger)index
{
    [pageView setGroupStoreValue:@"34"];
    [pageView setOrignalValue:@"545"];
    pageView.countPeople.text = @"34";
    pageView.storeTime.text = @"08:23:12";
    pageView.comName.text = @"女装v领无袖连衣裙";
    return [NSURL URLWithString:[dataAry objectAtIndex:index]];
}



#pragma mark -  BookViewDelegate 

- (void)bookView:(BookView*)bookview selectedIndex:(NSInteger)index
{
    
}

- (void)bookView:(BookView *)bookview joinGroupStore:(NSInteger)index
{
    
}

#pragma mark - lifecycle

- (void)viewDidLoad
{
    dataAry = [[NSArray alloc] initWithObjects:@"http://s.handuyishe.com/images/201304/goods_img/13844_P_1365493214494.jpg", @"http://s.handuyishe.com/images/201304/goods_img/4113_P_1365322228850.jpg",@"http://img04.taobaocdn.com/imgextra/i4/263817957/T2dB6ZXjlXXXXXXXXX_!!263817957.jpg", @"http://img02.taobaocdn.com/imgextra/i2/263817957/T22G2EXo0XXXXXXXXX_!!263817957.jpg",@"http://img02.taobaocdn.com/imgextra/i2/263817957/T2wyWSXlNaXXXXXXXX_!!263817957.jpg",nil];
    
        [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (IPhone5) {
        bookView = [[BookView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
    }
    else{
        bookView = [[BookView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    }
    bookView.dataSource = self;
    bookView.delegate = self;
    [bookView reloadBookView];
    [self.view addSubview:bookView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [super dealloc];
}
@end
