module Trestle
  module ActiveStorage
    class AttachmentsController < Trestle::ApplicationController
      def destroy
        attachment = ::ActiveStorage::Attachment.find(params[:id])

        attachment.purge
        flash[:message] = 'The attachment was succesfully removed and purged.'
        redirect_to params[:redirect_to]
      end
    end
  end
end
