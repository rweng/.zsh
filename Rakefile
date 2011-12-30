task :setup do
  unless File.exists? "#{ENV['HOME']}/.oh-my-zsh"
    %x(git clone git@github.com:rweng/oh-my-zsh.git ~/.oh-my-zsh)
  end
  
  %x(ln -sf #{File.dirname(__FILE__)}/zshrc ~/.zshrc)
  %x(ln -sf #{File.dirname(__FILE__)}/zshenv ~/.zshenv)
end