require "nokogiri"
require "open-uri"

class HomeController < ApplicationController
    
    $lotto=(1..45).to_a.sample(7).sort
    
  
    def index
        #숫자 랜덤으로 출력 6자리
        @lotto = $lotto
    
    end
    
    
    def numberCheck
        
        #이번주 번호 파싱
        url = "http://nlotto.co.kr/gameResult.do?method=byWin"
        data = Nokogiri::HTML(open(url))
        
        #파싱한 번호 배열에 입력 및 "" 마크 제거  
        scrapNumbers = data.css('article div div p img').map{|i| i['alt']}
        scrapNumbers = scrapNumbers.map{|n|eval n}
    
        #출력된 번호와 파싱된 번호 비교
        match_numbers = $lotto & scrapNumbers 
        match_count = match_numbers.count()
           
            #if match_count == 6
            #        result ="1등"
            #elsif match_count == 5 && my_numbers.include?(bonus_number)
            #        result = "2등"
            #elsif match_count == 4
            #        result = "3등"
            #elsif match_count == 3
            #        result = "4등"
            #elsif match_count == 2
            #        result = "5등"
            #else    result = "꽝"
            #end
            
        
            case match_count
            when 6
              result ="1등"
            when 5
              result ="2등"
            when 4
              result ="3등"
            when 3
              result ="4등"
            when 2
              result ="5등"
            when 1
              result ="6등"
            else
              result ="꽝"
            end
        
        @paramLotto = $lotto
        @scrapNumbers = scrapNumbers
        @match_numbers=match_numbers
        @result=result
        
    end
end
