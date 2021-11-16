class Api::V1::GoingsController < Api::V1::GraphitiController
  def index
    goings = GoingResource.all(params)
    respond_with(goings)
  end

  def show
    going = GoingResource.find(params)
    respond_with(going)
  end

  def create
    going = GoingResource.build(params)

    if going.save
      render jsonapi: going, status: 201
    else
      render jsonapi_errors: going
    end
  end

  def update
    going = GoingResource.find(params)

    if going.update_attributes
      render jsonapi: going
    else
      render jsonapi_errors: going
    end
  end

  def destroy
    going = GoingResource.find(params)

    if going.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: going
    end
  end
end
