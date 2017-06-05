class PhoneareaParser < BaseParser
  BASE_URL = 'http://www.phonearena.com'

  def dimentions_xpath
    '//strong[text()="Dimensions:"]/../ul/li'
  end

  def phones_xpath
    '//div[@class="s_listing"]/div/div/a'
  end

  def phones_search_url
    "/search/?query=#{@keyword}&params=&page=1"
  end
end
