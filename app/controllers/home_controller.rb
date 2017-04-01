require "nokogiri"
require "open-uri"

class HomeController < ApplicationController
    def index
 
    #숫자 랜덤으로 출력 6자리
    @lotto=(1..45).to_a.sample(7).sort

    end
    
    
    def numberCheck
        
    #숫자 랜덤으로 출력 6자리
    @lotto=(1..45).to_a.sample(7).sort
     
    #이번주 번호 파싱
    url = "http://nlotto.co.kr/gameResult.do?method=byWin"
    data = Nokogiri::HTML(open(url))
    
    @scarpNumbers = data.css('article div div p img').map{|i| i['alt']}
    
    # 출력된 번호와 파싱된 번호 비교
    
    
     
    @c = @lotto & @scarpNumbers
    
    
    end
end
