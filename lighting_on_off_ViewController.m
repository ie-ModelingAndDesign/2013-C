//
//  ViewController.m
//  Sample0
//
//  Created by e115766 on 2013/12/01.
//  Copyright (c) 2013年 e115766. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/* 実機が無いため、ライトの代わりに背景色を使用しています。
 */

@implementation ViewController
{
    // ライトデバイスのインスタンス変数（現在は、ライトの代わりに背景色に関するデバイス）
    id _light;
    
    // 点灯および消灯を行うクラス
    id _lightSwitch;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _light = [[Light alloc] initLight:self.background];
    _lightSwitch = [[switchLight alloc] initSwitch:_light];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ボタンが押されるとこのメソッドが呼ばれます。
- (IBAction)button0:(id)sender {
    [_lightSwitch light_on_off];
}

@end

/* Lightクラス
 * 便宜上作成しました。
 * 今回のコードでは、背景色を変更するメソッドが入っていますが、本来は実際のライトを扱うクラスです。
 */
@implementation Light
{
    int _on_off;
    UIView *_bg;
}

/* Lightクラスイニシャライザ
 * 戻り値：id　引数：(UIView *) bg
 * 背景色を扱う、UIViewインスタンスを引数としてとり、インスタンス変数に代入します。
 *******他の言語でいうところのコンストラクタにあたります。init()関数をオーバーライドしてつくります。*******
 */
- (id)initLight:(UIView *)bg{
    self = [self init];
    _bg = bg;
    
    return self;
}

/* 関数名:switched()
 * 戻り値：なし　引数：なし
 * この関数を呼び出すことでライトの点灯消灯ができます。
 * 消灯時は点灯を、点灯時は消灯を行います。（背景色が白黒かわります。）
 */
- (void)switched{
    // UIColor は色を扱うためのクラスです。
    UIColor *color;
    
    // 現在のライトの状態により、点灯もしくは消灯を行います。
    if (_on_off == 0){
        color = [UIColor whiteColor];
        _on_off = 1;
        NSLog(@"点灯");
    }
    else {
        color = [UIColor blackColor];
        _on_off = 0;
        NSLog(@"消灯");
    }
    
    _bg.backgroundColor = color;
}
@end

/* switchLightクラス
 * 点灯/消灯クラスにあたります。またONクラスにもあたります。（クラス図にフィードバック修正が必要と思われます）
 */
@implementation switchLight
{
    // Lightクラスを直接扱うための変数
    Light *_light;
}

/* switchLightクラスイニシャライザ
 * 戻り値：id　引数：(Light *) light
 * ライトのデバイス(今回の場合はLightクラス)を扱うための変数を引数とし、インスタンス変数に代入。
 */
- (id)initSwitch:(Light *)light{
    self = [super init];
    _light = light;
    return (self);
}

/* 関数名：lighting()
 * 戻り値：なし　引数：なし
 * ライトのスイッチを押します。
 */
- (void)light_on_off{
    [_light switched];
}
@end

/* 以下、点滅も勉強中です。次回のスプリントでしっかりと実装します。
 * 以下は触る必要なし。
@implementation BlinkingLight
{
    NSTimer *_timer;
}

- (id)initLight:(UIView *)bg{
    self = [super initLight:bg];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                              target:self
                                            selector:@selector(blinking:)
                                            userInfo:nil
                                             repeats:YES];
    
    return (self);
}

- (void)blinking:(NSTimer *)timer{
    [self lighting];
}

@end
 */
