//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by Aaron Chen on 2020-04-23.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let vStView = UIStackView()
        view.addSubview(vStView)
        vStView.axis = .vertical
        vStView.distribution = .fillEqually
        vStView.translatesAutoresizingMaskIntoConstraints = false
        vStView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        vStView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        vStView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        vStView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        let countryTitle = TitleLabel()
        let flagImg = UIImageView(image: UIImage(named: "\(city.icon)f"))
        let cityTitle = TitleLabel()
        let cityContent = ContentLabel()
        let temperatureTitle = TitleLabel()
        let temperatureContent = ContentLabel()
        let summaryTitle = TitleLabel()
        let summaryContent = ContentLabel()
        
        countryTitle.text = "Country"
        flagImg.contentMode = .scaleAspectFit
        cityTitle.text = "City"
        cityContent.text = city.name
        temperatureTitle.text = "Temperature"
        temperatureContent.text = "\(city.temp)"
        summaryTitle.text = "Summary"
        summaryContent.text = city.summary
        
        vStView.addArrangedSubview(countryTitle)
        vStView.addArrangedSubview(flagImg)
        
        vStView.addArrangedSubview(cityTitle)
        vStView.addArrangedSubview(cityContent)
        
        vStView.addArrangedSubview(temperatureTitle)
        vStView.addArrangedSubview(temperatureContent)
        
        vStView.addArrangedSubview(summaryTitle)
        vStView.addArrangedSubview(summaryContent)
        
    }
}
