class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ], raise: false

  def home
    @suitable_fors = ["One2One", "Small Groups", "Big Groups"]
    @atmospheres = ["Calm", "Formal", "Casual", "luxurious"]
  end
end
