class Event
  attr_accessor :start_date, :duration, :title, :attendees
  
  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
    @duration = duration
    @title = title
    @attendees = attendees.map { |attendee| User.new(attendee.first, attendee.last) }
  end

  def add_attendee(user)
    @attendees << user
  end
  
  def postpone_24h
    @start_date += 60*60*24
  end

  def end_date
    @start_date + @duration * 60
  end

  def is_past?
    Time.now > @start_date
  end

  def is_finished?
    Time.now > @start_date + @duration * 60
  end
  
  def in_future?
    Time.now < @start_date
  end
  
  def is_soon?
    @start_date - Time.now < 30 * 60
  end

  def to_s
    puts ">Title : #{@title}"
    puts ">Start date : #{@start_date.strftime("%H:%M:%S %d/%m/%Y")}"
    puts ">Duration : #{@duration} minutes"
    print ">Attendees : " 
    @attendees.map { |attendee| attendee.get_email }.join(',')
  end
end