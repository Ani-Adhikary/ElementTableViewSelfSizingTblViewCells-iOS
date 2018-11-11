//
//  ViewController.swift
//  ElementTableView
//
//  Created by Ani Adhikary on 18/11/17.
//  Copyright © 2017 Ani Adhikary. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {

    @IBOutlet weak var elementTableView: UITableView!
    
    var pt = [PeriodicTable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPeriodicTableView()
        
    }
    
    func setupPeriodicTableView() {
        elementTableView.estimatedRowHeight = 100.0
        elementTableView.rowHeight = UITableViewAutomaticDimension        
        
        elementTableView.delegate = self
        elementTableView.register(UINib(nibName: "ElementTableViewCell", bundle: nil), forCellReuseIdentifier: "ElementCell")        
        elementTableView.register(UINib(nibName: "PeriodicTableHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "PeriodicTableHeaderTableViewCell")
        pt = getElements()
    }
    
    func getElements() -> [PeriodicTable] {
        
        var periodicTable = [PeriodicTable]()
        
        let lith­iumGroup = [
            Element(elementName: "Hydrogen is a chemical element with symbol H and atomic number 1. With a standard atomic weight of 1.008, hydrogen is the lightest element on the periodic table.", elementSymbol: "H"),
            Element(elementName: "Lithium (from Greek: λίθος, translit. lithos, lit. 'stone') is a chemical element with symbol Li and atomic number 3. It is a soft, silvery-white alkali metal. Under standard conditions, it is the lightest metal and the lightest solid element.", elementSymbol: "Li"),
            Element(elementName: "Sodium", elementSymbol: "Na"),
            Element(elementName: "Potassium is a chemical element with symbol K (from Neo-Latin kalium) and atomic number 19. It was first isolated from potash, the ashes of plants, from which its name derives.", elementSymbol: "K")
        ]
        
        let beryl­liumGroup = [
            Element(elementName: "Beryllium is a chemical element with symbol Be and atomic number 4. It is a relatively rare element in the universe, usually occurring as a product of the spallation of larger atomic nuclei that have collided with cosmic rays.", elementSymbol: "Be"),
            Element(elementName: "Magnesium is a chemical element with symbol Mg and atomic number 12. It is a shiny gray solid which bears a close physical resemblance to the other five elements in the second column (group 2, or alkaline earth metals) of the periodic table: all group 2 elements have the same electron configuration in the outer electron shell and a similar crystal structure.", elementSymbol: "Mg"),
            Element(elementName: "Calcium", elementSymbol: "Ca"),
            Element(elementName: "Strontium", elementSymbol: "Sr")
        ]
        
        let scan­diumGroup = [
            Element(elementName: "Scan­dium", elementSymbol: "Sc"),
            Element(elementName: "Yttrium", elementSymbol: "Y"),
            Element(elementName: "Lanthanum is a chemical element with symbol La and atomic number 57. It is a soft, ductile, silvery-white metal that tarnishes rapidly when exposed to air and is soft enough to be cut with a knife.", elementSymbol: "La"),
            Element(elementName: "Actinium", elementSymbol: "Ac")
        ]
        
        let titan­iumGroup = [
            Element(elementName: "Titan­ium", elementSymbol: "Ti"),
            Element(elementName: "Zirconium", elementSymbol: "Zr"),
            Element(elementName: "Hafnium", elementSymbol: "Hf"),
            Element(elementName: "Rutherfordium is a synthetic chemical element with symbol Rf and atomic number 104, named after physicist Ernest Rutherford. As a synthetic element, it is not found in nature and can only be created in a laboratory. It is radioactive; the most stable known isotope, 267Rf, has a half-life of approximately 1.3 hours.", elementSymbol: "Rf")
        ]
        
        periodicTable = [
            PeriodicTable(groupName: "Lith­ium group", elements: lith­iumGroup),
            PeriodicTable(groupName: "Beryl­lium group", elements: beryl­liumGroup),
            PeriodicTable(groupName: "Scan­dium Group", elements: scan­diumGroup),
            PeriodicTable(groupName: "Titan­ium Group", elements: titan­iumGroup)
        ]
        
        return periodicTable
    }
}

extension ElementViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return pt.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pt[section].elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elementCell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as! ElementTableViewCell
        
        let element = pt[indexPath.section].elements[indexPath.row]
        elementCell.elementLabel?.text = element.elementName
        elementCell.elementSymbolLabel?.text = element.elementSymbol
        elementCell.selectionStyle = .none
        return elementCell
    }
}

extension ElementViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeriodicTableHeaderTableViewCell") as! PeriodicTableHeaderTableViewCell
        cell.groupNameLabel.text = pt[section].groupName
        headerView.addSubview(cell)
        return headerView
    }
}

