require 'base64'
require 'json'
require 'net/https'

module Language
  class << self
  # 全体動作
  # ➞分析対象のテキストを引数として受け取り、感情のスコアを結果として返す
    def get_data(text)
      # 感情分析APIのURL作成
      api_url = "https://language.googleapis.com/v1/documents:analyzeSentiment?key=#{ENV['GOOGLE_API_KEY']}"
      # APIリクエスト用のJSONパラメータ、APIに送信するデータを定義
      params = {
        document: {
          type: 'PLAIN_TEXT',
          content: text
        }
      }.to_json
      # Google Cloud Natural Language APIにリクエスト
      uri = URI.parse(api_url)  #APIへリクエストを送信する準備
      https = Net::HTTP.new(uri.host, uri.port) #https接続の準備
      https.use_ssl = true                      #`Net::HTTP`クラスのインスタンスを格納
      request = Net::HTTP::Post.new(uri.request_uri)  #APIリクエストのための`Net::HTTP::Post`オブジェクトを格納
      request['Content-Type'] = 'application/json'  #リクエストのヘッダーに`Content-Type: application/json`をセットする
      response = https.request(request, params)  #APIからのレスポンス
      # APIのレスポンスを出力
      response_body = JSON.parse(response.body)  #レスポンスの中身をJSON形式からパースして得られたデータが格納
      if (error = response_body['error']).present?
        # 分析結果がエラーの際は"-"を返す→"-"がscoreカラムに入る
        "-"
        # raise error['message']
      else
        response_body['documentSentiment']['score']
      end  
    end
  end
end