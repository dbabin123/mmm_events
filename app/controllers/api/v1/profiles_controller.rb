class Api::V1::ProfilesController < Api::V1::GraphitiController
  def index
    profiles = ProfileResource.all(params)
    respond_with(profiles)
  end

  def show
    profile = ProfileResource.find(params)
    respond_with(profile)
  end

  def create
    profile = ProfileResource.build(params)

    if profile.save
      render jsonapi: profile, status: 201
    else
      render jsonapi_errors: profile
    end
  end

  def update
    profile = ProfileResource.find(params)

    if profile.update_attributes
      render jsonapi: profile
    else
      render jsonapi_errors: profile
    end
  end

  def destroy
    profile = ProfileResource.find(params)

    if profile.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: profile
    end
  end
end
