require 'encryptor'
require 'json'

module ConfigFileHandler
  attr_accessor :config

  @config = []
  def self.load_config(path="#{ENV["HOME"]}/.faceboot_config")
    if File.exists?(path)
      @config = JSON.parse(IO.read(path))
    else
      false
    end
  end

  def self.save_config!(path="#{ENV["HOME"]}/.faceboot_config")
    File.open(path, "w") {|f| f.write(JSON.generate(@config))}
    "Saved #{path}!"
  end

  class PasswordHandler
    Encryptor.default_options.merge!(:algorithm => 'bf', :key => 'none of this is actually secure')
  end
end
