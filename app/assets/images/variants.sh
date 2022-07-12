# img = 'annie-spratt-im8y4BO2hso-unsplash.jpg'

#     [
#       ['660x1000','1280w'],
#       ['500x750','1024w'],
#       ['330x500','768w'],
#       ['200x300','512w'],
#     ].map do |variant|
#       [
#         url_for(cover.variant(auto_orient: true, rotate: 0, resize: "#{variant.first}^", crop: "#{variant.first}+0+0", format: :webp)),
#         variant.last
#       ]

convert annie-spratt-im8y4BO2hso-unsplash.jpg -resize 660x1000^ -crop 660x1000+0+0 annie-spratt-im8y4BO2hso-unsplash-660.webp
convert annie-spratt-im8y4BO2hso-unsplash.jpg -resize 500x750^ -crop 500x750+0+0 annie-spratt-im8y4BO2hso-unsplash-500.webp
convert annie-spratt-im8y4BO2hso-unsplash.jpg -resize 500x750^ -crop 500x750+0+0 annie-spratt-im8y4BO2hso-unsplash-500.webp
convert annie-spratt-im8y4BO2hso-unsplash.jpg -resize 330x500^ -crop 330x500+0+0 annie-spratt-im8y4BO2hso-unsplash-330.webp
convert annie-spratt-im8y4BO2hso-unsplash.jpg -resize 200x300^ -crop 200x300+0+0 annie-spratt-im8y4BO2hso-unsplash-200.webp