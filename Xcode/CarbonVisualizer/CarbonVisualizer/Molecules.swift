/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Foundation
import SceneKit

let PI: Float = 3.14159

class Molecules {
    
    //METHANE MOLECULE
    
  class func methaneMolecule() -> SCNNode {
    var methaneMolecule = SCNNode()
    
    // 1 Carbon
    let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, 0, 0))
    
    // 4 Hydrogen
    let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(-4, 0, 0))
    let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(+4, 0, 0))
    let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, -4, 0))
    let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, +4, 0))
    
    let chbond1 = nodeWithBond (Bonds.singleBond(), molecule:methaneMolecule, position: SCNVector3Make (-2, 0, 0))
    chbond1.rotation = SCNVector4Make( 0, 0, 1, PI / 2)
    
    let chbond2 = nodeWithBond (Bonds.singleBond(), molecule:methaneMolecule, position: SCNVector3Make (2, 0, 0))
    chbond2.rotation = SCNVector4Make( 0, 0, 1, 3 * PI / 2)
    
    let chbond3 = nodeWithBond (Bonds.singleBond(), molecule:methaneMolecule, position: SCNVector3Make (0, -2, 0))
    
    
    let chbond4 = nodeWithBond (Bonds.singleBond(), molecule:methaneMolecule, position: SCNVector3Make (0, 2, 0))

    
    
    return methaneMolecule
  }
  
    //METHANOL MOLECULE
    
  class func methanolMolecule() -> SCNNode {
    var methanolMolecule = SCNNode()
    
    // 1 Carbon
    let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: methanolMolecule, position: SCNVector3Make(0, 0, 0))
    
    // 4 Hydrogen
    let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methanolMolecule, position: SCNVector3Make(-4, 0, 0))
    let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methanolMolecule, position: SCNVector3Make(0, -4, 0))
    let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methanolMolecule, position: SCNVector3Make(0, +4, 0))
    
    //One Hydroxl ion should go here
    
    let oxygenNode1 = nodeWithAtom(Atoms.oxygenAtom(), molecule: methanolMolecule, position: SCNVector3Make(+4, 0, 0))
    
    let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methanolMolecule, position: SCNVector3Make(+8, 0, 0))
    
    return methanolMolecule
  }
    
    //BENZENE MOLECULE
    class func benzeneMolecule() -> SCNNode {
        var benzeneMolecule = SCNNode()

        //CAROBON ATOMS
        
        let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: benzeneMolecule, position: SCNVector3Make(0, 4, 0))
        
        let carbonNode2 = nodeWithAtom(Atoms.carbonAtom(), molecule: benzeneMolecule, position: SCNVector3Make(4, 2, 0))
        
        let carbonNode3 = nodeWithAtom(Atoms.carbonAtom(), molecule: benzeneMolecule, position: SCNVector3Make(4, -2, 0))
        
        let carbonNode4 = nodeWithAtom(Atoms.carbonAtom(), molecule: benzeneMolecule, position: SCNVector3Make(0, -4, 0))
        
        let carbonNode5 = nodeWithAtom(Atoms.carbonAtom(), molecule: benzeneMolecule, position: SCNVector3Make(-4, -2, 0))
        
        let carbonNode6 = nodeWithAtom(Atoms.carbonAtom(), molecule: benzeneMolecule, position: SCNVector3Make(-4, 2, 0))
        
        
        
        // CARBON BONDS
        
        let chbond1 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (2, 3, 0))
        chbond1.rotation = SCNVector4Make( 0, 0, 1, PI / 3.0)
        
        let chbond2 = nodeWithBond (Bonds.doubleBond(), molecule:benzeneMolecule, position: SCNVector3Make (4, 0, 0))
        chbond2.rotation = SCNVector4Make( 0, 0, 1, -PI)
        
        let chbond3 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (2, -3, 0))
        chbond3.rotation = SCNVector4Make( 0, 0, 1, -PI / 3.0)
        
        let chbond4 = nodeWithBond (Bonds.doubleBond(), molecule:benzeneMolecule, position: SCNVector3Make (-2, -3, 0))
        chbond4.rotation = SCNVector4Make( 0, 0, 1, PI / 3.0)
        
        let chbond5 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (-4, 0, 0))
        chbond5.rotation = SCNVector4Make( 0, 0, 1, PI)
        
        let chbond6 = nodeWithBond (Bonds.doubleBond(), molecule:benzeneMolecule, position: SCNVector3Make (-2, 3, 0))
        chbond6.rotation = SCNVector4Make( 0, 0, 1, -PI / 3.0)
        
        
        //HYDORGEN ATOMS
        
        let hydrogenNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: benzeneMolecule, position: SCNVector3Make(0, 8, 0))
        
        let hydrogenNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: benzeneMolecule, position: SCNVector3Make(8, 4, 0))
        
        let hydrogenNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: benzeneMolecule, position: SCNVector3Make(8, -4, 0))
        
        let hydrogenNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: benzeneMolecule, position: SCNVector3Make(0, -8, 0))
        
        let hydrogenNode5 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: benzeneMolecule, position: SCNVector3Make(-8, -4, 0))
        
        let hydrogenNode6 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: benzeneMolecule, position: SCNVector3Make(-8, 4, 0))
        
        //HYDROGEN BONDS
        
        
        let chbond7 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (0, 6, 0))
        chbond7.rotation = SCNVector4Make( 0, 0, 1, PI)

        let chbond8 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (6, 3, 0))
        chbond8.rotation = SCNVector4Make( 0, 0, 1, -PI / 3.0)
        
        
        let chbond9 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (6, -3, 0))
        chbond9.rotation = SCNVector4Make( 0, 0, 1, PI / 3.0 )
        
        
        let chbond10 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (0, -6, 0))
        chbond10.rotation = SCNVector4Make( 0, 0, 1, PI)
        
        let chbond11 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (-6, -3, 0))
        chbond11.rotation = SCNVector4Make( 0, 0, 1, -PI / 3.0)
        
        
        let chbond12 = nodeWithBond (Bonds.singleBond(), molecule:benzeneMolecule, position: SCNVector3Make (-6, 3, 0))
        chbond12.rotation = SCNVector4Make( 0, 0, 1, PI / 3.0)
        
        

        
        
        return benzeneMolecule

    
    }
    // TETRAFLUOROETHULENE MOLECULE
    
  //class func tetrafluoroethyleneMolecule() -> SCNNode {
    //var tetrafluoroethyleneMolecule = SCNNode()
//    
//    let carbonNode1 = nodeWithAtom(Atoms.carbonAtom(), molecule: tetrafluoroethyleneMolecule, position: SCNVector3Make(0, 0, 0))
//
//    let florineNode1 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: tetrafluoroethyleneMolecule, position: SCNVector3Make(-2, -3.464, 0))
//    let florineNode2 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: tetrafluoroethyleneMolecule, position: SCNVector3Make(+2, -3.464, 0))
//    let florineNode3 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: tetrafluoroethyleneMolecule, position: SCNVector3Make(-2, +3.464, 0))
//    let florineNode4 = nodeWithAtom(Atoms.hydrogenAtom(), molecule: tetrafluoroethyleneMolecule, position: SCNVector3Make(+2, +3.464, 0))
    
    
//    let chbond1 = nodeWithBond (Bonds.singleBond(), molecule:tetrafluoroethyleneMolecule, position: SCNVector3Make (-1, -1.732, 0))
//    chbond1.rotation = SCNVector4Make( 0, 0, 1, -PI / 6.0)
//    
//    let chbond2 = nodeWithBond (Bonds.singleBond(), molecule:tetrafluoroethyleneMolecule, position: SCNVector3Make (1, -1.732, 0))
//    chbond2.rotation = SCNVector4Make( 0, 0, 1, PI / 6.0)
//    
//    let chbond3 = nodeWithBond (Bonds.singleBond(), molecule:tetrafluoroethyleneMolecule, position: SCNVector3Make (-1, 1.732, 0))
//    chbond3.rotation = SCNVector4Make( 0, 0, 1, PI / 6.0)
//    
//    let chbond4 = nodeWithBond (Bonds.singleBond(), molecule:tetrafluoroethyleneMolecule, position: SCNVector3Make (1, 1.732, 0))
//    chbond4.rotation = SCNVector4Make( 0, 0, 1, -PI / 6.0)


//    
//    return tetrafluoroethyleneMolecule
//  }
  
  class func nodeWithAtom(atom: SCNGeometry, molecule: SCNNode, position: SCNVector3) -> SCNNode {
    let node = SCNNode(geometry: atom)
    node.position = position
    molecule.addChildNode(node)
    return node
  }
    
    class func nodeWithBond(bond: SCNGeometry, molecule: SCNNode, position: SCNVector3) -> SCNNode {
        let node = SCNNode(geometry: bond)
        node.position = position
        molecule.addChildNode(node)
        return node
    }
}
