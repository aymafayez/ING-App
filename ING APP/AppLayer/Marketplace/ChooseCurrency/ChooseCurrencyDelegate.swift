//
//  CurrenciesProtocol.swift
//  ING APP
//
//  Created by Guest2 on 12/7/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

protocol ChooseCurrencyDelegate: AnyObject {
    func didSelectCurrency(currency: Currency?)
}
