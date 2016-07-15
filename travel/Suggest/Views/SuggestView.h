//
//  SuggestView.h
//  travel
//
//  Created by 叶慧伟 on 16/5/25.
//  Copyright © 2016年 叶慧伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestView : UIView

@property (nonatomic, copy)void(^moveBlock)(CGFloat offetY);
@property (nonatomic, copy)void(^pushBlock)(NSIndexPath *index);

@end
