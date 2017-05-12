require 'httpclient'
require 'json'
ip = ARGV[0]
unless ip =~ /^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
  puts "irregular ip address:#{ip}"
  exit 0
end
client = HTTPClient.new
requestUrl = 'http://ip.taobao.com/service/getIpInfo.php'
content = client.get_content(requestUrl, ip: ip)
data = JSON.parse(content)['data']
puts "IP address: #{ip}"
puts "Country: #{data['country']}"
puts "Area: #{data['area']}"
puts "Region: #{data['region']}"
puts "City: #{data['city']}"
puts "ISP: #{data['isp']}"
