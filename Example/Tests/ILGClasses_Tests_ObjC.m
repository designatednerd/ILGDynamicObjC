//
//  ILGClasses_Tests_ObjC.m
//  ILGDynamicObjC
//
//  Created by Ellen Shapiro on 2/25/16.
//  Copyright © 2016 Isaac Greenspan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ILGClasses.h"

#import "ILGAppDelegate.h"
#import "ILGViewController.h"
#import "ILGParentProtocol.h"
#import "ILGParentClass.h"
#import "ILGChildClass1.h"
#import "ILGChildClass2.h"
#import "ILGChildClass3.h"
#import "ILGGrandchildClass1.h"

@interface ILGClasses()
// "Public" for testing only
+ (BOOL)class:(Class)classToCheck orAnyOfItsSuperclassesPassesTest:(ILGClassesClassTestBlock)test;

@end

@interface ILGClasses_Tests_ObjC : XCTestCase

@end

@implementation ILGClasses_Tests_ObjC

#pragma mark - Generic passing test tests

- (void)testNonIncludedTestWorks
{
    NSSet *expectedClasses = [NSSet setWithArray:@[
                                                   [ILGChildClass1 class],
                                                   [ILGGrandchildClass1 class],
                                                   ]];
    
    NSSet *retrievedClasses = [ILGClasses classesPassingTest:^BOOL(Class class) {
        if ([ILGClasses class:class orAnyOfItsSuperclassesPassesTest:^BOOL(Class _Nonnull class) {
            return class == [NSObject class];
        }]) {
            //This is something that eventually inherits from NSObject.
            NSString *className = NSStringFromClass(class);
            return [className containsString:@"Class1"];
        }
        
        // This is something in Swift with no superclass, which can't be imported
        // into Obj-C for testing.
        return NO; 
    }];
    
    XCTAssertEqualObjects(expectedClasses, retrievedClasses);
}

#pragma mark - Subclass tests

- (void)testGettingSubclassesOfCustomClass
{
    NSSet *expectedSubclasses = [NSSet setWithArray:@[
                                                      [ILGChildClass1 class],
                                                      [ILGChildClass2 class],
                                                      [ILGChildClass3 class],
                                                      [ILGGrandchildClass1 class],
                                                      ]];
    NSSet *retrievedSubclasses = [ILGClasses subclassesOfClass:[ILGParentClass class]];
    
    XCTAssertEqualObjects(retrievedSubclasses, expectedSubclasses);
}

#pragma mark - Protocol Tests

- (void)testGettingClassesConformingToProtocol
{
    NSSet *expectedProtocolConformingClasses = [NSSet setWithArray:@[
                                                                     [ILGAppDelegate class]
                                                                     ]];
    NSSet *retrievedClasses = [ILGClasses classesConformingToProtocol:@protocol(UIApplicationDelegate)];
    
    XCTAssertEqualObjects(expectedProtocolConformingClasses, retrievedClasses);
}

- (void)testParentClassConformingToProtocolMakesChildAndGrandchildClassesReturned
{
    
    NSSet *expectedProtocolConformingClasses = [NSSet setWithArray:@[
                                                      [ILGParentClass class],
                                                      [ILGChildClass1 class],
                                                      [ILGChildClass2 class],
                                                      [ILGChildClass3 class],
                                                      [ILGGrandchildClass1 class],
                                                      ]];

    NSSet *retrievedClasses = [ILGClasses classesConformingToProtocol:@protocol(ILGParentProtocol)];
    
    XCTAssertEqualObjects(expectedProtocolConformingClasses, retrievedClasses);
}

@end
