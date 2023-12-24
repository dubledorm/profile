# frozen_string_literal: true

# Билдер для заполнения CandidateProfile
class CandidateProfileBuilder

  LASTNAME_XPATH = '//h2[@data-qa="resume-personal-name"]//span[@class="highlighted"]'
  NAME_XPATH = '//h2[@data-qa="resume-personal-name"]//span[@class="highlighted"]/following::span[1]'
  BIRTHDAY_XPATH = '//div[@class="resume-header-title"]//span[@data-qa="resume-personal-birthday"]'
  EXPECTED_PAY_XPATH = '//span[@data-qa="resume-block-salary"]'
  DATE_REGEXP = /^\s*(?<day>\d{1,2})[^\dа-я]+(?<month>[а-я]+)[^\dа-я]+(?<year>\d{4})/
  MONTH_NAMES = %w[января февраля марта апреля мая июня июля августа сентября октября ноября декабря].freeze
  EXPECTED_PAY_REGEXP = /<span class=resume-block__salary data-qa=resume-block-salary>(?<salary>[^<]+)<\/span>/


  def initialize(html_string)
    @html_string = html_string
    @nokogiri_html = Nokogiri::HTML.parse(html_string)
  end

  def build
    result_hash = {}
    result_hash[:lastname] = @nokogiri_html.xpath(LASTNAME_XPATH).text
    result_hash[:firstname] = firstname(@nokogiri_html.xpath(NAME_XPATH).text)
    result_hash[:patronymic] = patronymic(@nokogiri_html.xpath(NAME_XPATH).text)
    result_hash[:birthday] = birthday(@nokogiri_html.xpath(BIRTHDAY_XPATH).text)
    result_hash[:expected_pay] = expected_pay(@nokogiri_html.xpath(EXPECTED_PAY_XPATH).text)
    CandidateProfile.new(result_hash)
  end

  def safe_html
    html_without_salary
  end

  private

  def html_without_salary
    m = @html_string.match(EXPECTED_PAY_REGEXP)
    return @html_string unless m

    @html_string[0..m.begin(:salary) - 1] + @html_string[m.end(:salary)..]
  rescue StandardError => e
    logger.warn(e.message)
    nil
  end

  def firstname(name)
    name.split(' ')[0] || ''
  end

  def patronymic(name)
    name.split(' ')[1] || ''
  end

  # Здесь есть засада в полученной строке с датой рождения.
  # В ней вместо пробелов приходят символы &NBSP
  # И с ними не работают функции разбора времени.
  # Поэтому стоку разбираем через регулярное выражение, а потом заного собираем дату
  def birthday(birthday_string)
    m = birthday_string.match(DATE_REGEXP)
    return nil unless m

    month_num = MONTH_NAMES.index(m[:month]) + 1
    Date.new(m[:year].to_i, month_num, m[:day].to_i)
  rescue StandardError => e
    logger.warn(e.message)
    nil
  end

  def expected_pay(expected_pay_string)
    expected_pay_string.gsub(/\D/, '').to_i
  rescue StandardError => e
    logger.warn(e.message)
    0
  end
end
