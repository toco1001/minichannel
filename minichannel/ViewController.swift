//
//  ViewController.swift
//  minichannel
//
//  Created by nagasaka.shogo on 1/18/17.
//  Copyright © 2017 jp.ne.donuts. All rights reserved.
//

import UIKit
import MobileCoreServices
import Firebase
import FirebaseStorage
import FirebaseDatabase

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var movieTableView: UITableView?

    let refreshControl = UIRefreshControl()
    var movies = [MovieInfo]()
    var playMovie: MovieInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshControl.addTarget(self, action: #selector(reload(_:)), for: .valueChanged)
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        movieTableView?.register(nib, forCellReuseIdentifier: "MovieCell")
        movieTableView?.rowHeight = UITableViewAutomaticDimension
        movieTableView?.estimatedRowHeight = 340
        movieTableView?.dataSource = self
        movieTableView?.delegate = self
        movieTableView?.refreshControl = refreshControl
        reload(nil)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1529197991, green: 0.1529534459, blue: 0.1529176831, alpha: 1)
        navigationItem.titleView = UIImageView(image: UIImage(named: "TitleLogo"))
    }

    func reload(_ sender: Any?) {
        // 動画を取得する処理を追加する
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func postButtonDidTouch(sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.mediaTypes = [kUTTypeMovie as String]
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let url = info[UIImagePickerControllerMediaURL] as? URL {
            // サムネイルを生成する
            // 動画をストレージに保存する
            // サムネイルを保存する
            // データベースに動画エントリを追加する
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        // セルに動画情報を設定する処理を追加する
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        playMovie = movie
        let playerViewController = MoviePlayerViewController()
        // 押されたセルの動画を再生する処理を追加する
        // self.navigationController?.pushViewController(playerViewController, animated: true)
    }
}
