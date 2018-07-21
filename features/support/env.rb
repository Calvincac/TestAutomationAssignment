
require 'rspec'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec/expectations'
#require 'faraday'
#require 'nokogiri'
require 'logger'
require 'byebug'
require 'date'
#require 'csv'
#require 'fileutils'

@timeout = ENV.key?('TIMEOUT') && ENV['TIMEOUT'] != '' ? ENV['TIMEOUT'] : 300
@default_max_wait_time = 90

if ENV.key?('DEFAULT_MAX_WAIT_TIME') && ENV['DEFAULT_MAX_WAIT_TIME'] != ''
  @default_max_wait_time = ENV['DEFAULT_MAX_WAIT_TIME']
end

proxy = nil

client = Selenium::WebDriver::Remote::Http::Default.new
client.read_timeout = @timeout.to_i

time = Time.now.inspect.split('+')[0].delete('-').delete(' ').delete(':')
environment = ENV['environment']

if ENV.key?('browser') && ENV['browser'] == 'firefox'
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.download.dir'] = $invoices_directory
  profile['browser.download.folderList'] = 2
  profile['browser.download.manager.showWhenStarting'] = false
  profile['browser.download.panel.shown'] = false
  profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/pdf'
  profile['pdfjs.enabledCache.state'] = false
  profile['pdfjs.disabled'] = true

  options = Selenium::WebDriver::Firefox::Options.new(profile: profile)

  if ENV.key?('http_proxy') && ENV['http_proxy'] != ''
    http_proxy = URI(ENV['http_proxy'])
    http_proxy = "#{http_proxy.host}:#{http_proxy.port}"
    no_proxy = ENV['no_proxy'] || ''

    proxy = Selenium::WebDriver::Proxy.new(
      http: http_proxy,
      ftp: http_proxy,
      ssl: http_proxy,
      no_proxy: no_proxy
    )
  end

  caps = Selenium::WebDriver::Remote::Capabilities.firefox(marionette: true, accept_insecure_certs: true, proxy: proxy)
  caps[:unexpectedAlertBehaviour] = 'accept'

  Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      http_client: client,
      desired_capabilities: caps,
      options: options
    )
  end

  Capybara.default_driver = :firefox
  Capybara.javascript_driver = :selenium
else
  caps = Selenium::WebDriver::Remote::Capabilities.chrome
  caps[:unexpectedAlertBehaviour] = 'accept'
  caps[:javascriptEnable] = false

  prefs = {
    prompt_for_download: false,
    default_directory: $invoices_directory
  }

  options = Selenium::WebDriver::Chrome::Options.new(args: ['start-maximized'])
  options.add_preference(:download, prefs)
  options.add_preference(:plugins, always_open_pdf_externally: true)

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: caps,
      http_client: client,
      options: options
    )
  end

  Capybara.default_driver = :chrome
  Capybara.javascript_driver = :chrome
end

Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_max_wait_time = @default_max_wait_time.to_i

World(Capybara::DSL, Capybara::RSpecMatchers)