# WeeklyCalendar

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'weekly_calendar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weekly_calendar

## Usage

In erb file:

    <%= week_calender(@events) do |event|%>
      <%= event.name %>
      ....
    <% end %>





## Contributing

1. Fork it ( http://github.com/<my-github-username>/weekly_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request