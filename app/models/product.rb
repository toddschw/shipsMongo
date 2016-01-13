class Product
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :length, type: Integer
  field :width, type: Integer
  field :height, type: Integer
  field :weight, type: Integer

  validates :name, :type, :height, :width, :length, :weight,
  presence: true

  validates :height, :width, :length, :weight,
  numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.query (query_params)
    #Step 1 - Filter out choices if they fail to meet minimum h,w,l,lb needs
    l_filtered = Product.all.reject { |r| r.length < query_params[:length] }
    w_filtered = l_filtered.reject { |r| r.width < query_params[:width] }
    h_filtered = w_filtered.reject { |r| r.height < query_params[:height] }
    lb_results = h_filtered.reject { |r| r.weight < query_params[:weight] }

    # Step 2 - Rank remaining choices once bad ones rejected
    # Decide on lxwxh as best match criteria over weight
    # return the result
    lb_results.sort! { |a,b| ( a.length + a.width + a.height ) <=> ( b.length + b.width + b.height ) }
    return lb_results.first
  end

end
