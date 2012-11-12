class LocalmotiveGenerator < ::Rails::Generators::Base
  source_root File.expand_path '../templates', __FILE__

  def create_local_directory
    template "application.rb.tt", ".local/config/application.rb"
    Dir[Rails.root.join('config/environments/*.rb')].map {|f| File.basename(f, '.rb')}.each do |env|
      @env = env
      template "environment.rb.tt", ".local/config/environments/#{env}.rb"
    end
  end

  def add_local_directory_to_gitignore
    append_to_file '.gitignore' do
      '/.local'
    end
  end
end