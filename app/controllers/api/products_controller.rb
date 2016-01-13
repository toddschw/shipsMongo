class Api::ProductsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: Product.all
  end

  def query

    best_match = Product.query (product_params)

    unless best_match.nil?
      best_match = best_match.type + " - " + best_match.name
      render status: 200, json: { "Best Match" =>  best_match }
    else
      render status: 200, json: { "Sorry" =>  "No Matches Found" }
    end

  end

  def create
    product = Product.new(product_params)
    if product.save
      render status: 200, json: { message: 'Success', product: product }
    else
      render status: 422, json: { message: "Product could not be created", errors: product.errors }
    end
  end

  def update
    product = Product.find (params[:id])
    if product.update (product_params)
      render status: 200, json: { message: "Product updated", product: product }
    else
      render status: 422, json: { message: "Product could not be updated", errors: product.errors }
    end
  end

  def destroy
    product = Product.find (params[:id])
    product.destroy
    render status: 200, json: { message: "Product destroyed." }
  end

  private

  def product_params
    params.require("product").permit(:name, :type, :length, :width, :height, :weight )
  end

end
