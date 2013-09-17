//
//  ViewController.h
//  testTranslate
//
//  Created by apple on 13-4-25.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookView.h"


@interface ViewController : UIViewController<BookViewDelegate, BookDataSource>
{
    NSArray *dataAry;
    BookView *bookView;
}


@end
