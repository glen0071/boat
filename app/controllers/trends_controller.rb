class TrendsController < ApplicationController
  def index
    @mn_doc_data = MnDocData.all
  end
end
