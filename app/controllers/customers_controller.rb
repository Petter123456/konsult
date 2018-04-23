class CustomersController < ApplicationController
  def search
  # @artist = Artist.where(name: params[:term]) #run through the database and find me the artist with the right name
    #
    # @artist = Artist.where("name LIKE ?", params[:term])  #run through the database and find me the artist with the right name no matter if its lower case
    #
    # @album = Album.where("name LIKE ?", params[:term])  #run through the database and find me the artist with the right name no matter if its lower case
    # @record_labels = RecordLabel.where("name LIKE ?", params[:term])  #run through the database and find me the artist with the right name no matter if its lower case
    #
    # @result = @album + @artist + @record_labels







    #ALL THE ABOVE REFACTORED
    @result = []
    [Konsulter].each do |model|
      @result += model.where("name LIKE ?", "%#{params[:term]}%")#starts with or ends with my term
    end

  end
end
