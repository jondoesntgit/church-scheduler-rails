class V0::ThingsController < ApplicationController
  def index
    render json: { :events => [
      {
        :roll_call => {
          :start_time => Time.now,
          :address => "Somewhere in America",
          :event_components => 
            Group.all.map {|group| {
              :title => "A group",
              :group => group.name,
              :auxiliary_text => group.users.count
             } }
        }
      }
    ] }.to_json
  end
end
        
