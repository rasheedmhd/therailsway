class ProductsController < ApplicationController
    def index; render html: '<div>html goes here</div>'.html_safe; end

    def show
        render html: '<div>Products/Show</div>'.html_safe
    end

    def list
        specs = params[:specs]
        print "Printing Specs :  #{specs}"
        render html: '<div>Products/list/*specs</div>'.html_safe
    end

    def query
        # @product = Product.where(*Hash[params[:info].split("/")])
        info = Hash[*params[:info].split("/")]
        print "Printing info : #{info}"
        @product = Product.where(id: 1)
        if @product.empty?
            flash[:danger] = "Product not found"
        end
        render html: '<div>Products/list/*info</div> <br/> <h3> Searching for products </h3>'.html_safe
    end 
end
