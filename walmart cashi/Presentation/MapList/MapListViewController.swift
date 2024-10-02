//
//  MapListViewController.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import UIKit
import MapKit

final class MapListViewController: UIViewController {
    private let presenter: MapListPresenterType
    
    private let mapView : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    required init(presenter: MapListPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        tabBarItem.image = UIImage(systemName: "map")
        tabBarItem.title = "Locations"
    }
    
    private func setupConstraints() {
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MapListViewController: MapListViewType {
    func refreshLocations(_ locations: [Location]) {
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            mapView.addAnnotation(annotation)
        }
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
}
