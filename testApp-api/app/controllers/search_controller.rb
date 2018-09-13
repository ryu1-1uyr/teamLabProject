class SearchController < ApplicationController
  def product

    hash = {}
    query = []

    if params[:name]
      name_query = "name like :name"
      query.push(name_query)
      hash[:name] = params[:name]
    end

    if params[:category_id]
      category_query = "category_id = :category_id"
      query.push(category_query)
      hash[:category_id] = params[:category_id]
    end

    if params[:max]
      max_query = "price < :max"
      query.push(max_query)
      hash[:max] = params[:max]
    end

    if params[:min]
      min_query = "price >= :min"
      query.push(min_query)
      hash[:min] = params[:min]
    end

    if params[:gender]
      gender_query = "gender = :gender"
      query.push(gender_query)
      hash[:gender] = params[:gender]
    end


    if !query.empty?
      @searched_puroducts =Product.where(query.join(" and "),hash)
      render json:@searched_puroducts
    else
      @searched_puroducts = Product.all
      render json: @searched_puroducts
    end


  end

  def test

    hash = {}
    query = []

    if params[:name]
      name_query = "name LIKE :name"
      query.push(name_query)
      hash[:name] = "%"+params[:name]+"%"
    end

    if params[:category_id]
      category_query = "category_id = :category_id"
      query.push(category_query)
      hash[:category_id] = params[:category_id]
    end

    if params[:max]
      max_query = "price < :max"
      query.push(max_query)
      hash[:max] = params[:max]
    end

    if params[:min]
      min_query = "price >= :min"
      query.push(min_query)
      hash[:min] = params[:min]
    end

    if params[:gender]
      gender_query = "gender = :gender"
      query.push(gender_query)
      hash[:gender] = params[:gender]
    end



    if !query.empty?
      @searched_puroducts =Product.where(query.join(" and "),hash)

      if @searched_puroducts.empty?
        @searched_puroducts = Product.all
        render json: @searched_puroducts
      else
        render json:@searched_puroducts
      end

      else

      @searched_puroducts = Product.all
      render json: @searched_puroducts
    end

  end
end
