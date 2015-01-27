require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'mechanize'

listURL=[""]
baseURL=[""]

baseURL[0] = ""
baseURL[1] = "http://en.wikipedia.org/wiki/"
baseURL[2] = "http://www.quora.com/search?q="
baseURL[3] = "http://www.google.co.in/search?tbm=nws&q="

puts "Enter a key-word"
searchKey = gets 

listURL[1] = baseURL[1] + "#{searchKey}"
listURL[2] = baseURL[2] + "#{searchKey}"
listURL[3] = baseURL[3] + "#{searchKey}"

def bring_links_down (currentURL, index, baseURL)
    agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }
    page = agent.get currentURL
    tempLink = String.new(" ")
    sc=0
    page.links.each do |link|
        sc=sc+1
        tempLink = String.new(" ")
        a = String.new(" ")
        b = String.new(" ")
        tempLink = link.href
        #puts tempLink
        b = baseURL[index]
        #puts b
        if index != 3
        a="#{b}" + "#{tempLink}"
        else
            if (sc > 40 && sc < 50)
        a="#{tempLink}"
            i=0
            l=a.length
            while i < l
                if(a[i] == 'q')
                i=i+2
                    j=0
                    while a[i] != "&" && i<l
                    b[j]="#{a[i]}"
                    j=j+1
                    i=i+1
                    end
                end
               i=i+1
            end
                puts "nexURL(b) #{b}"
        end
            end
        puts "nexURL #{a}"
    end
    #page2 = Nokogiri::HTML(open(currentURL, 'User-Agent' => 'ruby'))
    #puts page2.text.strip
end

#tempURL = listURL[1]
#index = 1
#bring_links_down tempURL, index, baseURL
tempURL = listURL[2]
index = 2
bring_links_down tempURL, index, baseURL
tempURL = listURL[3]
index = 3
bring_links_down tempURL, index, baseURL