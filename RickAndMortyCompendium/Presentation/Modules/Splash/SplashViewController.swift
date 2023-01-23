//
//  SplashViewController.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

protocol SplashViewControllerProtocol: BaseViewProtocol {}

class SplashViewController: BaseViewController<SplashPresenterProtocol>, SplashViewControllerProtocol {}
