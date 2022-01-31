# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ria.Repo.insert!(%Ria.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Ria.Repo.insert!(%Ria.Guitars.Guitar{
  type: "explorer",
  prod_year: 1984,
  img_url: "https://thumbs.static-thomann.de/thumb/thumb600x600/pics/prod/419076.jpg",
  brand: "Gibson"
})

Ria.Repo.insert!(%Ria.Guitars.Guitar{
  type: "jazzmaster",
  prod_year: 2004,
  img_url: "https://www.fmicassets.com/Damroot/ZoomJpg/10001/0379420505_sqr_ins_frt_1_rr.jpg",
  brand: "Fender"
})

Ria.Repo.insert!(%Ria.Guitars.Guitar{
  type: "stratocaster",
  prod_year: 1946,
  img_url: "https://www.fmicassets.com/Damroot/ZoomJpg/10004/0251802303_fen_ins_frt_1_rr.jpg",
  brand: "Fender"
})

Ria.Repo.insert!(%Ria.Guitars.Guitar{
  type: "les paul",
  prod_year: 1959,
  img_url: "https://static.gibson.com/product-images/USA/USAUBC849/Gold Top/front-300_600.png",
  brand: "Gibson"
})
