brooke = User.create(email: "brooke@brooke.com", name: "Brooke", image_url: "https://imageproxy.themaven.net//https%3A%2F%2Fwww.history.com%2F.image%2FMTYyNDg1MjE3MTI1Mjc5Mzk4%2Ftopic-london-gettyimages-760251843-promo.jpg", bio:"I love london!", password: "pw")

bethany = User.create(email: "bethany@bethany.com", name: "Bethany", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg/1200px-La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg", bio:"I love paris!", password: "wp")


Post.create(title: "My trip to London", image_url:"https://cdn.londonandpartners.com/visit/general-london/areas/river/76709-640x360-houses-of-parliament-and-london-eye-on-thames-from-above-640.jpg", description:"My trip to London was great.", user_id:brooke.id)

Post.create(title: "My trip to paris", image_url:"https://images.adsttc.com/media/images/5d44/14fa/284d/d1fd/3a00/003d/large_jpg/eiffel-tower-in-paris-151-medium.jpg?1564742900", description:"My trip to paris was great.", user_id:bethany.id)
