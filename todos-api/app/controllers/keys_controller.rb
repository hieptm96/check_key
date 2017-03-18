class KeysController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /keys
  def index
    @keys = Key.where(status: 'pending')
    json_response(@keys)
  end

  # GET /keys/:id
  def show
    json_response(@key)
  end

  # POST /keys
  def create
    # @key = Key.create!(todo_params)
    # json_response(@key, :created)
    if (params["data"])
      data = ActiveSupport::JSON.decode(params["data"])
      @key = Key.find_by(code: data["keys"])
      if @key.update_attributes(status: 'active')
        json_response(@key.status)
      end
    end
  end

  # PUT /keys/:id
  def update
    @key.update(todo_params)
    head :no_content
  end

  # DELETE /keys/:id
  def destroy
    @key.destroy
    head :no_content
  end

  private

  def todo_params
    params.permit(:title, :created_by)
  end

  def set_todo
    @key = Key.find(params[:id])
  end
end
