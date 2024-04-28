////
////  IGHomeController.swift
////  IITU App
////
////  Created by Жансая Шакуали on 25.04.2024.
////
//
//import UIKit
//
//fileprivate let isClearCacheEnabled = true
//internal var isDeleteSnapEnabled = true
//
//final class IGHomeController: UIViewController {
//
//    //MARK: - iVars
//    private var _view: IGHomeView{return view as! IGHomeView}
//    private var viewModel: IGHomeViewModel = IGHomeViewModel()
//
//    //MARK: - Overridden functions
//    override func loadView() {
//        super.loadView()
//        view = IGHomeView(frame: UIScreen.main.bounds)
//        _view.collectionView.delegate = self
//        _view.collectionView.dataSource = self
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        automaticallyAdjustsScrollViewInsets = false
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//
//    //MARK: - Private functions
//
//    private func showAlert(withMsg: String) {
//        let alertController = UIAlertController(title: withMsg, message: nil, preferredStyle: .alert)
//        present(alertController, animated: true) {
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5){
//                alertController.dismiss(animated: true, completion: nil)
//            }
//        }
//    }
//
//}
//
////MARK: - Extension|UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
//extension IGHomeController: UICollectionViewDelegate,UICollectionViewDataSource,
//UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.numberOfItemsInSection(section)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IGStoryListCell.reuseIdentifier,for: indexPath) as? IGStoryListCell else { fatalError() }
//            let story = viewModel.cellForItemAt(indexPath: indexPath)
//            cell.story = story
//            return cell
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//            isDeleteSnapEnabled = true
//            if(isDeleteSnapEnabled) {
//                DispatchQueue.main.async {
//                    if let stories = self.viewModel.getStories(), let stories_copy = try? stories.copy().myStory, stories_copy.count > 0 && stories_copy[0].snaps.count > 0 {
//                        let storyPreviewScene = IGStoryPreviewController.init(stories: stories_copy, handPickedStoryIndex: indexPath.row, handPickedSnapIndex: 0)
//                        self.present(storyPreviewScene, animated: true, completion: nil)
//                    } else {
//                        self.showAlert(withMsg: "Redirect to Add Story screen")
//                    }
//                }
//            } else {
//                showAlert(withMsg: "Try to implement your own functionality for 'Your story'")
//            }
//        }else {
//            isDeleteSnapEnabled = false
//            DispatchQueue.main.async {
//                if let stories = self.viewModel.getStories(), let stories_copy = try? stories.copy().otherStories {
//                    let storyPreviewScene = IGStoryPreviewController.init(stories: stories_copy, handPickedStoryIndex:  indexPath.row-1, handPickedSnapIndex: 0)
//                    self.present(storyPreviewScene, animated: true, completion: nil)
//                }
//            }
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return indexPath.row == 0 ? CGSize(width: 80, height: 100) : CGSize(width: 80, height: 100)
//    }
//}
