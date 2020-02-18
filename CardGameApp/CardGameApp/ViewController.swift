//
//  ViewController.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/10.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let CardStackView = UIStackView()
    private let cardRatio = CGFloat(1.27)
    private let cardCount = 7
    
    private let studTypeSegementControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
    private var cardDeck = CardDeck()
    
    //status bar 설정
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundPattern")!)
        setUpStudTypeSegment()
        drawStackView()
    }
    
    func drawStackView() {
        setUpStackView()
        for _ in 0 ..< cardCount {
            addCardOnStackView()
        }
        addStackViewOnView()
    }
    
    // stackView 설정 및 view에 등록
    func setUpStackView() {
        self.CardStackView.axis = .horizontal
        self.CardStackView.alignment = .fill
        self.CardStackView.distribution = .fillEqually
        self.CardStackView.spacing = 5
        self.CardStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // view에 stackview를 올림
    func addStackViewOnView() {
        self.view.addSubview(CardStackView)
        self.CardStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        self.CardStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        self.CardStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }
    
    // stackview에 card이미지 삽입(카드 이미지 비율도 함께 조정)
    func addCardOnStackView() {
        let cardImg = UIImageView(image: UIImage(named: "CardBackground")!)
        cardImg.translatesAutoresizingMaskIntoConstraints = false
        cardImg.heightAnchor.constraint(equalTo: cardImg.widthAnchor, multiplier: cardRatio).isActive = true
        
        self.CardStackView.addArrangedSubview(cardImg)
    }
    
    func drawSegmentCtrl() {
        setUpStudTypeSegment()
    }
    
    func setUpStudTypeSegment() {
        self.studTypeSegementControl.center = CGPoint(x: self.view.frame.width/2, y: 100)
        self.studTypeSegementControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.studTypeSegementControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        self.studTypeSegementControl.layer.borderWidth = 1
        self.studTypeSegementControl.layer.borderColor = UIColor.white.cgColor
        self.studTypeSegementControl.selectedSegmentIndex = 0
        self.view.addSubview(studTypeSegementControl)
        
        self.studTypeSegementControl.addTarget(self, action: #selector(studTypeChange(handler:)), for: .valueChanged)
    }
    
    @objc func studTypeChange(handler: UISegmentedControl) {
        
    }
}

