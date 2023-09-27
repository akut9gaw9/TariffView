//
//  ProfileViewController.swift
//  CinemaApp
//
//  Created by Stanislav on 18.09.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var rateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Тарифы", for: .normal)
        button.addTarget(self, action: #selector(didTapRateButton), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints() {
        rateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rateButton)
        
        NSLayoutConstraint.activate([
            rateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    @objc private func didTapRateButton() {
        let tarrifsVC = TariffViewController()
        navigationController?.pushViewController(tarrifsVC, animated: true)
    }

}
