//
//  ILGClasses.h
//  Pods
//
//  Created by Isaac Greenspan on 6/22/15.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef BOOL(^ILGClassesClassTestBlock)(__strong Class class);

@interface ILGClasses : NSObject

/**
 *  Get a set of all of the classes passing a given test.
 *
 *  @param test The block with which to test each class
 *
 *  @return A set of all of the classes passing the test
 */
+ (NSSet<Class> *__nullable)classesPassingTest:(ILGClassesClassTestBlock)test;

/**
 *  Get a set of all of the classes that are a subclass of the given class.
 *
 *  Includes any class for which the given class is an ancestor, no matter how far back.  Does not include the given
 *  class in the result.
 *
 *  @param superclass The superclass to look for
 *
 *  @return A set of all of the subclasses of the given class, including indirect subclasses.
 */
+ (NSSet<Class> *__nullable)subclassesOfClass:(Class)superclass;

/**
 *  Get a set of all of the classes that conform to the given protocol.
 *
 *  @param protocol The protocol to look for
 *
 *  @return A set of all of the classes that conform to the given protocol, as well as their direct and indirect subclasses.
 */
+ (NSSet<Class> *__nullable)classesConformingToProtocol:(Protocol *)protocol;

NS_ASSUME_NONNULL_END

@end
