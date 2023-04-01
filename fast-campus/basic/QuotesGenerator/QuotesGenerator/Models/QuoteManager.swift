//
//  QuoteManager.swift
//  QuotesGenerator
//
//  Created by 이용일(Rodi) on 2023/04/01.
//

import Foundation

final class QuoteManager {

    fileprivate var quoteList : [Quote] = []

    func makeQuoteList()  {
        quoteList = [
            Quote(contents: "죽음을 두려워하는 나머지 삶을 시작조차 못하는 사람이 많다.", name: "벤다이크"),
            Quote(contents: "나는 나 자신을 빼 놓고는 모두 안다.", name: "비용"),
            Quote(contents: "편견이란 실효성이 없는 의견이다.", name: "암브로스 빌"),
            Quote(contents: "분노는 바보들의 가슴속에서만 살아간다.", name: "아인슈타인"),
            Quote(contents: "몇 번이라도 좋다! 이 끔찍한 생이여...다시!", name: "니체"),
            Quote(contents: "삶이 있는 한 희망은 있다", name: "키케로"),
            Quote(contents: "산다는것 그것은 치열한 전투이다.", name: "로랑로랑"),
            Quote(contents: "하루에 3시간을 걸으면 7년 후에 지구를 한바퀴 돌 수 있다.", name: "사무엘 존슨"),
            Quote(contents: "언제나 현재에 집중할수 있다면 행복할것이다.", name: "파울로 코엘료"),
            Quote(contents: "진정으로 웃으려면 고통을 참아야하며, 나아가 고통을 즐길 줄 알아야 해", name: "찰리 채플린")
        ]
    }

    func getQuoteList() -> [Quote] {
        return quoteList
    }

    subscript(index: Int) -> Quote {
        get {
            return quoteList[index]
        }
        set {
            quoteList[index] = newValue
        }
    }
}
