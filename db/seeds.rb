# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "csv"
filepath = "lib/csv/atleticobotafogoformatted.csv"


atletico_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258877/bythcxxlcue6todlrqiw.png")
botafogo_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258893/lpdi90h7pivbnmjm6skh.png")
corinthians_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258900/mjhqoh4ymten8p3fy7lo.png")
cruzeiro_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258908/iqmb6tiu8apav6ispeul.png")
flamengo_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258915/vcmifovwvloxi46fg5rc.png")
fluminense_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258921/cbb4nqzmrqy5a1xyzimi.png")
gremio_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258927/amrzkop7ack1wb1jn60b.png")
internacional_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258935/sujayswngc3jv4ywoial.png")
palmeiras_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258942/n285rtx8rdwry5ovinyo.png")
santos_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258947/ygoceeeafhwfuiet8jmq.png")
sao_paulo_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258954/cxew8hv2gcz6l173unfe.png")
vasco_logo = URI.open("https://res.cloudinary.com/dbqyyc17d/image/upload/v1649258961/icwszsbjtwqazgmnt56v.png")

atletico = Club.create(name: "Atlético", city: "Belo Horizonte", state: "MG", color: "#4f4f4f")
atletico.photo.attach(io: atletico_logo, filename: 'Atletico.png', content_type: 'image/png')

botafogo = Club.create(name: "Botafogo", city: "Rio de Janeiro", state: "RJ", color: "#ababab")
botafogo.photo.attach(io: botafogo_logo, filename: 'Botafogo.png', content_type: 'image/png')

corinthians = Club.create(name: "Corinthians", city: "São Paulo", state: "SP", color: "#400838")
corinthians.photo.attach(io: corinthians_logo, filename: 'Corinthians.png', content_type: 'image/png')

cruzeiro = Club.create(name: "Cruzeiro", city: "Belo Horizonte", state: "MG", color: "#010057")
cruzeiro.photo.attach(io: cruzeiro_logo, filename: 'Cruzeiro.png', content_type: 'image/png')

flamengo = Club.create(name: "Flamengo", city: "Rio de Janeiro", state: "RJ", color: "#ab0c0c")
flamengo.photo.attach(io: flamengo_logo, filename: 'Flamengo.png', content_type: 'image/png')

fluminense = Club.create(name: "Fluminense", city: "Rio de Janeiro", state: "RJ", color: "#7a3736")
fluminense.photo.attach(io: fluminense_logo, filename: 'Fluminense.png', content_type: 'image/png')

gremio = Club.create(name: "Grêmio", city: "Porto Alegre", state: "RS", color: "#6362cc")
gremio.photo.attach(io: gremio_logo, filename: 'Gremio.png', content_type: 'image/png')

internacional = Club.create(name: "Internacional", city: "Porto Alegre", state: "RS", color: "#eb0000")
internacional.photo.attach(io: internacional_logo, filename: 'Internacional.png', content_type: 'image/png')

palmeiras = Club.create(name: "Palmeiras", city: "São Paulo", state: "SP", color: "#003809")
palmeiras.photo.attach(io: palmeiras_logo, filename: 'Palmeiras.png', content_type: 'image/png')

santos = Club.create(name: "Santos", city: "Santos", state: "SP", color: "#ffffff")
santos.photo.attach(io: santos_logo, filename: 'Santos.png', content_type: 'image/png')

sao_paulo = Club.create(name: "São Paulo", city: "São Paulo", state: "SP", color: "#ff4747")
sao_paulo.photo.attach(io: sao_paulo_logo, filename: 'São Paulo.png', content_type: 'image/png')

vasco = Club.create(name: "Vasco", city: "Rio de Janeiro", state: "RJ", color: "#000000")
vasco.photo.attach(io: vasco_logo, filename: 'Vasco.png', content_type: 'image/png')




=begin 1000.times do
  match = Match.new(home: Club.all.sample, score_home: (0..4).to_a.sample, score_away: (0..4).to_a.sample, stadium: ["Maracanã", "Pacaembu", "Mineirão"].sample, competition: ["Brasileiro", "Libertadores"].sample )
  match.away = Club.where.not(id: match.home).sample
  match.date = Date.today-rand(20000)
  if match.score_home == match.score_away
    match.result = "Empate"
  elsif match.score_home > match.score_away
    match.result = match.home.name
  else
    match.result = match.away.name
  end
  match.save!
end
=end

 CSV.foreach(filepath, headers: :first_row) do |row|
  match = Match.new(home: Club.find_by(name: row['Casa']), away: Club.find_by(name: row['Visitante']), competition: row['Competição'], date: Date.strptime(row['Data'], '%d/%m/%Y'), score_home: row['Placar'][0], score_away: row['Placar'][-1], stadium: row['Estádio'])
  if match.score_home == match.score_away
    match.result = "Empate"
  elsif match.score_home > match.score_away
    match.result = match.home.name
  else
    match.result = match.away.name
  end
  match.save!
end
