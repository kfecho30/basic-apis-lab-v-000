class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @res = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '0a45dd6c835edc4e28b1'
      req.params['client_secret'] = '30cd2d6589c1d57899f34520213b89824fd89cf8'
      req.params['q'] = params[:query]
    end
    binding.pry
    items = JSON.parse(@res.items)
      if @res.success?
        @results = items
      else
        @error = items["meta"]["errorDetail"]
    end
  render 'search'
  end
end
