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
         PlayingCard.Suite.clubs
        ]
    public static let standardValues =
        [
            2.cardValue,
            3.cardValue,
            4.cardValue,
            5.cardValue,
            6.cardValue,
            7.cardValue,
            8.cardValue,
            9.cardValue,
            10.cardValue,
            CardName.ace.cardValue,
            CardName.jack.cardValue,
            CardName.queen.cardValue,
            CardName.king.cardValue
        ]
    public func image(card: PlayingCard) -> Image?
    { 
        guard StandardCardImageRepository.standardSuites.contains(card.suite) else {
            return nil
        }
        guard StandardCardImageRepository.standardValues.contains(card.value) else {
            return nil
        }
        return Image(card.imageName, bundle: Bundle.module) 
    }
    public func register()
    {
        CardImageRegistry.shared.registry.append(StandardCardImageRepository.shared)
    }
}
