require 'google_drive'
class GoogleDriveService
  # First we build the session using the config file
  def self.get_session
    GoogleDrive::Session.from_service_account_key(File.join(__dir__, 'config', 'config_file.json'))
  end
  
  # next we can upload a file by passing the file_path
  def self.upload_file
    file_path = File.join(__dir__, 'files', '2.Abhidhamna.pdf')
    file_name = 'jlpt.pdf'
    session = get_session
    session.upload_from_file(file_path, file_name, convert: false)  
  end

  def self.download_file
    session = get_session
    file = session.file_by_title("jlpt.pdf")
    file.download_to_file(File.join(__dir__, 'downloads', '2.Abhidhamna.pdf'))
  end
end