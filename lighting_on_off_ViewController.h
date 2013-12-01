//
//  ViewController.h
//  Sample0
//
//  Created by e115766 on 2013/12/01.
//  Copyright (c) 2013年 e115766. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *background;

- (IBAction)button0:(id)sender;

@end

@interface Light : NSObject
- (id)initLight:(UIView *)bg;
- (void)switched;
@end

@interface switchLight : NSObject

- (id)initSwitch:(Light *)light;
- (void)light_on_off;

@end



/* 以下、点滅も勉強中です。次回のスプリントでしっかりと実装します。
 * 以下は触る必要なし。
@interface BlinkingLight : switchLight

- (id)initLight:(UIView *)bg;
- (void)blinking:(NSTimer *)timer;

@end
*/