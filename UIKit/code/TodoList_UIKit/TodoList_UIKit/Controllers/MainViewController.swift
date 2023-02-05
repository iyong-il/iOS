//
//  ViewController.swift
//  TodoList_UIKit
//
//  Created by 이용일(Rodi) on 2023/02/05.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

  // MARK: - 속성
  private let mainView = MainView()

  private lazy var tableView: UITableView = {
    let tv = UITableView()

    tv.dataSource = self
    tv.delegate = self

    tv.register(TableCell.self, forCellReuseIdentifier: TVCell.reuseIdentifier)

    return tv
  }()

  private let fetchToDos = FetchService.shared
  private var todosArray: [ToDo] = []

  private let uploadToDo = UploadService.shared
  private let deleteToDo = DeleteService.shared

  // MARK: - 라이프사이클
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchData()
    setupUI()
  }

  // MARK: - 메서드
  private func fetchData() {
    fetchToDos.fetchData() { result in
      switch result {
      case .success(let todoDatas):
        self.todosArray = todoDatas

        DispatchQueue.main.async {
          self.tableView.reloadData()
        }

      case .failure(let error):
        print(error.localizedDescription)
        return
      }

    }
  }

  private func setupUI() {
    self.view.backgroundColor = .white
    mainView.delegate = self
    mainView.searchButton.delegate = self

    self.view.addSubview(mainView)
    mainView.snp.makeConstraints {
      $0.top.equalToSuperview().inset(55)
      $0.leading.trailing.equalToSuperview()
    }

    self.view.addSubview(tableView)
    tableView.snp.makeConstraints {
      $0.top.equalTo(mainView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }

}

// MARK: - 확장 / 테이블뷰 데이터소스
extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todosArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TVCell.reuseIdentifier, for: indexPath) as? TableCell else { return UITableViewCell() }

    cell.todos = todosArray[indexPath.row]
    cell.index = indexPath
    cell.delegate = self
    cell.selectionStyle = .none

    return cell
  }


}

// MARK: - 확장 / 테이블뷰 델리게이트
extension MainViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 110

  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(#fileID, #function, #line, "- 셀이 눌렸다. 셀 아이디: \(todosArray[indexPath.row].id)")
  }

}

// MARK: - 확장 / MainView 델리게이트
extension MainViewController: MainViewDelegate {

  func closureButtonPressed() {
    print(#fileID, #function, #line, "- 클로저버튼이 눌렸다.")

  }

  func rxButtonPressed() {
    print(#fileID, #function, #line, "- rx버튼이 눌렸다.")

  }

  func combineButtonPressed() {
    print(#fileID, #function, #line, "- 콤바인버튼이 눌렸다.")

  }

  func asyncButtonPressed() {
    print(#fileID, #function, #line, "- async버튼이 눌렸다.")

  }

  func convertClosureToAsyncButtonPressed() {
    print(#fileID, #function, #line, "- 클로저에서 async로 변환하는 버튼이 눌렸다.")

  }

  func convertRxToAsyncButtonPressed() {
    print(#fileID, #function, #line, "- Rx에서 Async로 변환하는 버튼이 눌렸다.")

  }

  func convertCombineToAsyncButtonPressed() {
    print(#fileID, #function, #line, "- 콤바인에서 Async로 변환하는 버튼이 눌렸다.")

  }

  func resetButtonPressed() {
    print(#fileID, #function, #line, "- 초기화버튼이 눌렸다.")

  }

  func deleteSelectToDoButtonPressed() {
    print(#fileID, #function, #line, "- 선택된 할 일들 삭제 버튼이 눌렸다.")

  }

  func appendToDoButtonPressed() {
    print(#fileID, #function, #line, "- 할 일 추가 버튼이 눌렸다.")

    let alert = UIAlertController(title: "할 일 등록하기", message: "등록할 내용을 적어주세요.", preferredStyle: .alert)
    alert.addTextField() { textField in
      textField.placeholder = "등록할 내용을 적어주세요."
    }

    // 등록버튼을 눌렀을 때 등록되게
    let correctButton = UIAlertAction(title: "등록", style: .default) { _ in
      self.uploadToDo.uploadData(title: "ss")
      print(#fileID, #function, #line, "- 등록버튼이 눌렸다.")
    }

    let cancelButton = UIAlertAction(title: "취소", style: .destructive)

    alert.addAction(cancelButton)
    alert.addAction(correctButton)

    self.present(alert, animated: true)

  }

}

// MARK: - 확장 / TVCell 델리게이트
extension MainViewController: CellDelegate {

  func correctButtonPressed(indexPath: IndexPath) {

    let alert = UIAlertController(title: "수정하기", message: "수정할 내용을 적어주세요.", preferredStyle: .alert)
    alert.addTextField() { textField in
      textField.placeholder = "수정할 내용을 적어주세요."
      textField.text = self.todosArray[indexPath.row].title
    }

    // 수정버튼을 눌렀을 때 글씨가 바뀌게
    let correctButton = UIAlertAction(title: "수정", style: .default) { _ in

    }

    let cancelButton = UIAlertAction(title: "취소", style: .cancel)

    alert.addAction(cancelButton)
    alert.addAction(correctButton)

    self.present(alert, animated: true)

  }

  func deleteButtonPressed(indexPath: IndexPath) {


    let alert = UIAlertController(title: "해당 내용을 삭제하시겠습니까?", message: nil, preferredStyle: .alert)
    // delete 메서드
    let deleteButton = UIAlertAction(title: "삭제", style: .destructive) { _ in

      DispatchQueue.global().async {
        self.deleteToDo.deleteData(id: self.todosArray[indexPath.row].id)

        DispatchQueue.main.async {
          self.fetchData()
        }

      }

    }

    let cancelButton = UIAlertAction(title: "취소", style: .cancel)

    alert.addAction(cancelButton)
    alert.addAction(deleteButton)

    self.present(alert, animated: true)

  }


}

// MARK: - 확장 / 서치바 델리게이트
extension MainViewController: UISearchBarDelegate {

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    print(#fileID, #function, #line, "- 서치바의 버튼이 눌렸다.")
    guard let text = mainView.searchButton.text else { return }
    print(#fileID, #function, #line, "- \(text)")

    fetchToDos.searchTitleFetchData(title: text) { result in
      switch result {
      case .success(let data):
        self.todosArray = data

        DispatchQueue.main.async {
          self.tableView.reloadData()
        }

      case .failure(let error):
        print(#fileID, #function, #line, "- \(error.localizedDescription)")

        return

      }
    }

  }
}


#if DEBUG
import SwiftUI

struct MainViewController_Previews: PreviewProvider {

  static var previews: some View {
    if #available(iOS 14.0, *) {
      MainViewController().getPreview()
        .ignoresSafeArea()
    }

  }
}
#endif
