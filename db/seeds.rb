# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all 
Service.destroy_all
Purveyor.destroy_all
InfoWedding.destroy_all
Region.destroy_all
Todo.destroy_all
Favourite.destroy_all
Booking.destroy_all
Billing.destroy_all

User.create(
    name: 'Alfonso Lopez',
    password: 123456,
    email: 'alfonso@gmail.com',
    phone: 985674562
)

@purveyor = Purveyor.create(
    name: 'Daniela Hernandez',
    password: 123456,
    email: 'natalia@gmail.com',
    phone: 981123562
)

@purveyor2 = Purveyor.create(
    name: 'Fernando Henriquez',
    password: 123456,
    email: 'fernando@gmail.com',
    phone: 985523562
)

regiones = ["de Tarapaca","de Antofagasta", "de Atacama", "de Coquimbo", "de Valparaiso", "del Lib. Gral B. O’Higgins", "del Maule", "de Concepción", "de la Araucania", "de los Lagos", "de Aysén", "de Magallanes", "Metropolitana", "de los Rios", "de Arica y Parinacota", "del Ñuble"]
16.times do |i|
Region.create(
    name: regiones[+i]
)
end

@todo1 = Todo.create(
    name: "Fotografía",
    detail: "Tus recuerdos merecen la mejor captura",
    photo: "fotocolor.png",
    photo2: "fotoblanco.png"
)
@todo2 = Todo.create(
    name: "Video",
    detail: "Tu día es especial y merece ser retratado de forma especial",
    photo: "videocolor.png",
    photo2: "videoblanco.png"
)
@todo3 = Todo.create(
    name: "Lugares",
    detail: "Nada mejor que un buen lugar para vivir tu día de ensueño",
    photo: "altarcolor.png",
    photo2: "altarblanco.png"
)
@todo4 = Todo.create(
    name: "Automóviles",
    detail: "Aquel auto especial será testigo de su primer paseo como esposos",
    photo: "autocolor.png",
    photo2: "autoblanco.png"
)
@todo5 = Todo.create(
    name: "Ramos",
    detail: "Un pequeño detalle para que destaques aún más",
    photo: "ramocolor.png",
    photo2: "ramoblanco.png"
)
@todo6 = Todo.create(
    name: "Decoración",
    detail: "Tu matri, tu estilo",
    photo: "decoracioncolor.png",
    photo2: "decoracionblanco.png"
)

region = Region.all

Service.create(
    name: "F8 Photography",
    detail: "Lo mejor en fotografia al mejor precio",
    score: 0,
    price: 20,
    photo: "http://www.samanthamelanson.com/wp-content/uploads/2013/02/26-3432-page/Tower_hill_boylston_ma_boston_wedding_photographer-1.jpg",
    region: region.sample,
    purveyor: @purveyor,
    todo: @todo1,
    address: "Fracisco Vergara 1234, Maipú"
)

Service.create(
    name: "Rafael Cisterna",
    detail: "Arte y minimalismo en una sola captura",
    score: 0,
    price: 100,
    photo: "https://cdn0.matrimonios.cl/emp/fotos/5/2/0/9/diego-daniela-99_8_125209_v1.jpg",
    region: region.sample,
    purveyor: @purveyor,
    todo: @todo1,
    address: "Doña Leticia 1259, Quilicura"
)

Service.create(
    name: "Fave photography",
    detail: "El recuerdo de tu matrimonio como siempre soñaste",
    score: 0,
    price: 30,
    photo: "https://cdn0.matrimonios.cl/emp/fotos/5/2/0/9/rafa_8_125209.png",
    region: region.sample,
    purveyor: @purveyor,
    todo: @todo1,
    address: "Almirante barroso 456, Santiago"
)

Service.create(
    name: "Foto feliz",
    detail: "Recuerda ese dia especial de la mejor forma",
    score: 0,
    price: 100,
    photo: "https://cdn0.matrimonios.cl/emp/fotos/5/2/0/9/ilenia-alejandro-217_8_125209_v1.jpg",
    region: region.sample,
    purveyor: @purveyor2,
    todo: @todo2,
    address: "San Diego 598, Santiago"
)

Service.create(
    name: "Autonovios",
    detail: "Autonovios quiere hacer del día de su matrimonio el más especial de su vida",
    score: 0,
    price: 60,
    photo: "https://cdn0.matrimonios.cl/emp/fotos/8/1/2/0/t40_img-2696_8_118120.jpg",
    region: region.sample,
    purveyor: @purveyor2,
    todo: @todo4,
    address: "Loreto 958, Ñuñoa"
)

  if Rails.env.development?
    AdminUser.destroy_all 
    AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  end