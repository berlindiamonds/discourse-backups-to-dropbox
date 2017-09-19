module DiscourseDownloadFromDropbox
  class DropboxDownloader

    attr_accessor :dbx_files, :dbx, :file_id

    def initialize(file_id)
      @file_id = file_id
      @api_key = SiteSetting.discourse_sync_to_dropbox_api_key
      @turned_on = SiteSetting.discourse_sync_to_dropbox_enabled
    end

    def dbx
      @dbx ||= Dropbox::Client.new(@api_key)
    end

    def can_download?
      @turned_on && @api_key.present? && @file_id.present?
    end

    def dbx_files
      folder_name = Discourse.current_hostname
      dbx_files = dbx.list_folder("/#{folder_name}")
    end

    def json_list
      list_files = dbx_files.map do |o|
        {title: o.name, file_id: o.id, size: o.size, created_at: o.client_modified}
      end
      {"files" => list_files}.to_json
    end

    def download
      found = dbx_files.select { |f| f.id == file_id }
      file_path = found.first.path_display
      path = File.join(Backup.base_directory, found[0].name )
      dbx_backup = dbx.download(file_path)
      dbx_backup.to_s
      path
    end

  end
end
