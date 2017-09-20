require "email_backup_token"
require_relative "../jobs/regular/send_download_dropbox_link.rb"

class DownloadersController < Admin::AdminController
  requires_plugin 'discourse-sync-to-dropbox'
  skip_before_filter :check_xhr, only: [:show]

  def index
    dbx_list = DiscourseDownloadFromDropbox::DropboxDownloader.new(nil).json_list
    render json: dbx_list
  end

  def create
    file_id = params.fetch(:file_id)
    file_path = DiscourseDownloadFromDropbox::DropboxDownloader.new(file_id).download
    download_url = "#{url_for(controller: 'downloaders', action: 'show')}"
    Jobs.enqueue(:send_download_dropbox_link, to_address: 'teamberlindiamonds@gmail.com', dropbox_url: download_url)
    render nothing: true
  end

  def show
    file_id = params.fetch(:file_id)
    filename = DiscourseDownloadFromDropbox::DropboxDownloader.new(file_id).filename
    file_path = File.join(Backup.base_directory, filename)
    send_file file_path
  end

end
