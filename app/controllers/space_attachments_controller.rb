class SpaceAttachmentsController < ApplicationController
  before_action :set_space_attachment, only: [:show, :edit, :update, :destroy]

  def index
    @space_attachments = SpaceAttachment.all
  end

  def show
  end

  def new
    @space_attachment = SpaceAttachment.new
  end

  def edit
  end

  def create
    @space_attachment = SpaceAttachment.new(space_attachment_params)
    @space_attachment.save
  end

  def update
    @space_attachment.update(space_attachment_params)
  end

  def destroy
    @space_attachment.destroy
  end

  private
    def set_space_attachment
      @space_attachment = SpaceAttachment.find(params[:id])
    end

    def space_attachment_params
      params.require(:space_attachment).permit(:space_id, :photo)
    end
end
