module WeeklyCalendar
  class Railtie < Rails::Railtie
    initializer "weekly_calendar.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end