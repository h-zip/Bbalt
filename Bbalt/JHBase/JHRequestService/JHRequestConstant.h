//
//  JHRequestConstant.h
//  Xinxy
//
//  Created by bory on 2018/5/4.
//  Copyright © 2018年 hans. All rights reserved.
//

#ifndef JHRequestConstant_h
#define JHRequestConstant_h

extern NSString* requestHost;
#define CombileUrl(url) [NSString stringWithFormat:@"%@%@",requestHost,url]
#define CombileUrlWithArgs(apiUrl,arg...) [NSString stringWithFormat:CombileUrl(apiUrl),arg]

#define DevelopHost @"http://106.14.18.199:28001"
#define ProductHost @"http://appapitest.yinchtv.com"

#endif /* JHRequestConstant_h */
