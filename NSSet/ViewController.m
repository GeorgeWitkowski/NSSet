//
//  ViewController.m
//  NSSet
//
//  Created by George on 18.04.2018.
//  Copyright © 2018 George Witkowski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    @autoreleasepool {
        
    //  Create NSArray, containing 30 objects. Add duplicates to array.
    NSArray* arrayWith30Objects = @[@"A1",@"A2",@"A3",@"A4",@"A5",
                                    @"A6",@"A7",@"A8",@"A9",@"A10",
                                    @"A11",@"A12",@"A13",@"A14",@"A15",
                                    @"A16",@"A17",@"A18",@"A19",@"A20",
                                    @"A7",@"A1",@"A8",@"A15",@"A1",
                                    @"A12",@"A9",@"A5",@"A3",@"A6",]; //10 duplicates
    NSLog(@"Array containing %lu objects" , [arrayWith30Objects count]);
    
    //  Use NSSet to exclude duplicates from array.
    NSSet* set = [NSSet setWithArray:arrayWith30Objects];
        NSLog(@"%lu duplicates were excluded", ([arrayWith30Objects count] % [set count]));

        
    //  Check what is faster: Create an array of 100 numbers. Check whether number 74 is contained inside an array. Transform array into NSSet and check whether number 74 is contained inside NSSet.
    
    //  Create an array of 100 numbers.
    NSMutableArray* arrayWith100Numbers= [[NSMutableArray alloc] init];
    for (int i = 1; i <= 100; i++) {
        [arrayWith100Numbers addObject:[NSNumber numberWithInteger:i]];
    }
    
    //  Checking time for array
    NSLog(@"Array takes: ");
        
    [self checkDurationFor:^{
        [arrayWith100Numbers enumerateObjectsUsingBlock:^(NSNumber*  _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
            if ([obj integerValue] == 74) {
                *stop = YES;
            }
        }];
    }];
    
    //  Checking time for set
    NSLog(@"Set takes: ");
    
    NSSet* setWith100Numbers = [NSSet setWithArray:arrayWith100Numbers];
    [self checkDurationFor:^{
        [setWith100Numbers containsObject:[NSNumber numberWithInteger:74]];
    }];
        [arrayWith100Numbers release];
    }
}

-(void) checkDurationFor:(void(^)(void))method {
    NSDate *startTime = [NSDate date];
    method();
    NSLog(@"%f seconds", -[startTime timeIntervalSinceNow]);
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
        
@end
