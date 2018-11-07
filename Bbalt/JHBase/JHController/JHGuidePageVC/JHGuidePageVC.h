//
//  JHGuidePageVC.h
//  Test
//
//  Created by bory on 2018/5/9.
//  Copyright © 2018年 hans. All rights reserved.
//

#import "JHBaseVC.h"
#import "JHLoginVC.h"
@interface JHGuidePageVC : JHBaseVC<UIScrollViewDelegate>
@property(nonatomic,strong)NSArray* guidePages;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageCotrol;
@end
