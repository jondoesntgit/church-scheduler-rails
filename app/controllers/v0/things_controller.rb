class V0::ThingsController < ApplicationController
  def index
    render json: { :things => [
      {
        :name => 'some-thing',
        :id => '1234'
      }
    ] }.to_json
  end
end
        
