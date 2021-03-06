module WeeklyCalendar
  module ViewHelpers

    # options:
    #   hiddent_past: with true or false value, when the value is true. display nothing in the past time gride
    #   class: table style class
    #   date_format: 

    def week_calender(events, options={}, &block)
      raise 'WeeklyCalendar requires a block to be passed in' unless block_given?
 
      opts = default_options
      options.reverse_merge! opts
      events       ||= []
      draw_calendar(events, options, block)
    end

    private

    def default_options
      {
        :class          => "table table-hover table-bordered",
        :params         => {},
        :hidden_past    => false,
        :date_format    => :short,
        :time_selector  => "starting_at",
        :select_type    => :included_by # include
      }
    end

    def time_events(time, events, time_selector, options)
      ending = time.at_end_of_hour
      if options[:select_type] == :include
        events.select { |e| time >= e.starting_at && ending <= e.ending_at }
      elsif options[:select_type] == :included_by
        events.select { |e| time <= e.starting_at && ending >= e.ending_at }
      end
    end

    def draw_calendar(events, options, block)
      # times = ['9:00','9:30', '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30']
      times = ['9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00']
    
      days = [Date.current, Date.current+1, Date.current+2]
      tags = []
      content_tag(:table, :class => options[:class]) do
        tags << content_tag(:thead, content_tag(:tr, [content_tag(:th, '')].concat(days.collect { |d| content_tag :th, d.to_s(options[:date_format]) }).join.html_safe))
        tags << content_tag(:tbody) do
          times.collect do |t|
            content_tag(:tr) do
              td_tags = []
              td_tags << content_tag(:td, t)
              td_tags << days.collect do |d|
                content_tag(:td) do
                  divs = []
                  cell_time = DateTime.civil_from_format( :local ,d.year, d.month, d.day, t.split(":")[0].to_i, t.split(":")[1].to_i, 0 )
                  curr_events = time_events(cell_time, events, options[:time_selector], options)
                  if Time.zone.now > cell_time && options[:hidden_past]
                    divs << content_tag(:div, '')
                  else
                    if curr_events.empty? && options[:empty_date]
                      divs << options[:empty_date].call(cell_time)
                    else
                      divs << curr_events.collect{|event| block.call( event ) }
                    end
                  end
                  divs.join.html_safe
                end # content_tag :td
              end
              td_tags.join.html_safe
            end # content_tag :tr
          end.join.html_safe
        end # content_tag :tbody
        tags.join.html_safe
      end # content_tag :table
    end

  end
end