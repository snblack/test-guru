class Admin::GistsController < ApplicationController
  def index
    @gists = Gist.all
  end

  def show

  end
end
