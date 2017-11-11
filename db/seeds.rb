User.create(name: 'Mallory', password: 'password',
  password_confirmation: 'password')

User.create(name: 'Joey', password: 'password',
  password_confirmation: 'password')

Hotel.create(
  name: 'The Hilton',
  amenities: 'A continental breakfast buffet is provided. Breakfast is ' \
    'based on 2 guests. Extra adults guests will be charged for breakfast.',
  photo: 'hilton_building.jpg'
)
Hotel.create(
  name: 'Best Western',
  amenities: 'A continental breakfast buffet & High-speed Internet ' \
    'access ($13.95 for a 24-hour period)',
  photo: 'bestwest_buliding.jpg'
)

roomtype_list = [
  ['Executive King', '​These signature rooms offer a spacious work desk, ' \
    'a 55-inch HDTV, a mini-fridge and ​plush  king beds. Located on the ' \
    'fifth floor in the main building and the second and third floors in ' \
    'the Tower buildings. These upper floor rooms feature a free evening ' \
    'wine and cheese reception. ​A​n iPod dock, a double vanity sink and an '\
    'illuminated mirror​ are a few of the additional features of the room.​',
    '​One King Bed', 'hilton_executive_king.jpg'],
  ['Studio Queen', '​Unwind within these cozy and quiet rooms. Located on ' \
    'the first through the fourth floors in our five-story main building, ' \
    'they are beautifully decorated with residential style furnishings, ' \
    'white pillow-top bedding, walnut wood finishes and neutral accents. ' \
    'An ergonomic work area with a desk and seating area are also featured ' \
    'in these rooms.', 'One Queen Bed', 'hilton_studio_queen.jpg'],
  ['One Bedroom Suite', 'These luxury Suites at The Hilton hotel have a ' \
    'spacious parlor, bedroom and marble bathroom with glass-enclosed ' \
    'showers and tubs. The bedroom and living room are separated by a door ' \
    'for privacy. Each of these modern suites are unique in decor, layout ' \
    'and size, but all have been updated with a sofa bed in the living room, ' \
    'flat-panel TVs, luxury linen ensembles, pillow top beds and Nespresso ' \
    'coffee machines. Also, each have windows that open and face the city ' \
    'which offer breath-taking views. Tower Building Suites may connect to ' \
    'a Executive King Room to make a 2 bedroom suite, based on availability. ' \
    'These suites are located in the Tower buildings on the third and ' \
    'fourth floors.', 'One King bed and one Full-size sofa bed',
    'hilton_1_bedroom_suite.jpg'],
  ['Two Bedroom Suite', 'The Deluxe suites offer spectacular panoramic views ' \
    'of the city. The living room is separated from one bedroom by double ' \
    'doors, the other is in its own private section. These spacious suites' \
    'appeal to guests who appreciate extra space, in addition to the Bose ' \
    'sound system, wide luggage shelf and the myriad other features that ' \
    'create the ambiance of a home-away-from-home. Their located on the top ' \
    'floors of the Tower buildings, which offers an abundance of natural ' \
    'light. These luxurious suites features spectacular marble bathroom with ' \
    'separate bath and shower, sofa bed in the living room, flat-panel TVs, ' \
    'pillow top beds and Nespresso coffee machines. Certain suites can ' \
    'connect to One Bedroom suites based on availability.', 'One King bed, ' \
    'one Queen bed, and a Queen-zise sofa bed', 'hilton_2_bedroom_suite.jpg'],
  ['Classic King', 'The Classic King rooms offer plenty of space to relax ' \
    'and rest after a long day. Specially-designed with a spacious work ' \
    'area, comfy King-sized bed and spacious bathrooms, this is a terrific ' \
    'option for the business professionals. These rooms are mainly located ' \
    'on the second floor.', 'One King bed', 'bestwest_deluxe_king.jpg'],
  ['Standard Queen', 'Classic, crisp and clean. These rooms feature plush ' \
    'furniture, polished wooden surfaces, leather accents and ample natural ' \
    'lighting. The Standard Queen rooms offer moderate accommodations for a ' \
    'maximum of two guests. Located on the first and second floors.',
    'One Queen bed', 'bestwest_standard_queen.jpg'],
  ['Double Queen', 'Spacious for up to four. Double Queen rooms offer ' \
    'accommodation for up to four guests. For families or small parties, ' \
    'everyone will enjoy ample space. These are available with two full or ' \
    'two queen-sized beds. Located on the first and second floors. Select ' \
    'rooms are available with a bathtub and shower, however all rooms ' \
    'feature a shower.', 'Two Queen bed', 'bestwest_double_queen.jpg'],
  ['Extended-stay Suite', 'Offering the greatest space and luxury of any ' \
    'of our rooms, the Extended-stay Suite is a one bedroom suite that ' \
    'comfortably hosts up to four guests. With snug King or Queen beds and ' \
    'spacious bathrooms, this is a terrific option for families or couples. ' \
    'These rooms are located only on the second floor.', 'One King or Queen ' \
    'bed and one Full-size sofa bed', 'bestwest_extended_stay_suite.jpg']
]

roomtype_list.each do |room_type|
  RoomType.create(
    name: room_type[0],
    description: room_type[1],
    beds: room_type[2],
    photo: room_type[3]
  )
end

room_list = [
  [90, 5, 1, 1],
  [75, 12, 2, 1],
  [105, 9, 3, 1],
  [120, 4, 4, 1],
  [80, 5, 5, 2],
  [70, 6, 6, 2],
  [90, 10, 7, 2],
  [100, 9, 8, 2]
]

room_list.each do |room|
  Room.create(
    room_rate: room[0],
    inventory: room[1],
    room_type_id: room[2],
    hotel_id: room[3],
  )
end

setup_addresses = [
  ['852 E Dr', '', 'Winchester', 'MN',	96541 'Home', 1],
  ['11 Broadway #260', 'Learn.co', 'New York',	'NY',	10004,	'Work', 1],
  ['123 Orchard', 'apt 14', 'Montana','MN', 6612, 'Work', 2]
]

setup_addresses.each do |address|
  Address.create(
    street_1: address[0],
    street_2: address[1],
    city: address[2],
    state: address[3],
    zipcode: address[4],
    address_type: address[5],
    user_id: address[6]
  )
end
