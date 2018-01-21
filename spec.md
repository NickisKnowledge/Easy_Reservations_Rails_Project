[X] Use the Ruby on Rails framework.
<br />
-App uses Rails 4.2.3


[X] Your models must include a has_many, a belongs_to, and a has_many :through relationship.
<br />
  -Hotel has many rooms
  <br />
  -RoomType has many rooms
  <br />
  -Room belongs to a hotel and room_type and has many reservations,
   which allow it to have many users
  <br />
  -Address belongs to a user
  <br />
  -User has many addresses and reservations, which allow them to have
   many rooms
  <br />
  -Reservation belongs to a user and a room


[X] Your models should include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
<br />
  -Validate all the attributes for a users home address
  <br />
  -Custom validate a users work address to avoid empty addresses in the db
  <br />
  -Validate the presence of a reservations virtual attributes & have
    several custom validations to filter bad reservations
  <br />
  -Validate all the attributes for a users


[X] You must include at least one class level ActiveRecord scope methods. To some extent these class scopes can be added to power a specific individual feature,
  such as "My Overdue Tasks" in a TODO application, scoping all tasks for the user by a datetime scope for overdue items, @user.tasks.overdue. Reports make for a good usage of class scopes, such as "Most Valuable Cart by Customer" where the code would implement a Cart.most_valuable and Cart.by_customer which could be combined as Cart.most_valuable.by_customer(@customer).
<br />
  Methods:
  <br />
    -Room.hotel_rooms, find all the rooms by the hotel id passed in from the
     parameter
    <br />
    -Address.remove_empty_addresses(user), removes empty work addresses created
     during registration
    <br />
    -User.from_omniauth(auth), find or creates a user that's registering or
     logging in with GitHub


[X] a> You must include a nested form that writes to an associated model through a custom attribute writer. An example of this would be a New Recipe form that allowed you to add ingredients that are unique across recipes (thereby requiring a join model, or imagine being able to see all recipes that include Chicken), along with a quantity or description of the ingredient in the recipe.
<br />
  -Nested form the has many addresses
  <br />
  -Custom attribute writer: 'addresses_attributes='

  b> On this form you would have a series of fields named recipe[ingredient_attributes][0][name] and recipe[ingredient_attributes][0][description] which would write to the recipe model through a method ingredient_attributes=. This method cannot be provided via the accepts_nested_attributes_for macro because the custom writer would be responsible for finding or creating a recipe by name and then creating the row in the join model recipe_ingredients with the recipe_id, the ingredient_id, and the description from the form.
<br />
  -Form field names are:
      <br />
      - user[addresses_attributes][0][street_1]
      <br />
      - user[addresses_attributes][0][street_2]
      <br />
      - user[addresses_attributes][0][city]
      <br />
      - user[addresses_attributes][0][state]
      <br />
      - user[addresses_attributes][0][zipcode]


[X] Your application must provide a standard user authentication, including signup, login, logout, and passwords. You can use Devise but given the complexity of that system, you should also feel free to roll your own authentication logic.
<br />
  -The User can register through the user#new & #create methods
  <br />
  -The User can log in and out through sessions#new & #destroy


[X] Your authentication system should allow login from some other service. Facebook, twitter, foursquare, github, etc...
<br />
  -A User can log in and register through GitHub

[X] You must make use of a nested resource with the appropriate RESTful URLs.
<br />
  -Nested under Rooms are: RoomType#show & Reservation#create


[X] Additionally, your nested resource must provide a form that relates to the parent resource.
  Imagine an application with user profiles. You might represent a person's profile via the RESTful URL of /profiles/1, where 1 is the primary key of the profile. If the person wanted to add pictures to their profile, you could represent that as a nested resource of /profiles/1/pictures, listing all pictures belonging to profile 1. The route /profiles/1/pictures/new would allow me to upload a new picture to profile 1. Focus on making a working application first and then adding more complexity. Making a nested URL resource like '/divisions/:id/teams/new' is great. Having a complex nested resource like 'countries/:id/sports/:id/divisions/:id/teams/new' is going to make this much harder on you.
<br />
    -Reservation#create, takes the room_id as an attribute because a user
     reserves a room of a particular type

[X] Your forms should correctly display validation errors. Your fields should be enclosed within a fields_with_errors class and error messages describing the validation failures must be present within the view.
<br />
   -Errors are displayed at the top of each page, in a large red box & the
   fields are surrounded with a red border

[X] Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. Logic present in your controllers should be encapsulated as methods in your models. Your views should use helper methods and partials to be as logic-less as possible. Follow patterns in the Rails Style Guide and the Ruby Style Guide.
