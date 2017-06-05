class BaseParser
  attr_reader :keyword, :base_url

  def initialize(keyword)
    @keyword = keyword
    @base_url = "#{self.class.name}::BASE_URL".constantize
  end

  def get_dimentions
    phone_urls = find_phones
    return 'No phones found' if phone_urls.blank?
    find_dimentions phone_urls.first
  end

  def find_phones
    url = @base_url + phones_search_url
    result = make_request url, :get
    return [] unless result

    phones = result.xpath phones_xpath
    phones.map{|phone| phone.attr('href')}
  end

  def find_dimentions phone_url
    url = @base_url + phone_url
    result = make_request url, :get
    return '' unless result

    dimentions = result.xpath dimentions_xpath
    dimentions.text
  end

  private

  def make_request url, method
    request = Typhoeus::Request.new url, method: method
    response = request.run
    Nokogiri::HTML response.body
  end
end
