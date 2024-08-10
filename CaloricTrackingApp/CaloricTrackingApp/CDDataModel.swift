//
//  CDDataModel.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 10.08.2024.
//

import CoreData
import Foundation

final class CDDataModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var saveBreakfastEntity: [BreakfastEntity] = []
    @Published var saveLunchEntity: [LunchEntity] = []
    @Published var saveValueEntity: [ValueEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "CDFoodClass")
        container.loadPersistentStores { (description, error) in
            if let error {
                print("Error loading data \(error)")
            }
        }

        fetchData()
    }
    
    private func fetchData() {
        let requestBreakfast = NSFetchRequest<BreakfastEntity>(entityName: "BreakfastEntity")
        let requestLunch = NSFetchRequest<LunchEntity>(entityName: "LunchEntity")
        let requestValue = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        
        do {
            saveBreakfastEntity = try container.viewContext.fetch(requestBreakfast)
            saveLunchEntity = try container.viewContext.fetch(requestLunch)
            saveValueEntity = try container.viewContext.fetch(requestValue)
        } catch let error {
            print("Error fetching data \(error)")
        }
    }

    func addBreakfast(
        icon: String,
        name: String,
        ingredients: String,
        fat: CGFloat,
        protein: CGFloat,
        cards: CGFloat
    ) {
        let newBreakfast = BreakfastEntity(context: container.viewContext)
        newBreakfast.icon = icon
        newBreakfast.name = name
        newBreakfast.ingredients = ingredients
        newBreakfast.fat = Float(fat)
        newBreakfast.protein = Float(protein)
        newBreakfast.cards = Float(cards)
        saveData()
    }

    func addLunch(
        icon: String,
        name: String,
        ingredients: String,
        fat: CGFloat,
        protein: CGFloat,
        cards: CGFloat
    ) {
        let newLunch = LunchEntity(context: container.viewContext)
        newLunch.icon = icon
        newLunch.name = name
        newLunch.ingredients = ingredients
        newLunch.fat = Float(fat)
        newLunch.protein = Float(protein)
        newLunch.cards = Float(cards)
        saveData()
    }

    func addValue(fat: CGFloat, protein: CGFloat, cards: CGFloat) {
        let newValue = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            let results = try container.viewContext.fetch(newValue)
            if let entity = results.first {
                entity.fat += Float(fat)
                entity.protein += Float(protein)
                entity.cards += Float(cards)
            } else {
                let newValue = ValueEntity(context: container.viewContext)
                newValue.fat = Float(fat)
                newValue.protein = Float(protein)
                newValue.cards = Float(cards)
            }
            saveData()
            fetchData()
        } catch {
            print("\(error)")
        }
    }

    func addCalories(calories: CGFloat) {
        let newcal = NSFetchRequest<ValueEntity>(entityName: "ValueEntity")
        do {
            let results = try container.viewContext.fetch(newcal)
            if let entity = results.first {
                entity.ring += Float(Int(calories))
            }
        } catch { print("\(error)")}
        saveData()
        fetchData()
    }

    func addBreakfastToggle(breakfast: BreakfastEntity) {
        breakfast.addmale.toggle()
        saveData()
    }

    
    private func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch {
            print("Save data failed with \(error)")
        }
    }
}
