class User
  @@users = []

  def initialize(user_email, age = 0)
    puts 'Wrong!' unless check_eamil(user_email)
    @email = user_email
    @age = age
    @@users << self
  end

  def self.get_users
    @@users
  end
  
  def self.find_by_email(email)
    @@users.each {
      |user| return user if user.get_email == email
    }
  end

  def get_email
    @email
  end

  def set_email(email)
    @email = email
  end

  def get_age
    @age
  end

  def set_age(age)
    @age = age
  end

  
  private
  def check_eamil(email)
    email[/\w+@\w+[^?#*,;]\.(fr|com|net)/]
  end
end