//
//  HRTFontTableViewCell.m
//  HRTFontToolkit
//
//  Created by Hirat on 15/1/19.
//  Copyright (c) 2015年 Hirat. All rights reserved.
//

#import "HRTFontTableViewCell.h"

@implementation HRTFontTableViewCell

- (void)setFontName:(NSString *)fontName
{
    _fontName = fontName;
    
    self.textLabel.text = fontName;
    UIFont* font = [UIFont fontWithName: fontName size: [UIFont systemFontSize]];
    self.textLabel.font = font;
}

@end
