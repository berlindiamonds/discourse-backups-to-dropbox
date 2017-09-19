require "email_backup_token"
require_relative "../jobs/regular/send_download_dropbox_link.rb"

class DownloadersController < Admin::AdminController
  requires_plugin 'discourse-sync-to-dropbox'

  def index
    dbx_list = DiscourseDownloadFromDropbox::DropboxDownloader.new(nil).json_list
    render json: dbx_list
  end

  def create
    file_id = params.fetch(:file_id)
    download_url = "#{url_for(controller: 'downloaders', action: 'create')}"
    Jobs.enqueue(:send_download_dropbox_link, to_address: 'example@email.com', dropbox_url: download_url)
    render nothing: true
  end

end
