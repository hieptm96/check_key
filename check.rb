# require 'net/http'
# require 'json'
# require "mysql2"
# # call api get keys
# uri = URI.parse("http://localhost:3000/keys")
# response = Net::HTTP.get(uri)
# @keys = JSON.parse(response)

# # puts @keys.kind_of?(Array)
# # @keys.each do |key|
# #   puts key["code"]
# # end

# # connect db and check
# @db_host = "localhost"
# @db_user = "root"
# @db_pass = "hiep12"
# @db_name = "api_demo"
# client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)
# #array_key_true = []
# @keys.each do |key|
#   #check key true
#   code = key["code"]
#   @check_result = client.query("SELECT * from books WHERE code='#{code}'")
#   if (@check_result.count > 0)
#     #array_key_true.push(code)
#     # data
#     data = {
#      "token" => "yurrhtouirhrehuirehtori",
#      "keys" => code,
#     }
#     uri_post = URI("http://localhost:3000/keys")

#     response_post = Net::HTTP.post_form(uri_post, "data"=>data.to_json)
#     puts response_post.body
#   end
# end

def send_data (client, keys)
  keys.each do |key|
    #check key true
    code = key["code"]
    @check_result = client.query("SELECT * from books WHERE code='#{code}'")
    if (@check_result.count > 0)
      # data
      data = {
       "token" => "yurrhtouirhrehuirehtori",
       "keys" => code,
      }
      # Call api POST
      uri_post = URI("http://localhost:3000/keys")
      response_post = Net::HTTP.post_form(uri_post, "data"=>data.to_json)
      puts response_post.body
    end
  end
end

def excute(callback)
  # call api GET
  uri = URI.parse("http://localhost:3000/keys")
  response = Net::HTTP.get(uri)
  @keys = JSON.parse(response)

  # connect db and check
  @db_host = "localhost"
  @db_user = "root"
  @db_pass = "hiep12"
  @db_name = "api_demo"
  client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)
  # call callback
  callback.call(client,@keys)
end

def main
  require 'net/http'
  require 'json'
  require "mysql2"
  excute(method(:send_data))
end
main
