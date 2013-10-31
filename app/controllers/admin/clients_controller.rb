module Admin
  class ClientsController < Admin::BaseController
    def index
      @clients = Client.page(params[:page])
    end

    def show
      @client = Client.find(params[:id])
    end

    def new
      @client = Client.new
    end

    def edit
      @client = Client.find(params[:id])
    end

    def create
      @client = Client.new(params[:client])
      (@client.pic = crop_image(@client.pic)) unless params[:client][:pic].nil?
      if @client.save
        redirect_to admin_clients_path, notice: 'client was successful created'
      else
        render action: "new"
      end
    end

    def update
      @client = Client.find(params[:id])
      if @client.update_attributes(params[:client])
        unless params[:client][:pic].nil?
          @client.pic = crop_image(params[:client][:pic])
          @client.save
        end
        redirect_to admin_clients_path, notice: 'client was successful updated'
      else
        render action: "edit"
      end
    end

    def destroy
      @client = Client.find(params[:id])
      if @client.destroy
        redirect_to admin_clients_path
      end
    end
  end
end