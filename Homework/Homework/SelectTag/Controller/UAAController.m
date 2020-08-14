//
//  UAAController.m
//  Homework
//
//  Created by xihou damowang on 2020/8/13.
//  Copyright © 2020 夕厚大魔王. All rights reserved.
//

#import "UAAController.h"
#import "CollectionModel.h"


@interface UAAController ()

@end

@implementation UAAController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    
    
    
    /*
     
     
     NSDictionary *personDict=@{@"name":@"xiaoBai",@"age":@"25",@"sex":@"man"};
     NSArray *array = @[@"数据1",@"数据2",@"数据3",@"数据4"];

     //获取沙盒中Documents的路径
     NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];

     //设置对象归档的路径及归档文件名
     NSString *dictPath =[docPath stringByAppendingPathComponent:@"person.archiver"];//后缀名可以随意命名

     //将对象归档到指定路径
     BOOL flag1 = [NSKeyedArchiver archiveRootObject:array toFile:dictPath];

     NSString *arrayPath =[docPath stringByAppendingPathComponent:@"data.archiver"];
     BOOL flag2 = [NSKeyedArchiver archiveRootObject:dic toFile:arrayPath];
     
     
     */
    
    
    
}

- (void)setupView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *getButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 50, 50, 50)];
    [getButton setTitle:@"取" forState:UIControlStateNormal];
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 50, 50, 50)];
    [deleteButton setTitle:@"删" forState:UIControlStateNormal];
    getButton.backgroundColor = [UIColor redColor];
    deleteButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:getButton];
    [self.view addSubview:deleteButton];
    [getButton addTarget:self action:@selector(getButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    

    UIButton *UDgetButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 200, 50, 50)];
    [UDgetButton setTitle:@"取" forState:UIControlStateNormal];
    UIButton *UDdeleteButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 200, 50, 50)];
    [UDdeleteButton setTitle:@"删" forState:UIControlStateNormal];
    UDgetButton.backgroundColor = [UIColor redColor];
    UDdeleteButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:UDgetButton];
    [self.view addSubview:UDdeleteButton];
    [UDgetButton addTarget:self action:@selector(UDgetButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [UDdeleteButton addTarget:self action:@selector(UDdeleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveButtonClick {
    
}

- (NSMutableDictionary *)getButtonClick {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *dictPath = [docPath stringByAppendingPathComponent:@"123.123"];
    NSMutableDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:dictPath];
    NSArray<CollectionModel> *arr = [dict allValues];
    for(CollectionModel *model in arr) {
        NSLog(@"存有：%@", model.name);
    }
    return dict;
    
    
}

- (void)deleteButtonClick {
    NSMutableDictionary *dict = [self getButtonClick];
    [dict removeObjectForKey:@"英语四级"];
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *dictPath = [docPath stringByAppendingPathComponent:@"123.123"];
    [NSKeyedArchiver archiveRootObject:dict toFile: dictPath];
    
    
    NSArray<CollectionModel> *arr = [dict allValues];
    for(CollectionModel *model in arr) {
        NSLog(@"123存有：%@", model.name);
    }
}


- (void)UDsaveButtonClick {
    
}

- (NSMutableDictionary *)UDgetButtonClick {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSDate *data = [user objectForKey:@"selectedTags"];
    NSMutableDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    
    NSArray<CollectionModel> *arr = [dict allValues];
    for(CollectionModel *model in arr) {
        NSLog(@"存有：%@", model.name);
    }
    
    return dict;
}

- (void)UDdeleteButtonClick {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithDictionary:[self UDgetButtonClick]];
    
    [dict removeObjectForKey:@"英语四级"];
    NSDictionary *newDict = [NSDictionary dictionaryWithDictionary:dict];
    NSDate *data = [NSKeyedArchiver archivedDataWithRootObject:newDict];
    [user setObject:data forKey:@"selectedTags"];

}



-(void)setDataDic:(NSMutableDictionary *)dataDic {
//    _dataDic = dataDic;
//    NSArray *arr = _dataDic.allKeys;
//    for (int i=0; i<arr.count; i++) {
//        NSLog(@"%@",arr[i]);
//    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
