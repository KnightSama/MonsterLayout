//
//  ViewController.swift
//  Example
//
//  Created by KnightSama on 2025/6/12.
//

import UIKit
import MonsterLayout


class ViewController: UIViewController {
    
    private let boxR = BoxView(.red)
    private let boxB = BoxView(.blue)
    private let boxG = BoxView(.green)
    private let boxO = BoxView(.orange)
    private let boxP = BoxView(.purple)
    private let boxY = BoxView(.yellow)
    private let boxC = BoxView(.cyan)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fill()
//        size()
//        axis()
//        update()
    }
}

extension ViewController {
    
    private func fill() {
        view.addSubview(boxR, .fill)
        view.addSubview(boxB, .fill(UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)))
        view.addSubview(boxG, .fill(50, 50))
        view.addSubview(boxY, .fill(75, 75, 75, 75))
        view.addSubview(boxC, .fillX(100), .fillY(100))
        view.addSubview(boxP, .top(125), .left(125), .bottom(125), .right(125))
    }
    
    private func size() {
        view.addSubview(boxR, .center, .size(view))
        view.addSubview(boxB, .center, .size(200))
        view.addSubview(boxG, .center, .width(150), .height(150))
        view.addSubview(boxY, .center, .size(100, 100))
        view.addSubview(boxP, .center, .size(CGSize(width: 50, height: 50)))
    }
    
    private func axis() {
        view.addSubview(boxY, .top, .left, .size(50))
        view.addSubview(boxB, .top(.bottom(boxY), 20), .left, .size(50))
        view.addSubview(boxC, .top(20), .left(.right(boxB), 20), .size(50))
        view.addSubview(boxG, .centerY(boxB), .right(20), .size(boxB))
        view.addSubview(boxP, .left, .bottom(20), .size(boxY, 2).multiplier(2))
    }
    
    private func update() {
        view.addSubview(boxR, .center, .size(20))
        boxR.update(.size(100, 30))
        boxR.remove(.center)
        boxR.append(.top, .left)
        boxR.remake(.center, .size(100))
    }
}


