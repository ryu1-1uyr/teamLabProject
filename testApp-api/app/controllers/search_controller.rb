class SearchController < ApplicationController
  def product

    hash = {}
    query = []

    if params[:name]
      name_query = "name like :name"
      query.push(name_query)
      hash[:name] = params[:name]
    end

    if params[:category]
      category_query = "category_id = :category"
      query.push(category_query)
      hash[:category] = params[:category_id]
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


    # if params[:name] && params[:category] && params[:max] && params[:min]
    #
    #   @searched_products =  Product.where(
    #       "name LIKE ? and price >= ? and price < ? and category_id = ?",
    #       "%#{params[:name]}%",params[:min],params[:max],params[:category]
    #   )
    #
    # elsif params[:name] && params[:category] && params[:max]
    #
    #   @searched_products =  Product.where(
    #       "name LIKE ? and price < ? and category_id = ?",
    #       "%#{params[:name]}%",params[:max],params[:category]
    #   )
    #
    # elsif params[:name] && params[:category]
    #
    #   @searched_products =  Product.where(
    #       "name LIKE ? and category_id = ?",
    #       "%#{params[:name]}%",params[:category]
    #   )
    #
    # elsif params[:name]
    #
    #   @searched_products =  Product.where(
    #       "name LIKE ?",
    #       "%#{params[:name]}%"
    #   )

  end

  def test

    hash = {}
    query = []

    if params[:name]
      name_query = "name LIKE :name"
      query.push(name_query)
      hash[:name] = "%"+params[:name]+"%"
    end

    if params[:category]
      category_query = "category_id = :category"
      query.push(category_query)
      hash[:category] = params[:category_id]
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
end
