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

import UIKit
import SceneKit

class ViewController: UIViewController {
  // UI
  @IBOutlet weak var geometryLabel: UILabel!
  @IBOutlet weak var sceneView: SCNView!
  
  // Geometry
  var geometryNode: SCNNode = SCNNode()
  
  // Gestures
  var currentAngle: Float = 0.0
  
  // MARK: Lifecycle
  override func viewDidLoad() {
      super.viewDidLoad()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    sceneSetup()
    geometryLabel.text = "Atoms\n"
    geometryNode = Atoms.allAtoms()
    sceneView.scene!.rootNode.addChildNode(geometryNode)
  }
  
  // MARK: Scene
  func sceneSetup() {
    let scene = SCNScene()
    
    let ambientLightNode = SCNNode()
    ambientLightNode.light = SCNLight()
    ambientLightNode.light!.type = SCNLightTypeAmbient
    ambientLightNode.light!.color = UIColor(white: 0.67, alpha: 1.0)
    scene.rootNode.addChildNode(ambientLightNode)
    
    let omniLightNode = SCNNode()
    omniLightNode.light = SCNLight()
    omniLightNode.light!.type = SCNLightTypeOmni
    omniLightNode.light!.color = UIColor(white: 0.75, alpha: 1.0)
    omniLightNode.position = SCNVector3Make(0, 50, 50)
    scene.rootNode.addChildNode(omniLightNode)
    
    let cameraNode = SCNNode()
    cameraNode.camera = SCNCamera()
    cameraNode.position = SCNVector3Make(0, 0, 25)
    scene.rootNode.addChildNode(cameraNode)
    
    let panRecognizer = UIPanGestureRecognizer(target: self, action: "panGesture:")
    sceneView.addGestureRecognizer(panRecognizer)
    
    sceneView.scene = scene
  }
  
    func length (vector: CGPoint) ->Float {
        
        return (Float) (sqrt (vector.x * vector.x + vector.y * vector.y))
        
    }
    
  func panGesture(sender: UIPanGestureRecognizer) {
    // You have a translation make that into a vector3 by putting z to 0
    
    // rotate the vector3 by 90 degrees to get a new vector3
    
    // use this vector3 for the axis of the transform
    
    // for the angle instead of doing with translation.x use the lenght of translation
    
    // (maybe you can use the lenght of the vector3 for the angle formula
    

    
    //let translation = sender.translationInView(sender.view!) //translationInView returns a CGPoint
    
   //sender.translationinView(sender.view!) = Vector3MakeRotation(90, CGPoint, CGPoint, 0)
    
   // geometryNode.pivot = translation
    
   // var newAngle = (Float)(translation.x)*(Float)(M_PI)/180.0
    
   // newAngle += currentAngle
    
   // geometryNode.transform = SCNMatrix4MakeRotation(newAngle, 0, 1, 0)
    

    
    
    let translation = sender.translationInView(sender.view!)
    
    
    
    let dist: Float =  length(translation)  //Finding Vector length
    
    var newAngle = dist * (Float)(M_PI)/180.0 //Finding the newAngle in radians
    
    newAngle += currentAngle
    
    print("Translation is \(translation.x) \(translation.y) \n")
    print("New angle is \(newAngle) \n")
    print("Current angle is \(currentAngle) \n \n")
    
    var axis = CGPointMake(translation.y, translation.x) //(Shortcut for doing rotation by 90 degrees, reverse the x and y values)
    //Here we found the perpendicular axis for the rotation to happen.
    
    geometryNode.transform = SCNMatrix4MakeRotation(newAngle, (Float)(axis.x), (Float) (axis.y), 0)
    
    if(sender.state == UIGestureRecognizerState.Ended) {
      currentAngle = newAngle
    
    }
  }
  
  // MARK: IBActions
  @IBAction func segmentValueChanged(sender: UISegmentedControl) {
    geometryNode.removeFromParentNode()
    currentAngle = 0.0
    
    switch sender.selectedSegmentIndex {
    case 0:
      geometryLabel.text = "Atoms\n"
      geometryNode = Atoms.allAtoms()
    case 1:
      geometryLabel.text = "Methane\n(Natural Gas)"
      geometryNode = Molecules.methaneMolecule()
    case 2:
      geometryLabel.text = "Methanol\n(Alcohol)"
      geometryNode = Molecules.methanolMolecule()
    case 3:
      geometryLabel.text = "Benzene\n(Teflon)"
      geometryNode = Molecules.benzeneMolecule()
    default:
      break
    }
    
    sceneView.scene!.rootNode.addChildNode(geometryNode)
  }
  
  // MARK: Style
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  // MARK: Transition
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    sceneView.stop(nil)
    sceneView.play(nil)
  }
}
