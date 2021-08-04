//
//  news.swift
//  MyVKclient
//
//  Created by Владислав Тихоненков on 04.07.2021.
//


import UIKit

struct News{
    var titleNews : String
    var imageNews : UIImage
}

class NewsModel {
   var newsArray = [News]()


init() {
    setupNews()
}

    func setupNews() {
        


        let newsText = ["Екатерина Константиновна Гусева родилась 9 июля 1976 года в Москве. Российская актриса театра, кино, телевидения, мюзиклов, озвучивания и дубляжа, певица.","Как отмечается на сайте Роспотребнадзора, даже при отсутствии подходящего времени в поликлинике можно получить прививку от COVID-19 без записи", "Власти Подмосковья рассчитывают избежать новых ограничений благодаря высоким темпам вакцинации.","Производство фильма КРИК официально завершено, и зрители смогут увидеть его в кинотеатрах в 2022 году.", "Компания «Газпром нефть» проводит масштабную модернизацию сразу двух НПЗ в Москве и Омске с инвестициями в промышленную безопасность"]
  
        let fotoNews = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5")]

        for i in 0...4{
        
        let myNews = News(titleNews: newsText[i], imageNews: fotoNews[i]!)
            
            newsArray.append(myNews)
        }

     

    }
    }

