# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(name: "中野優",
              email: ENV['MAIL'],
              password: ENV['PASSWORD'],
              password_confirmation: ENV['PASSWORD'])
#              
# Admin.create!(name: "中野優2",
#               email: "megurumee2@gmail.com",
#               password: "password",
#               password_confirmation: "password")
# #              
#   puts "Admin Created"

# 30.times do |n|
#   name  = Faker::Name.name
#   email = "sample-#{n+1}@email.com"
#   password = "password1"
#   phone_number = Faker::Number.number(digits: 11)
#   User.create!(
#     name: name,
#     email: email,
#     phone_number: phone_number,
#     sms_auth: false,
#     password: password,
#     password_confirmation: password,
#   )
# end

# puts "User Created"

# 30.times do |n|
#   name  = Faker::Name.name
#   email = "sample#{n+1}@email.com"
#   password = "password1"
#   phone_number = Faker::Number.number(digits: 11)
#   Owner.create!(name: name,
#     email: email,
#     phone_number: phone_number,
#     password: password,
#     password_confirmation: password,
#     #address: "東京都港区1-#{n}-1"
#   )
# end

puts "Owner Created"


Question.create!(detail: "サービス料はかかりますか？",
answer: "チケットを購入する際に代金がかかりますが、サービス料はいただいておりません。"
)
Question.create!(detail: "会員登録方法について教えてください？",
answer: "トップページの「会員登録」ボタンを押してください。「新規会員登録」画面で、「名前」、「メールアドレス」、「パスワード」、「パスワード再入力」を入力していただき、登録ボタンを押せば、登録できます。"
)
Question.create!(detail: "ログインの方法について教えてください？",
answer: "トップページのログインボタンを押してください。メールアドレスでログインする場合、ログイン画面で「メールアドレス」、「パスワード」を入力していただきログインボタンを押せば、ログインできます。その他、SNSアカウントでログインする場合、ログイン画面で「Facebookでログイン」、「LINEでログイン」、「Twitterでログイン」ボタンを押して必要項目に入力すれば各SNSからログインできます。"
)
Question.create!(detail: "ログインパスワードを変更できますか？",
answer: "できます。ログイン前にログイン入力フォームの「パスワードをお忘れですか？」文字をを押してください。「メールアドレス」を入力し変更できます。"
)
Question.create!(detail: "決済方法について教えてください？",
answer: "stripで決済できます。"
)
Question.create!(detail: "決済はいつされますか？",
answer: "決済時にクレジットカード情報の入力をしたときにされます。来月の決済は初日の決済日から１ヶ月後です。"
)

Question.create!(detail: "購入したチケットの自動更新のタイミングはいつですか？",
answer: "日付が変わる０時のタイミングです。"
)

Question.create!(detail: "購入したチケットのリセットタイミングはいつですか？",
answer: "日付が変わる０時のタイミングです。。"
)

Question.create!(detail: "表記されている金額は税込みですか？",
answer: "税込み価格となります。"
)

Question.create!(detail: "決済履歴を確認したいです？",
answer: "「マイアカウント」の「チケット履歴」ボタンから確認できます。"
)

Question.create!(detail: "解約したはずなのに料金の請求があります？",
answer: "「解約」の前にご自身でお申し込みプランが解除済みか１度ご確認ください。「解約」を行っても請求がある場合は「お問い合わせ」より巡グルメにご連絡ください。"
)

Question.create!(detail: "領収書の発行はできますか？",
answer: "決済終了後、「お問い合わせ」より巡グルメにご連絡ください。領収書を発行できます。"
)

Question.create!(detail: "購入したチケットはどこで確認できますか？",
answer: "「決済」終了後に「サブスクページ」より「チケット発券」をすることでチケットが発券され「マイアカウント」の「チケット確認」ボタンから確認できます。"
)

Question.create!(detail: "チケットは他の人と共有できますか？",
answer: "他の人との共有はできません。チケットをご購入いただいたご本人様のみのご利用いただけます。"
)

Question.create!(detail: "月の途中で解約した場合どうなりますか？",
answer: "自動更新が解除されます。すでにご購入（更新）いただいたチケットは契約期間終了までご利用いただけます。"
)

Question.create!(detail: "1度購入したチケットはキャンセルできますか？",
answer: "1度購入していただいたチケットはキャンセルできません。"
)

Question.create!(detail: "巡グルメを解約したいです手順を教えてください？",
answer: "ログイン後、マイカウント下の「解約について」ボタンを押してください。「解約する」ボタンを押せば解約できます。解約後は全てのデータが削除されますのでご注意ください。"
)



puts "Question Created"


# Subscription.create!(
#   ordinal: 2,
#   owner_id: 1,
#   category_id:  7,
#   name: "個室居酒屋　たすき　天王町駅前店",
#   recommend: true,
#   trial: true,
#   title: "個室居酒屋セット",
#   shop_introduction: "焼きたて3",
#   detail: "食べ放題3",
#   subscription_detail: "大阪",
#   price: "18000",
#   image_subscription: "karaage.jpeg",
#   address: "神奈川県横浜市保土ケ谷区天王町２-47-7 天王町駅前ビルB1",
#   food_loss: true,
#   delivery: true,
# )
# Subscription.create!(
#   ordinal: 5,
#   owner_id: 1,
#   category_id:  7,
#   name: "木村屋本店　 町田駅前店",
#   recommend: true,
#   trial: false,
#   title: "木村屋セット",
#   shop_introduction: "焼きたて3",
#   detail: "食べ放題3",
#   subscription_detail: "大阪",
#   price: "100000",
#   image_subscription: "karaage.jpeg",
#   address: "東京都町田市原町田6-13-15",
#   food_loss: true,
#   delivery: true,
# )

# Subscription.create!(
#   ordinal: 6,
#   owner_id: 1,
#   category_id:  13,
#   name: "北海道BEER&BBQ 小田急町田",
#   recommend: true,
#   trial: false,
#   title: "北海道BEER&BBQセット",
#   shop_introduction: "焼きたて3",
#   detail: "食べ放題3",
#   subscription_detail: "大阪",
#   price: "11000",
#   image_subscription: "karaage.jpeg",
#   address: "東京都町田市森野１－３９－１　グランドゥールビル　5F",
#   food_loss: true,
#   delivery: true,
# )


# puts "Subscription Created"


Category.create!(name: "和食",
                image_category: "https://cdn.pixabay.com/photo/2017/01/06/16/46/sushi-1958247__480.jpg"
                )
Category.create!(name: "洋食",
                image_category: "https://cdn.pixabay.com/photo/2016/10/23/05/40/restaurant-1762236__480.jpg"
                )
Category.create!(name: "定食",
                image_category: "https://media.istockphoto.com/photos/traditional-japanese-cuisine-picture-id1179688514?b=1&k=6&m=1179688514&s=170667a&w=0&h=BQPXTUoypII1Vkt7YdZph43vE1GvRIoVU-06r5FpUB4="
                )
  Category.create!(name: "らーめん",
                image_category: "https://cdn.pixabay.com/photo/2018/03/15/10/33/bars-ramen-in-saigon-3227779__480.jpg"
                )
Category.create!(name: "カフェ",
                image_category: "https://media.gettyimages.com/photos/cup-of-latte-on-wooden-table-picture-id1035061554?k=6&m=1035061554&s=612x612&w=0&h=R5v_cne68naf73GAyFhFq54aUiD5hMd5x6lh_KQ_c0g="
                )
Category.create!(name: "パン屋",
                image_category: "https://cdn.pixabay.com/photo/2017/04/26/11/03/bread-2262333__480.jpg"
                )
Category.create!(name: "居酒屋",
                image_category: "https://cdn.pixabay.com/photo/2019/11/15/10/05/stalls-4628091__480.jpg"
                )
Category.create!(name: "イタリアン",
                image_category: "https://cdn.pixabay.com/photo/2020/06/08/16/49/pizza-5275191__480.jpg"
                )
Category.create!(name: "中華",
                image_category: "https://media.gettyimages.com/photos/dim-sum-picture-id839958568?k=6&m=839958568&s=612x612&w=0&h=J6WOpiwMZofS02B_EYhYU8FjBjBG619qMpY99K_oDFM="
                )
Category.create!(name: "フレンチ",
                image_category: "https://cdn.pixabay.com/photo/2016/12/09/04/15/scotland-1893646__480.jpg"
                )
Category.create!(name: "ハワイアン",
                image_category: "https://media.gettyimages.com/photos/raw-fish-sushi-pokebowl-meal-with-red-napkin-picture-id665627062?k=6&m=665627062&s=612x612&w=0&h=HesE-dNsbnmgKyTimQoMRiyYuZhwvSvUw920CrRE5fw="
                )
Category.create!(name: "東南アジア",
                image_category: "https://media.gettyimages.com/photos/nasi-goreng-famous-indonesian-food-picture-id1187617921?k=6&m=1187617921&s=612x612&w=0&h=7eNOTVc4tmUj-IWizG2qTLB01mEus84XqlLL9H0ybtk="
                )
Category.create!(name: "焼肉",
                image_category: "https://media.istockphoto.com/photos/top-view-of-premium-rare-slices-many-parts-of-wagyu-a5-beef-with-on-picture-id1169410279?b=1&k=6&m=1169410279&s=170667a&w=0&h=CiQvMWUK7x73uERbummOpcLLwGYPt1W9Xi2VahlrYhE="
                )
Category.create!(name: "カレー",
                image_category: "https://media.istockphoto.com/photos/curry-rice-on-the-table-picture-id1066427100?b=1&k=6&m=1066427100&s=170667a&w=0&h=afrJvnBbrXqxUZMwtkJUeMbqenBy5YyaajWa2j-UsBk="
                )
Category.create!(name: "ハンバーガー",
                image_category: "https://media.gettyimages.com/photos/burger-picture-id1055177264?k=6&m=1055177264&s=612x612&w=0&h=Tv_R4cXvQzvPbNzKJ0C_1kyq7d19yKkMBDb07rHjIZk="
                )
Category.create!(name: "韓国料理",
                image_category: "https://media.gettyimages.com/photos/closeup-of-food-served-in-containers-on-table-picture-id946283686?k=6&m=946283686&s=612x612&w=0&h=mOwQbGo_7NxPAtPigtqOmZ5boZqWXkajmKzebPt_Qak="
                )
Category.create!(name: "お好み焼き",
                image_category: "istockphoto-95396899-170667a.jpg"
                )
Category.create!(name: "鍋",
                image_category: "korean-4147335__340.jpg"
                )
Category.create!(name: "スイーツ",
                image_category: "sweets.jpeg"
                )
Category.create!(name: "唐揚げ",
                image_category: "karaage.jpeg"
                )
Category.create!(name: "丼モノ",
                image_category: "don.jpeg"
                )
Category.create!(name: "その他",
                image_category: "https://media.gettyimages.com/photos/eating-tasty-food-favorite-meal-picture-id931464590?k=6&m=931464590&s=612x612&w=0&h=nqB6QF0fsmtiYAgb2rmBRixQowzXHe42KWSqMeIUB7g="
                )
puts "Category Created"
