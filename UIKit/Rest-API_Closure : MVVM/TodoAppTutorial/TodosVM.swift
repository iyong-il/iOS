//
//  TodosVM.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/20.
//

import Foundation

class TodosVM {
    
    // 가공된 최종 데이터
    var todos : [Todo] = [] {
        didSet {
            print(#fileID, #function, #line, "- 가공된 데이터가 표출됩니다.")
            self.notifyTodosChanged?(todos)
        }
    }
    
    // 선택된 할일들
    var selectedTodoIds: Set<Int> = [] {
        didSet {
            print(#fileID, #function, #line, "- 선택된 할 일 / selectedTodoIds: \(selectedTodoIds)")
            self.notifySelectedTodoIdsChanged?(Array(selectedTodoIds))
        }
    }
    
    
    /// 검색어
    var searchTerm: String = "" {
        didSet {
            print(#fileID, #function, #line, "- searchTerm: \(searchTerm)")
            if searchTerm.count > 0 {
                self.searchTodos(searchTerm: searchTerm)
            } else {
                self.fetchTodos()
            }
        }
    }
    
    var pageInfo : Meta? = nil {
        didSet {
            print(#fileID, #function, #line, "- pageInfo: \(pageInfo)")
            
            // 다음페이지 있는지 여부 이벤트
            self.notifyHasNextPage?(pageInfo?.hasNext() ?? true)
            
            // 현재 페이지 변경 이벤트
            self.notifyCurrentPageChanged?(currentPage)
        }
    }
    
    var currentPage: Int {
        get {
            if let pageInfo = self.pageInfo,
               let currentPage = pageInfo.currentPage {
                return currentPage
            } else {
                return 1
            }
        }
    }
    
    var isLoading : Bool = false {
        didSet {
            print(#fileID, #function, #line, "- 로딩중 입니다.")
            notifyLoadingStateChanged?(isLoading)
        }
    }
    
    //  선택된 할일들 변경 이벤트
    var notifySelectedTodoIdsChanged : ((_ selectedIds: [Int]) -> Void)? = nil
    
    //  에러발생 이벤트
    var notifyErrorOccured : ((_ errMsg: String) -> Void)? = nil
    
    //  할일 추가완료 이벤트
    var notifyTodoAdded : (() -> Void)? = nil
    
    // 다음페이지 있는지  이벤트
    var notifyHasNextPage : ((_ hasNext: Bool) -> Void)? = nil
    
    // 검색결과 없음 여부 이벤트
    var notifySearchDataNotFound : ((_ noContent: Bool) -> Void)? = nil
    
    // 리프레시 완료 이벤트
    var notifyRefreshEnded : (() -> Void)? = nil
    
    // 로딩중 여부 변경 이벤트
    var notifyLoadingStateChanged : ((_ isLoading: Bool) -> Void)? = nil
    
    // 데이터 변경 이벤트
    var notifyTodosChanged : (([Todo]) -> Void)? = nil
    
    // 현재페이지 변경 이벤트
    var notifyCurrentPageChanged : ((Int) -> Void)? = nil
    
    
    
    init(){
        print(#fileID, #function, #line, "- ")
        
        fetchTodos()
    }// init
    
    
    /// 선택된 할일 처리
    /// - Parameters:
    ///   - selectedTodoId:
    ///   - isOn:
    func handleTodoSelection(_ selectedTodoId: Int, isOn: Bool){
        if isOn {
            self.selectedTodoIds.insert(selectedTodoId)
        } else {
            self.selectedTodoIds.remove(selectedTodoId)
        }
    }
    
    
    /// 할일 검색하기
    /// - Parameters:
    ///   - searchTerm: 검색어
    ///   - page: 페이지
    func searchTodos(searchTerm: String, page: Int = 1){
        print(#fileID, #function, #line, "- <#comment#>")
        
        if searchTerm.count < 1 {
            print(#fileID, #function, #line, "- 검색어가 없습니다")
            return
        }
        
        if isLoading {
            print(#fileID, #function, #line, "- 로딩중입니다...")
            return
        }
        
        guard pageInfo?.hasNext() ?? true else {
            return print(#fileID, #function, #line, "- 다음페이지 없음")
        }
        
        self.notifySearchDataNotFound?(false)
        
        if page == 1 {
            self.todos = []
        }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
            // 서비스 로직
            TodosAPI.searchTodos(searchTerm: searchTerm,
                                 page: page,
                                 completion: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    self.isLoading = false
                    // 페이지 갱신
                    if let fetchedTodos : [Todo] = response.data,
                       let pageInfo : Meta = response.meta{
                        if page == 1 {
                            self.todos = fetchedTodos
                        } else {
                            self.todos.append(contentsOf: fetchedTodos)
                        }
                        self.pageInfo = pageInfo
                    }
                case .failure(let failure):
                    print("failure: \(failure)")
                    self.isLoading = false
                    self.handleError(failure)
                }
                self.notifyRefreshEnded?()
                
            })
        })
    }
    
    /// 데이터 리프레시
    func fetchRefresh(){
        print(#fileID, #function, #line, "- 데이터 리프레시")
        self.fetchTodos(page: 1)
    }
    
    
    /// 더 가져오기
    func fetchMore(){
        print(#fileID, #function, #line, "- 셀을 더 가져온다.")
        
        guard let pageInfo = self.pageInfo,
              pageInfo.hasNext(),
              !isLoading else {
            return print(#fileID, #function, #line, "- 다음페이지가 없다")

        }
        
        if searchTerm.count > 0 { // 검색어가 있으면
            self.searchTodos(searchTerm: searchTerm, page: self.currentPage + 1)
        } else {
            self.fetchTodos(page: currentPage + 1)
        }
    }
    
    /// 선택된 할일들 삭제
    func deleteSeletedTodos() {
        print(#fileID, #function, #line, "- ")
        
        if self.selectedTodoIds.count < 1 {
            notifyErrorOccured?("선택된 할일들이 없습니다")
            return
        }
        
        if isLoading {
            print("로딩중이다")
            return
        }
        
        self.isLoading = true
        
        TodosAPI.deleteSelectedTodos(selectedTodoIds: Array(self.selectedTodoIds),
                                     completion: { [weak self] deletedTodoIds in
            guard let self = self else { return }
            
            // 삭제된 아이템 찾아서 그 녀석만 현재 리스트에서 빼기
            self.todos = self.todos.filter{ !deletedTodoIds.contains($0.id ?? 0) }
            
            self.selectedTodoIds = self.selectedTodoIds.filter{ !deletedTodoIds.contains($0) }
            
            self.isLoading = false
        })

    }
    
    /// 단일 할일 삭제
    /// - Parameter id: 할일 아이디
    func deleteATodo(_ id: Int) {
        print(#fileID, #function, #line, "- 단일 할 일이 삭제된다. / id: \(id)")
        
        if isLoading {
            print("로딩중이다")
            return
        }
        
        self.isLoading = true
        
        TodosAPI.deleteATodo(id: id, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.isLoading = false
                // 페이지 갱신
                if let deletedTodo : Todo = response.data,
                   let deletedTodoId : Int = deletedTodo.id{
                    
                    // 삭제된 아이템 찾아서 그 녀석만 현재 리스트에서 빼기
                    self.todos = self.todos.filter{ $0.id ?? 0 != deletedTodoId }
                }
            case .failure(let failure):
                print("failure: \(failure)")
                self.isLoading = false
                self.handleError(failure)
            }
        })
    }
    
    /// 할일추가
    /// - Parameter title: 할일 타이틀
    func addATodo(_ title: String) {
        print(#fileID, #function, #line, "- title: \(title)")
        
        if isLoading {
            print("로딩중이다")
            return
        }
        
        self.isLoading = true
        
        TodosAPI.addATodoAndFetchTodos(title: title, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.isLoading = false
                // 페이지 갱신
                if let fetchedTodos : [Todo] = response.data,
                   let pageInfo : Meta = response.meta{
                    self.todos = fetchedTodos
                    self.pageInfo = pageInfo
                    self.notifyTodoAdded?()
                }
            case .failure(let failure):
                print("failure: \(failure)")
                self.isLoading = false
                self.handleError(failure)
            }
        })
    }
    
    /// 할일 수정
    /// - Parameter title: 할일 타이틀
    func editATodo(_ id: Int, _ editedTitle: String) {
        print(#fileID, #function, #line, "- id: \(id), editedTitle: \(editedTitle)")
        
        if isLoading {
            print("로딩중이다")
            return
        }
        
        self.isLoading = true
        
        TodosAPI.editTodo(id: id,
                          title: editedTitle,
                          completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.isLoading = false
                // 페이지 갱신
                if let editedTodo : Todo = response.data,
                   let editedTodoId : Int = editedTodo.id,
                   let editedIndex = self.todos.firstIndex(where: { $0.id ?? 0 == editedTodoId }) {
                    
                    // 지금 수정한 녀석 아이디를 가지고 있는 인덱스 찾기
                    // 그 녀석을 바꾸기
                    self.todos[editedIndex] = editedTodo
                }
            case .failure(let failure):
                print("failure: \(failure)")
                self.isLoading = false
                self.handleError(failure)
            }
        })
  
    }
    
    /// 할일 가져오기
    /// - Parameter page: 페이지
    func fetchTodos(page: Int = 1){
        print(#fileID, #function, #line, "😀- 할일 가져오기")
        
        if isLoading {
            print("로딩중입니다...")
            return
        }
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
            // 서비스 로직
            TodosAPI.fetchTodos(page: page, completion: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    
                    self.isLoading = false
                    
                    // 페이지 갱신
                    if let fetchedTodos : [Todo] = response.data,
                       let pageInfo : Meta = response.meta{
                        if page == 1 {
                            self.todos = fetchedTodos
                        } else {
                            self.todos.append(contentsOf: fetchedTodos)
                        }
                        self.pageInfo = pageInfo
                    }
                case .failure(let failure):
                    print("failure: \(failure)")
                    self.isLoading = false
                }
                self.notifyRefreshEnded?()
                
            })
        })
    }
    
    
    /// API 에러처리
    /// - Parameter err: API 에러
    fileprivate func handleError(_ err: Error) {
        
        guard let apiError = err as? TodosAPI.ApiError else {
            print("모르는 에러입니다")
            return
        }
        print("handleError : err : \(apiError.info)")
        
        switch apiError {
        case .noContent:
            print("컨텐츠 없음")
            self.notifySearchDataNotFound?(true)
        case .unauthorized:
            print("인증안됨")
        case .decodingError:
            print("디코딩 에러입니당ㅇㅇ")
        case .errResponseFromServer:
            print("서버에서 온 에러입니다 : \(apiError.info)")
            self.notifyErrorOccured?(apiError.info)
        default:
            print("default")
        }
    }// handleError
    
}
