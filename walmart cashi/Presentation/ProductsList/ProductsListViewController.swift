//
//  ProductsListViewController.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import UIKit

final class ProductsListViewController: UIViewController {
    private let presenter: ProductsListPresenterType
    
    private let productsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    private let refreshControl = UIRefreshControl()
    
    required init(presenter: ProductsListPresenterType) {
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
        refreshControl.addTarget(self, action: #selector(refreshControlChange), for: .valueChanged)
        
        productsTableView.refreshControl = refreshControl
        productsTableView.dataSource = self
        productsTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)
        
    }
    
    private func setupConstraints() {
        view.addSubview(productsTableView)
        NSLayoutConstraint.activate([
            productsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func refreshControlChange() {
        presenter.viewDidLoad()
        refreshControl.endRefreshing()
    }
}

extension ProductsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.productsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier, for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        let product = presenter.product(index: indexPath.row)
        cell.configure(product: product)
        
        return cell
    }
}

extension ProductsListViewController: ProductsListViewType {
    func refreshProducts() {
        productsTableView.reloadData()
    }
}
