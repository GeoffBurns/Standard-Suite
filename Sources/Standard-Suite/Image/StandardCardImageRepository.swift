//
//  StandardCardImageRepository.swift
//  
//
//  Created by Geoff Burns on 23/9/21.
//

import SwiftUI
import PlayingCard
import PlayingCardUI
 
public class StandardCardImageRepository : ICardImageRepository
{
    public static let shared = StandardCardImageRepository()
    
    public static let standardSuites =
        [
         PlayingCard.Suite.jokers,
         PlayingCard.Suite.spades,
         PlayingCard.Suite.hearts,
         PlayingCard.Suite.diamonds,
         PlayingCard.Suite.clubs,
        ]
    public func image(card: PlayingCard) -> Image?
    {
        guard !StandardCardImageRepository.standardSuites.contains(card.suite) else {
            return nil
        }
        
        return Image(card.imageName, bundle: Bundle.module) 
    }
    public func register()
    {
        CardImageRegistry.shared.registry.append(StandardCardImageRepository.shared)
    }
}
