//
//  TableViewController.swift
//  TableViewExample
//
//  Created by Namira Rizqi Annisa on 06/05/21.
//


import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating
{

	let searchController = UISearchController()
	@IBOutlet weak var shapeTableView: UITableView!
	
	var shapeList = [member]()
	var filteredShapes = [member]()
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
        
		initSearchController()
        fetchdata()
    
	}
	
	func initSearchController()
	{
		searchController.loadViewIfNeeded()
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.enablesReturnKeyAutomatically = false
		searchController.searchBar.returnKeyType = UIReturnKeyType.done
		definesPresentationContext = true
		
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
		searchController.searchBar.scopeButtonTitles = ["All", "Design", "Tech", "Expert", "Morning", "Afternoon"]
		searchController.searchBar.delegate = self
	}
    
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		if(searchController.isActive)
		{
			return filteredShapes.count
		}
		return shapeList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! TableViewCell
		
		let thisShape: member!
		
		if(searchController.isActive)
		{
			thisShape = filteredShapes[indexPath.row]
		}
		else
		{
			thisShape = shapeList[indexPath.row]
		}
		
		
		tableViewCell.shapeName.text = thisShape.Name
		tableViewCell.shapeImage.image = UIImage(named: thisShape.Photo)
		
		return tableViewCell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
		self.performSegue(withIdentifier: "detailSegue", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		if(segue.identifier == "detailSegue")
		{
			let indexPath = self.shapeTableView.indexPathForSelectedRow!
			
			let tableViewDetail = segue.destination as? TableViewDetail
			
			let selectedShape: member!
			
			if(searchController.isActive)
			{
				selectedShape = filteredShapes[indexPath.row]
			}
			else
			{
				selectedShape = shapeList[indexPath.row]
			}
			
			
			tableViewDetail!.selectedShape = selectedShape
			
			self.shapeTableView.deselectRow(at: indexPath, animated: true)
		}
	}

	
	func updateSearchResults(for searchController: UISearchController)
	{
		let searchBar = searchController.searchBar
		let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
		let searchText = searchBar.text!
		
		filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
	}
	
	func filterForSearchTextAndScopeButton(searchText: String, scopeButton : String = "All")
	{
		filteredShapes = shapeList.filter
		{
			shape in
			let scopeMatch = (
                
                scopeButton == "All" || shape.Expertise.lowercased().contains(scopeButton.lowercased()) ||
                    shape.Shift.lowercased().contains(scopeButton.lowercased())

            )
            
			if(searchController.searchBar.text != "")
			{
				let searchTextMatch = shape.Name.lowercased().contains(searchText.lowercased())
				
				return scopeMatch && searchTextMatch
			}
            
            else{
				return scopeMatch
			}

		}
		shapeTableView.reloadData()
	}
    
    
    
    //ambil data dari JSON
    func fetchdata()
    {
        guard let fileLocation=Bundle.main.url(forResource: "explorers", withExtension: "json")
        else{
            return
        }
        
        do{
            let data=try Data(contentsOf: fileLocation)
            let receivedData=try JSONDecoder().decode([member].self, from: data)
            
            self.shapeList=receivedData
        }
        catch{
            print("Error While Decoding JSON")
        }

    }
}

