//
//  ILGClasses_Tests_Swift.swift
//  ILGDynamicObjC
//
//  Created by Ellen Shapiro on 2/29/16.
//  Copyright © 2016 Isaac Greenspan. All rights reserved.
//

import XCTest
@testable import ILGDynamicObjC_Example

class ILGClasses_Tests_Swift: XCTestCase {
    
    //MARK: - Generic passing test tests
    
    func testNonIncludedTestWorks() {
        let expectedClasses = NSSet(array:[
            SwiftChildClass1.self,
            SwiftGrandchildClass1.self,
            ILGChildClass1.self,
            ILGGrandchildClass1.self,
        ])
        

        let retrievedClasses = ILGClasses.classesPassingTest {
            aClass -> Bool in
            let className = NSStringFromClass(aClass)
            return className.containsString("Class1")
        }
        
        XCTAssertEqual(expectedClasses, retrievedClasses);
    }
    
    //MARK: - Subclass tests
    
    func testGettingSubclassesOfCustomSwiftClassNotInheritingFromNSObject() {
        let expectedSubclasses = NSSet(array:[
            SwiftChildClass1.self,
            SwiftChildClass2.self,
            SwiftChildClass3.self,
            SwiftGrandchildClass1.self,
            ])
        
        let retrievedSubclasses = ILGClasses.subclassesOfClass(SwiftParentClass.self)
        
        XCTAssertEqual(expectedSubclasses, retrievedSubclasses)
    }
    
    //MARK: - Protocol Tests
    
    func testParentClassConformingToObjcProtocolMakesChildAndGrandchildClassesReturned() {        
        let expectedProtocolConformingClasses = NSSet(array:[
            SwiftParentClass.self,
            SwiftChildClass1.self,
            SwiftChildClass2.self,
            SwiftChildClass3.self,
            SwiftGrandchildClass1.self,
        ])

        guard let retrievedClasses = ILGClasses.classesConformingToProtocol(SwiftProtocolMarkedWithObjC.self) else {
            XCTFail("No classes found!")
            return 
        }
        
        XCTAssertEqual(expectedProtocolConformingClasses, retrievedClasses)
    }
}
