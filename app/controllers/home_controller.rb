require "nokogiri"
require "open-uri"

class HomeController < ApplicationController
    

    def index
    #숫자 랜덤으로 출력 6자리
    lotto=(1..45).to_a.sample(7).sort
        @lotto = lotto
    end
    
    
    def numberCheck
        
    #숫자 랜덤으로 출력 6자리
    lotto=(1..45).to_a.sample(7).sort   
       
    #이번주 번호 파싱
    url = "http://nlotto.co.kr/gameResult.do?method=byWin"
    data = Nokogiri::HTML(open(url))
    
    scrapNumbers = data.css('article div div p img').map{|i| i['alt']}
    
    # 출력된 번호와 파싱된 번호 비교
    
    match_numbers = lotto & scrapNumbers
    match_count = match_numbers.count
        
        if match_count == 6
                result ="1등"
        elsif match_count == 5 && my_numbers.include?(bonus_number)
                result = "2등"
        elsif match_count == 4
                result = "3등"
        elsif match_count == 3
                result = "4등"
        elsif match_count == 2
                result = "5등"
        else    result = "꽝"
        end
    
    @lotto = lotto
    @scrapNumbers = scrapNumbers
    @match_numbers=match_numbers
    @result=result
    
    end
end
