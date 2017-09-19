export default {
  resource: 'admin.adminPlugins',
  map() {
    this.route('discourse-sync-to-dropbox', { resetNamespace: true }, function() {
      this.route('downloader');
    });
  }
};
