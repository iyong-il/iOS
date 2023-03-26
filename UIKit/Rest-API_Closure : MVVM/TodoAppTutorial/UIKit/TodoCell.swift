//
//  TodoCell.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/10.
//

import Foundation
import UIKit

final class TodoCell: UITableViewCell {
    
    // MARK: - 속성
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var selectionSwitch: UISwitch!
    
    var cellData : Todo? = nil
    
    // 삭제액션
    var onDeleteActionEvent: ((Int) -> Void)? = nil
    // 수정액션
    var onEditActionEvent: ((_ id: Int, _ title: String) -> Void)? = nil
    // 선택액션
    var onSelectedActionEvent: ((_ id: Int, _ isOn: Bool) -> Void)? = nil


    // MARK: - 라이프사이클
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#fileID, #function, #line, "- 셀화면이 생성된다.")
        selectionSwitch.addTarget(self, action: #selector(onSelectionChanged(_:)), for: .valueChanged)
    }
    

    // MARK: - 메서드
    /// 쎌 데이터 적용
    /// - Parameter cellData:
    func updateUI(_ cellData: Todo, _ selectedTodoIds: Set<Int>){
        
        guard let id : Int = cellData.id,
              let title : String = cellData.title else {
            print(#fileID, #function, #line, "- id, title 이 없습니다")

            return
        }
        self.cellData = cellData
        self.titleLabel.text = "아이디: \(id)"
        self.contentLabel.text = title
        self.selectionSwitch.isOn = selectedTodoIds.contains(id)
        print(#fileID, #function, #line, "- \(selectedTodoIds.contains(id))")

    }
    
    @objc fileprivate func onSelectionChanged(_ sender: UISwitch) {
        print(#fileID, #function, #line, "- sender.isOn: \(sender.isOn)")
        guard let id = cellData?.id else { return }
        self.onSelectedActionEvent?(id, sender.isOn)
    }
    
    @IBAction func onEditBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 수정버튼이 눌렸다.")
        
        guard let id = cellData?.id,
              let title = cellData?.title else { return }
        
        self.onEditActionEvent?(id, title)
    }

    @IBAction func onDeleteBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "- 삭제버튼이 눌렸다.")
        
        guard let id = cellData?.id else { return }
        self.onDeleteActionEvent?(id)
    }
    
}
