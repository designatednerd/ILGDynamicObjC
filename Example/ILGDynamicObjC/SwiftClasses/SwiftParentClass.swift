//
//  SwiftParentClass.swift
//  ILGDynamicObjC
//
//  Created by Ellen Shapiro on 2/29/16.
//  Copyright © 2016 Isaac Greenspan. All rights reserved.
//

class SwiftParentClass {

}

extension SwiftParentClass: SwiftProtocolMarkedWithObjC {
    @objc func giveMeAnEmoji() -> String {
        return "👍🏼"
    }
}
