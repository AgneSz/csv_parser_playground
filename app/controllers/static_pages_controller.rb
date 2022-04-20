require 'csv' 

class StaticPagesController < ApplicationController
  def home
    # @title = CSV.read("db/netflix_titles.csv")
    @movies = CSV.foreach(("db/netflix_titles.csv"), headers: true, col_sep: ",") 
  end
end
