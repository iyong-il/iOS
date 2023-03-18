//
//  ViewController.swift
//  MemberList-code
//
//  Created by 이용일 on 2022/09/28.
//

import UIKit
import SnapKit
import Then

final class ViewController: UIViewController {
  // 테이블뷰를 만들때는 뷰를 따로 분리하지 않는다.
  // 셀만 따로 분리해낸다.
  private let tableView = UITableView()

  var memberListManager = MemberListManager()

//  lazy var plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))

  // 네비게이션바에 올리는 버튼
  lazy var plusButton: UIBarButtonItem = {
    let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupDatas()
    setupTableView()
    setupNavBar()
  }
  //  // 커스텀델리게이트패턴으로 구현했기 때문에 이 메서드는 필요가 없다.
  //  //  다른화면 갔다가 돌아오면 그때마다 호출된다.
  //  override func viewWillAppear(_ animated: Bool) {
  //    super.viewWillAppear(animated)
  //    // 테이블뷰를 리로드 해줘서 업데이트가 가능해진다.
  //    // 테이블뷰의 정보가 바뀌지 않아도 계속적인 리로드를 진행하기 때문에 비효율적인 방식이다.
  //    // 그래서 델리게이트패턴을 사용하는 것이 좋다.
  //    tableView.reloadData()
  //  }

  // MARK: - 데이터를 가져오는 메서드
  private func setupDatas() {
    memberListManager.makeMembersListDatas()
  }
  // MARK: - 테이블뷰를 구성하는 메서드
  private func setupTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 60
    // 코드로 셀을 짤 때는 등록을 꼭 해줘야 한다.
    tableView.register(MemberTableViewCell.self, forCellReuseIdentifier: "MemberCell")

    // 테이블뷰의 기본 색상은 검정이기 때문에 설정해줘야 한다.
    self.view.backgroundColor = .white
    self.view.addSubview(tableView)
    tableView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.left.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
    }
  }

  private func setupNavBar() {
    title = "회원목록"
    // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()  // 불투명으로
//    appearance.configureWithTransparentBackground()  // 투명으로
    appearance.backgroundColor = .white
    navigationController?.navigationBar.tintColor = .systemBlue
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.compactAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = appearance

    //네비게이션바 상단 오른쪽 버튼 설정
    self.navigationItem.rightBarButtonItem = self.plusButton
  }
// MARK: - 플러스 버튼 selector
  @objc func plusButtonTapped() {
    let detailVC = DetailViewController()
    detailVC.delegate = self

    navigationController?.pushViewController(detailVC, animated: true)
  }


}
// MARK: - 확장 / 테이블뷰 데이터소스
// 테이블뷰 구현시 반드시 구현해야하는 프로토콜
extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return memberListManager.getMemberList().count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // 공식이다.
    // 구체적인 타입으로 변형해줘야 한다.
    let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberTableViewCell
    // MARK: - 방법 1 (기존의 방법)
    // 서브트스립트를 구현했기 때문에 가능한 방법이다.
//        cell.mainImageView.image = memberListManager[indexPath.row].memeberImage
//        cell.memberNameLabel.text = memberListManager[indexPath.row].name
//        cell.addressLabel.text = memberListManager[indexPath.row].address

    // MARK: - 방법 2 (didSet을 활용한 방법)
    cell.member = memberListManager[indexPath.row]
    cell.selectionStyle = .none

    return cell
  }


}
// MARK: - 확장 / 테이블뷰 델리게이트
// 셀을 눌렀을 때 동작을 구현할 때는 델리게이트 프로토콜을 채택해야한다.
extension ViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // 다음화면으로 넘어가는 코드구현
    let detailVC = DetailViewController()
    detailVC.member = memberListManager.getMemberList()[indexPath.row]
    detailVC.delegate = self

    navigationController?.pushViewController(detailVC, animated: true)
  }

}
// MARK: - 확장 / 커스텀델리게이트
// 대리자 설정을 해줘야한다.
extension ViewController: MemberDelegate {
  func addNewMember(_ member: Member) {
    memberListManager.makeNewMember(member)
    tableView.reloadData()
  }

  func update(index: Int, _ member: Member) {
    memberListManager.updateMemberInfo(Index: index, member)
    tableView.reloadData()
  }


}



