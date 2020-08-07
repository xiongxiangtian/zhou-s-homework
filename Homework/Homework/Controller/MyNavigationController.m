/**
* @功能描述：自定义返回按钮
* @创建时间：2020-8-7
* @创建人：祖文渝
* @备注:
*/

#import "MyNavigationController.h"

@interface MyNavigationController () <UINavigationBarDelegate>

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [backItem setTintColor:[UIColor whiteColor]];
    item.backBarButtonItem = backItem;
    return YES;
}
@end
