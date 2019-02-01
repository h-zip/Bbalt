//
//  Test2Cell.h
//  Bbalt
//
//  Created by bory on 2019/1/28.
//  Copyright © 2019年 hans. All rights reserved.
//

#import "JHTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface Test2Cell : JHTableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *mTF;

@end

NS_ASSUME_NONNULL_END
