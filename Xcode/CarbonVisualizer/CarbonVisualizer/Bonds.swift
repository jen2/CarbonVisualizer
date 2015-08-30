//
//  Bonds.swift
//  CarbonVisualizer
//
//  Created by Jennifer A Sipila on 8/23/15.
//  Copyright (c) 2015 RayWenderlich. All rights reserved.
//

import Foundation
import SceneKit

class Bonds {
    class func singleBond() -> SCNGeometry {
        let singleBond = SCNCylinder (radius: 0.4, height: 4.0)
        singleBond.firstMaterial!.diffuse.contents = UIColor.purpleColor()
        singleBond.firstMaterial!.specular.contents = UIColor.whiteColor()
        return singleBond
        
    }
    
    class func doubleBond() -> SCNGeometry {
        let doubleBond = SCNCylinder (radius: 0.8, height: 4.0)
        doubleBond.firstMaterial!.diffuse.contents = UIColor.blueColor()
        doubleBond.firstMaterial!.specular.contents = UIColor.whiteColor()
        return doubleBond
        
    }

}
