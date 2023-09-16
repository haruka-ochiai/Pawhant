class Public::CustomerPetsController < ApplicationController

  def new
    @customer = Customer.find(params[:id])
    @customer_pet = @customer.customer_pets.build
  end

  def create
    @customer = Customer.find(params[:id])
    @customer_pet = @customer.customer_pets.build(customer_pets_params)
    if @customer_pet.save
      flash[:notice] = "ペット情報を登録しました"
      redirect_to customer_path(@customer)
    else
      render "new"
    end
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer_pet = @customer.customer_pets.find(params[:customer_pets_id])
  end

  def update
    
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @customer_pet = @customer.customer_pets.find(params[:id])
    @customer_pet.destroy
    redirect_to root_path
  end

   private

  def customer_pets_params
    params.require(:customer_pet).permit(
                                         :image,
                                         :name,
                                         :pet_status,
                                         :species,
                                         :gender,
                                         :age,
                                         :weight,
                                         :characteristics
                                         )
  end



end