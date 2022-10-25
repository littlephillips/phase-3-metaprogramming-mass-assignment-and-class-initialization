class User

  attr_accessor :user_name, :name, :age, :location

  def initialize(user_name:, name:, age:, location:)
    @user_name = user_name
    @name = name
    @age = age
    @location = location
  end
end

twitter_user = { 
  name: "Sophie", 
  user_name: "sm_debenedetto", 
  age: 26, 
  location: "NY, NY"
}
phill = User.new(twitter_user)
puts phill.name

#lets see when data changes


new_twitter_user = {
  name: "Sophie", 
  user_name: "sm_debenedetto", 
  location: "NY, NY"
}
  User.new(new_twitter_user)
  #damn our program broke

#lets see when data changes again

newest_twitter_user = {
  name: "Sophie", 
  user_name: "sm_debenedetto", 
  age: 26, 
  location: "NY, NY", 
  bio: "I'm a programmer living in NY!"
}

User.new(newest_twitter_user)

#damn our program broke!!!

###Solve all this by using Mass Assignment & Metaprogrammin
class User
  attr_accessor :name, :user_name, :age, :location, :bio

  def initialize(attributes)
    attributes.each do |key, value| 
      # create a getter and setter by calling the attr_accessor method
      self.class.attr_accessor(key)
      self.send("#{key}=", value)  #send method calls the method name that is the key's name, with an argumment of the value.
    end
  end
end


#self.send("#{key}=", value) === instance_of_user.new = value === instance_of_user.name = "Sophie"
#send mmethod is aanother way of calling a method on an object

sophie = User.new
sophie.send("#{method_name}=", value)











