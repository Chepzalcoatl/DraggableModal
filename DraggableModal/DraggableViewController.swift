//
//  DraggableViewController.swift
//  DraggableModal
//
//  Created by Eduardo Barrón on 11/01/18.

import UIKit

class DraggableViewController:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action:#selector(panGestureRecognizerAction(_:)) )
        self.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func panGestureRecognizerAction(_ gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: view)
        view.frame.origin.y = translation.y
        
        if gesture.state == .ended{
            let velocity = gesture.velocity(in: view)
            if velocity.y >= 1100{
                self.dismiss(animated: true, completion: nil)
            }else{
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.frame.origin = CGPoint(x: 0, y: 0)
                })
            }
        }
    }
}
