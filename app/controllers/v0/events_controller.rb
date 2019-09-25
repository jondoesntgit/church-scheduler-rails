class V0::EventsController < ApplicationController
    def index
      render json: { 
        :events => Event.all.map { |event| 
        {
          :name => event.display_name,
          :start_time => event.start_time.strftime("%Y-%m-%dT%H:%M:%S%:z"),
          :end_time => event.end_time&.strftime("%Y-%m-%dT%H:%M:%S%:z"),
          :event_components => event.assignments.map { |assignment| 
          {
            :name => assignment.name,
            :party => assignment.party.display_name,
            :auxiliary_text => assignment.auxiliary_text
          }}
        }}
      }.to_json
    end
  end
          
  