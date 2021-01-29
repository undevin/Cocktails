//
//  DrinksViewController.swift
//  Cocktails
//
//  Created by Devin Flora on 1/27/21.
//

import UIKit

class DrinksViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkInstructionTextView: UITextView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        randomDrink()
        drinkInstructionTextView.layer.borderWidth = 1
    }
    
    // MARK: - Actions
    @IBAction func randomDrinkButtonTapped(_ sender: UIButton) {
        randomDrink()
    }
    
    // MARK: - Methods
    func fetchandUpdateViews(drink: Drink) {
        DrinkController.fetchDrinkImage(drink: drink) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let thumbnail):
                    self.drinkImageView.image = thumbnail
                    self.drinkNameLabel.text = drink.strDrink
                    self.drinkInstructionTextView.text = "Instructions: \n\(drink.strInstructions)"
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    func randomDrink() {
        DrinkController.fetchRandomDrink { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let drink):
                    self.fetchandUpdateViews(drink: drink)
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
}//End of Class

extension DrinksViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text?.capitalized else { return }
        
        DrinkController.fetchDrinks(searchTerm: searchTerm) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let drink):
                    self.fetchandUpdateViews(drink: drink)
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}//End of Extension
