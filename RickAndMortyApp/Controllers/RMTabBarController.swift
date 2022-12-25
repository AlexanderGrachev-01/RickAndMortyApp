//
//  RMTabBarController.swift
//  RickAndMortyApp
//
//  Created by Aleksandr.Grachev on 25.12.2022.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabs()
    }

    private func setUpTabs() {
        let charactersVC = RMCharactersViewController()
        let locationsVC = RMLocationsViewController()
        let epsisodesVC = RMEpisodesViewController()
        let settingsVC = RMSettingsViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        epsisodesVC.navigationItem.largeTitleDisplayMode = .automatic
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let charactersNav = UINavigationController(rootViewController: charactersVC)
        let locationsNav = UINavigationController(rootViewController: locationsVC)
        let epsisodesNAv = UINavigationController(rootViewController: epsisodesVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        
        charactersNav.tabBarItem = UITabBarItem(title: "Characters",
                                                image: UIImage(systemName: "figure.stand"),
                                                tag: 0)
        locationsNav.tabBarItem = UITabBarItem(title: "Location",
                                                image: UIImage(systemName: "globe.europe.africa"),
                                                tag: 0)
        epsisodesNAv.tabBarItem = UITabBarItem(title: "Episodes",
                                                image: UIImage(systemName: "film.stack"),
                                                tag: 0)
        settingsNav.tabBarItem = UITabBarItem(title: "Settings",
                                                image: UIImage(systemName: "gearshape"),
                                                tag: 0)
        
        for nav in [charactersNav, locationsNav, epsisodesNAv, settingsNav] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [charactersNav, locationsNav, epsisodesNAv, settingsNav],
            animated: true)
    }
}

