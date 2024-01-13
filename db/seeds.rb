# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by(email: 'admin@admin.com') do |admin|
  admin.password = 'adominpasuwa-do'
  end

# アカウント作成
names = [
  "おこめ", "データ忍者", "ピザ党", "Akane", "だーやま",
  "Rio88", "まさと", "ゆうな", "はるか", "たくや", "Poko321", "こうじ", "あい", "れい", "健太",
  "SakuraTech99", "YukiDataMaster", "KaijuCoder123", "HaruByte567", "NaoQuantum7", "MikiCyberArt", "KentaDigital",
  "YuiLogic21", "KenjiAlgorithm", "SoraPixel88", "とろろそば", "ねぎ焼き", "ぶたしゃぶ", "わさび", "おでん", "さくらんぼ",
]

introductions = [
  "よろしくお願いします。",
  "プログラミングが大好きで、新しい技術に挑戦しています。",
  "日々の学びを共有できたらと思っています。",
  "こんにちは！最近プログラミングを始めました。よろしくお願いします！",
  "プログラミングに興味を持ち勉強中です。一緒に学び合えたら嬉しいです。",
  "最近プログラミングの世界に入りました。経験者の方々からのアドバイスをお待ちしています。",
  "はじめまして。スクールで学習中のプログラミング初心者です。",
  "最近コーディングにはまっています。アドバイスや教えていただけるとうれしいです。",
]

  datetime_from = DateTime.parse('2022-11-26 00:00:00')
  datetime_to   = DateTime.parse('2023-11-25 00:00:00')

names.each do |name|
  user_data = {
    email: "#{name.downcase.gsub(/\s+/, '')}@example.com",
    password: "password123",
    name: name,
    introduction: introductions.sample,
    is_active: [true, false].sample,
    created_at: rand(datetime_from..datetime_to),
    status: [true, false].sample,
  }
# .sample:sampleメソッド、配列の要素をランダムに1つ取得する

  user = User.find_or_create_by(email: user_data[:email]) do |u|
    u.attributes = user_data
  end

  if user.persisted?
    puts "ユーザー #{user.name} が作成されました - Created at: #{user.created_at} - Status: #{user.status ? 'Active' : 'Inactive'}"
  else
    puts "ユーザー #{user.name} の作成に失敗しました - Errors: #{user.errors.full_messages.join(', ')}"
  end
  
# 学習時間のseedファイル
  
  # ユーザーIDの指定
user_ids = User.pluck(:id)

learning_comments = [
  "本日も一日頑張りました。",
  "新しい技術に挑戦しています。",
  "プログラミングの基礎をしっかり固めました。",
  "アルゴリズムの理解が深まりました。",
  "エラーに苦戦しましたが、解決できて良かったです！",
  "自分の弱点を克服するために努力しました。",
  "コーディングのテクニックを学びました。",
  "新たなライブラリやツールの使い方を覚えました。",
  "プログラムの最適化に取り組んでいます。",
  "データ構造とアルゴリズムについて勉強しました。",
  "Web開発に関する知識を深めました。",
  "今日はエラーが多く発生し、疲れました……",
]

num_records = 10

user_ids.each do |user_id|
  registration_date = User.find(user_id).created_at.to_date
  learning_day = rand(registration_date..Date.today)

  record_data = {
    user_id: user_id,
    status: [true, false].sample,
    learning_day: learning_day,
    study_time: rand(1..8),
    comment: learning_comments.sample,
    hidden: [true, false].sample,
    report_id: nil,
    created_at: learning_day.to_datetime,
    updated_at: learning_day.to_datetime,
    score: rand(-1.0..1.0)
  }

  Record.create!(record_data)
end

# ノートを作成
tags_data = [
  { name: 'プログラミング' },
  { name: 'Ruby' },
  { name: 'Web開発' },
  { name: 'データベース' },
]

# タグを作成
tags = tags_data.map { |tag_data| Tag.create!(tag_data) }

# Topic data with associated tags
topic_data = {
  "変数とデータ型" => {
    challenge: "変数の宣言と初期化を行い、異なるデータ型を扱うコードを書いてみる",
    goal: "変数とデータ型に慣れる",
    goal_memo: "変数とデータ型に慣れることはプログラミングの基礎です。慣れることで、コードをより効果的に書くことができます。",
    assignment: "データ型の変換が難しかった。特に、数値から文字列への変換や文字列から数値への変換が混乱しました。適切なメソッドや演算子の使い方を理解する必要があります。また、異なるデータ型同士を連結したり計算したりする際にも注意が必要でした。"
  },
  "条件分岐とループ" => {
    challenge: "if文やループ構文を使用して、特定の条件に応じた処理を行うプログラムを組んでみる",
    goal: "条件分岐とループを使いこなす",
    goal_memo: "条件分岐とループを使いこなすことは、プログラムの流れを制御するために重要です。",
    assignment: "条件分岐とループの組み合わせによるアルゴリズムの構築が難しかった。特に、複雑な条件を組み合わせた場合の挙動を正確に把握することが重要です。"
  },
  "配列とハッシュ" => {
    challenge: "配列とハッシュを使ってデータを操作し、様々な操作を試してみる",
    goal: "基本的なデータ構造を理解する",
    goal_memo: "データ構造の理解は、効率的なプログラミングの鍵です。",
    assignment: "配列とハッシュの操作で、特に要素の検索や変更、追加が難しかった。様々なメソッドを組み合わせて使うことで、効率的なデータの扱い方を学ぶ必要があります。"
  },
  "メソッドの基本" => {
    challenge: "メソッドを定義し、引数や戻り値を利用してみる。また、組み込みメソッドを駆使して処理を行う",
    goal: "メソッドを自在に使う",
    goal_memo: "メソッドを自在に操ることで、コードの再利用性や保守性が向上します。",
    assignment: "メソッドの定義や呼び出しは理解できたが、引数や戻り値の扱いに不安がありました。特に、複数の引数を受け取ったり、複数の値を戻り値として返す場合の取り扱いに注意が必要です。"
  },
  "クラスとオブジェクト" => {
    challenge: "クラスを定義し、オブジェクト指向の基本原則に基づいてコードを組んでみる",
    goal: "オブジェクト指向プログラミングを理解する",
    goal_memo: "オブジェクト指向の考え方を理解することで、大規模なプログラムの開発が容易になります。",
    assignment: "クラスの定義やオブジェクトの作成は理解できたが、継承やポリモーフィズムなどの概念が難しかった。これらの概念を理解して柔軟なコードを書くためには、実践的な例題が必要です。"
  },
  "文字列と数値の操作" => {
    challenge: "文字列と数値の操作を行い、フォーマットの変更や計算を行うコードを書いてみる",
    goal: "文字列と数値の操作をスムーズに行う",
    goal_memo: "文字列と数値の操作をスムーズに行うことで、実用的なプログラムを開発できます。",
    assignment: "文字列と数値の変換、およびそれらの操作に関する課題が難しかった。特に、正規表現や複雑な計算を伴う場合には、適切なメソッドやアルゴリズムを選択することが求められます。"
  },
  "簡単なデバッグ技術" => {
    challenge: "デバッグツールを使ってプログラム中のバグを見つけ、修正する経験をする",
    goal: "デバッグスキルを向上させる",
    goal_memo: "デバッグスキルの向上は、効率的な問題解決につながります。",
    assignment: "デバッグツールの使用が難しかった。特に、プログラムの実行中に変数や条件の状態を正確に把握する方法が重要です。"
  },
  "基本的なアルゴリズム" => {
    challenge: "シンプルなソートアルゴリズムや探索アルゴリズムを実装してみる",
    goal: "アルゴリズムを考える力を養う",
    goal_memo: "アルゴリズムの考え方は、高度な問題解決に役立ちます。",
    assignment: "シンプルなアルゴリズムの実装は理解できたが、効率的なアルゴリズムの設計が難しかった。特に、大量のデータに対する高速な処理を実現するためには、適切なデータ構造やアルゴリズムの選択が必要です。"
  },
  "関数の使い方" => {
    challenge: "異なるスコープを持つ関数を定義し、変数のスコープについて理解を深める",
    goal: "関数を効果的に利用する",
    goal_memo: "関数を効果的に使うことで、コードの構造が整理され、可読性が向上します。",
    assignment: "関数の定義や呼び出しは理解できたが、異なるスコープでの変数の挙動が難しかった。特に、グローバルスコープとローカルスコープの違いを理解し、適切に変数を利用することが求められます。"
  },
  "プログラミングの基本原則" => {
    challenge: "コードの重複を避けるために、DRY原則を意識してプログラムを書いてみる",
    goal: "DRY原則を実践する",
    goal_memo: "DRY原則の実践は、コードの保守性や変更の容易さに寄与します。",
    assignment: "DRY原則の理解はあるものの、実際にコードを書く際にどの部分を抽象化して関数やクラスにするか迷いました。実践を通じて、より効果的なコードの抽象化ができるようになりたいです。"
  },
  "Web開発基礎" => {
    challenge: "HTMLとCSSを使って基本的なウェブページを作成し、レイアウトやスタイルの調整を行う",
    goal: "シンプルなウェブページを作成する",
    goal_memo: "ウェブ開発の基礎を身につけることで、インタラクティブなコンテンツを作成できます。",
    assignment: "HTMLとCSSの基本的な文法は理解できたが、レスポンシブなデザインやブラウザの互換性について考慮することが難しかった。これらの要素を考慮しながら、より実用的なウェブページの構築ができるようになりたいです。"
  },
  "データベース操作" => {
    challenge: "SQLを使ってデータの挿入や検索、更新など基本的なデータベース操作を試してみる",
    goal: "データベース設計を理解する",
    goal_memo: "データベース操作の理解は、データ駆動なアプリケーションの開発に不可欠です。",
    assignment: "SQLを使用した基本的な操作は理解できたが、複雑なクエリやデータベース設計の最適化が難しかった。データベースの正確な設計と効率的な操作に関する知識を深めたいです。"
  },
  "フレームワーク利用" => {
    challenge: "特定のフレームワークを使ってプロジェクトに取り組み、基本的な機能を実装する",
    goal: "フレームワークの理解を深める",
    goal_memo: "フレームワークの理解は、大規模なプロジェクトの開発をスムーズに進めるために役立ちます。",
    assignment: "フレームワークの基本的な使い方は理解できたが、実際のプロジェクトに適用する際には設定や構成が難しかった。フレームワークを効果的に利用して、より効率的な開発ができるようになりたいです。"
  },
  "配列と繰り返し" => {
    challenge: "配列を使ってデータを格納し、繰り返し処理を行うコードを書いてみる",
    goal: "配列と繰り返し処理の基本を理解する",
    goal_memo: "配列と繰り返し処理は、効率的なデータ操作に欠かせません。",
    assignment: "基本的な配列と繰り返し処理は理解できたが、より高度な操作や効率的なアルゴリズムの導入が課題となりました。これらの概念を応用して複雑なデータ操作ができるようになりたいです。"
  },
  "モジュールとミックスイン" => {
    challenge: "モジュールを定義し、ミックスインを利用してクラスに機能を追加するコードを書いてみる",
    goal: "モジュールとミックスインの使い方を理解する",
    goal_memo: "モジュールとミックスインは、コードの再利用性と拡張性を高めるのに役立ちます。",
    assignment: "モジュールとミックスインの基本的な使い方は理解できたが、実際のプロジェクトでこれらを適切に活用する方法が不明瞭でした。より複雑なシナリオでモジュールとミックスインを効果的に利用できるように学びたいです。"
  },
  "エラーハンドリング" => {
    challenge: "異常な状況に対処するために例外処理を導入したコードを書いてみる",
    goal: "エラーハンドリングの重要性を理解する",
    goal_memo: "エラーハンドリングは、安定したプログラムの実現に不可欠です。",
    assignment: "基本的な例外処理の導入は理解できたが、複雑なシステムでのエラーハンドリングやログ管理の実践的な側面が難しいと感じました。より洗練されたエラーハンドリングの手法を習得して、信頼性の高いプログラムを開発できるようになりたいです。"
  },
  "テスト駆動開発(TDD)" => {
    challenge: "RSpecやMinitestを使って、テスト駆動開発の手法に基づいてコードを書いてみる",
    goal: "テスト駆動開発のプロセスを体験する",
    goal_memo: "TDDは信頼性の高いソフトウェアの開発に貢献します。",
    assignment: "基本的なTDDのプロセスは理解できたが、テストの書き方やユニットテストと統合テストのバランスが難しいと感じました。より効果的なTDDの手法やテストの自動化について学習して、高品質なコードを迅速に開発できるようになりたいです。"
  },
  "コードリーディング" => {
    challenge: "他人のコードを読んで機能や仕組みを理解し、コメントやドキュメンテーションを作成する",
    goal: "コードリーディングのスキルを向上させる",
    goal_memo: "他人のコードを理解することは、学習と協力のために重要です。",
    assignment: "他人のコードを読む際に、コードの構造や設計をより深く理解し、他の開発者とのコミュニケーションを向上させるために適切なコメントやドキュメンテーションを付ける方法を学びたいです。"
  }
}

# 作成するデータの数
num_notes = 5

num_notes.times do
  # ランダムなトピック(タイトル名)を選択
  selected_topic = topic_data.keys.sample

  # 選択されたトピックのデータを取得
  topic_challenge_goal_tags = topic_data[selected_topic]

  # ノートのデータ
  note_data = {
    title: "#{selected_topic}",
    status: [true, false].sample,
    user_id:  User.all.sample.id,
    score: rand(-1.0..1.0),
    created_at: user.created_at.to_date,
  }

  # ノートを作成する
  note = Note.new(note_data)

  # アクションテキスト内のデータを作成
  # topic_challenge_goal_tags内の値を代入
  action_text_data = {
    name: "content",
    body: "内容： #{selected_topic}<br><br>- 学んだこと： #{topic_challenge_goal_tags[:challenge]}<br><br>  - メモ： #{topic_challenge_goal_tags[:goal_memo]}<br><br>- 課題： #{topic_challenge_goal_tags[:assignment]}<br><br>- 次回の目標： #{topic_challenge_goal_tags[:goal]}",
    record_type: "Note",
    record_id: note.id,
  }

  # アクションテキストを作成
  content = ActionText::RichText.new(action_text_data)
  note.content = content
  note.save

  tag_value = []
  tag_value << tags[(rand() % tags.length)].name
  # tags = tags_data.map { |tag_data| Tag.create!(tag_data) }
  # 乱数を取ってくる→tagsの %=割った数の余り(4で割ると0～3しか返ってこない)
  # 乱数を割って余った数と対応しているtagのデータが割り振られる！
  note.save_tags(tag_value)
end



#コメントデータを作成

user_comments = [
  '勉強になります。',
  'がんばれ！',
  '素晴らしい情報です。',
  '頑張ってください！',
  '学びがあります。',
  '応援しています。',
  'がんばる姿勢が素晴らしいです。',
  '頑張りが伝わってきます。',
  '素晴らしい取り組みですね。',
  '成果が出ることを期待しています。',
  'がんばりが感じられます。',
  'この情報は役立ちます！',
  'がんばる姿に感動しました。',
  '良い方向に進んでいますね。',
  'がんばりが実ると信じています。',
  '頑張っていますね！',
  '時間を無駄にした',
  '読んでも何の得るものがなかった',
]

# 1アカウントあたりのコメント数
num_comments = 6

num_comments.times do
  # ランダムなユーザーとノートを選択
  user = User.all.sample
  note = Note.all.sample

  comment_text = user_comments.sample

# 特定のコメントのみhiddenをランダム、残りはtrueに設定
# （hidden:管理者側で公開・非公開設定するカラム）
  hidden = if ['時間を無駄にした', '読んでも何の得るものがなかった'].include?(comment_text)
             [true, false].sample
           else
             true
           end

  comment_data = {
    user_id: user.id,
    text: comment_text,
    hidden: hidden,
    note_id: note.id,
    report_id: nil,
    score: rand(-1.0..1.0)
    # -1.0~1.0の間でランダムに数値を入れるようにする。
  }

  Comment.create!(comment_data)
end


# 通報データ作成

num_reports_for_records = 1

num_reports_for_records.times do
  user = User.all.sample
  
#   # ランダムにノート、レコード、コメントのいずれかを選択
  reportable_type = ["Note","Record","Comment"].sample

#   # 選択した reportable_type に応じて、対応するモデルからデータを選択
  if reportable_type == 'Comment'
    reportable = Comment.where(text: ['時間を無駄にした', '読んでも何の得るものがなかった']).sample
  elsif reportable_type == 'Note'
    reportable = Note.all.sample
  elsif reportable_type == 'Record'
    reportable = Record.all.sample
  else
  end

  report_data = {
    user_id: user.id,
    reportable_type: reportable_type,
    reportable_id: reportable.id,
    text: "不適切な内容です。",
    report_status: [true, false].sample,
    score: rand(-1.0..1.0)
  }
   # 通報を作成
  Report.create!(report_data)
end
end
# ここでユーザーモデルデータの作成が完了する
# こうしないと、以降のお気に入り登録で被りが出たときにエラー扱いとなってしまう


# ユーザーごとにランダムなNoteをお気に入りにする
User.all.each do |user|
  # Note Favoritesのseedデータ
  note_ids = Note.all.pluck(:id).sample(10)  # Noteから最大10個のランダムなnote_idを取得

  note_ids.each do |note_id|
    note_favorite_data = {
      note_id: note_id,
      user_id: user.id,
    }

    NoteFavorite.create!(note_favorite_data)
  end
end

# ユーザーごとにランダムなRecordをお気に入りにする
User.all.each do |user|
  # Record Favoritesのseedデータ
  record_favorite_data = {
    record_id: Record.all.sample.id,
    user_id: user.id,
  }

  RecordFavorite.create!(record_favorite_data)
end



# フォロー関係のseedデータ
num_users = User.count
max_followers = 5  # フォロワーの最大数

User.all.each do |follower|
  # 自分以外のユーザーからランダムに最大で5人をフォローする
  followed_users = (User.all - [follower]).sample(max_followers)

  followed_users.each do |followed|
    # フォローのseedデータ
    relationship_data = {
      follower_id: follower.id,
      followed_id: followed.id,
    }

    Relationship.create!(relationship_data)
  end
end

