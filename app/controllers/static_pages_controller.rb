require 'csv' 

class StaticPagesController < ApplicationController
  def home
    # CSV.read does not account for headers
    # CSV.read returns array of arrays; @title[0] => header array;
    # @title[1] => first row of data, under header, @title[1]["director"] doesn't return any value as it's not a hash
    @title = CSV.read("db/netflix_titles.csv")

    # CSV.foreach account for headers; @movies.first.class => row; @movies.first.class - CSV::Row
    # CSV::Row is part an array, part hash;
    # array: @movies.first[3] => returns value for director key, but accessed by index, not by the key name;
    # hash: @movies.first["director"] => return value for director key, accessed by key as ususally in hash
    @movies = CSV.foreach(("db/netflix_titles.csv"), headers: true, col_sep: ",") 
  end
end
