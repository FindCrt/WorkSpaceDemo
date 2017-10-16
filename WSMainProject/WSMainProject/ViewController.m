//
//  ViewController.m
//  WSMainProject
//
//  Created by shiwei on 2017/10/16.
//  Copyright © 2017年 shiwei. All rights reserved.
//

#import "ViewController.h"
#import <WSLibraryFirst.h>
#import <UIButton+name.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *testImgViews;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //测试库的类调用
    WSLibraryFirst *libFirst = [[WSLibraryFirst alloc] init];
    [libFirst test];
    
    //测试资源加载
    UIImageView *mainAppImgView = _testImgViews.firstObject;
    mainAppImgView.image = [UIImage imageNamed:@"tree.jpg"];
    
    UIImageView *lib1ImgView = _testImgViews[1];
    NSString *lib1BundlePath = [[NSBundle mainBundle] pathForResource:@"Lib1Resource" ofType:@"bundle"];
    NSBundle *lib1Bundle = [NSBundle bundleWithPath:lib1BundlePath];
    if (lib1Bundle == nil) {
        NSLog(@"库1的bundle没加入");
    }else{
        NSString *imagePath = [lib1Bundle pathForResource:@"cabbage" ofType:@"jpg"];
        lib1ImgView.image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    }
    
    UIImageView *lib2ImgView = _testImgViews[2];
    NSString *lib2BundlePath = [[NSBundle mainBundle] pathForResource:@"Lib2Resource" ofType:@"bundle"];
    NSBundle *lib2Bundle = [NSBundle bundleWithPath:lib2BundlePath];
    if (lib2Bundle == nil) {
        NSLog(@"库1的bundle没加入");
    }else{
        NSString *imagePath = [lib2Bundle pathForResource:@"mountain" ofType:@"jpg"];
        lib2ImgView.image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    }
    
    
}


- (IBAction)testCategoryFromLibrary:(UIButton *)sender {
    //使用符号（一个空函数），是的category会被链接；或者在other linker flag内添加-ObjC,category添加的方法默认不会被链接;http://blog.csdn.net/crash163/article/details/52088096
    load_symbol_UIButton_name();
    [sender name];
}

@end
